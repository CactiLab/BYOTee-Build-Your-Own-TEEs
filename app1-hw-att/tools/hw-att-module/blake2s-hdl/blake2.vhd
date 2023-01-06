--------------------------------------------------------------------------------
--
-- VHDL implementation of the BLAKE2 Cryptographic Hash and Message
-- Authentication Code as described by Markku-Juhani O. Saarinen and
-- Jean-Philippe Aumasson in https://doi.org/10.17487/RFC7693
--
-- Authors:
--   Benedikt Tutzer
--   Dinka Milovancev
--
-- Supervisors:
--   Christian Krieg
--   Martin Mosbeck
--   Axel Jantsch
--
-- Institute of Computer Technology
-- TU Wien
-- April 2018
--
-- HOW TO USE: Split the message to be hashed into chunks of BLOCK_SIZE bytes.
-- Send them to the entity sequentially by setting the message port and raising
-- valid_in for one clock-cycle. message_len needs to be set to the number of
-- bytes that are to be hashed in total, the length of the hash can be chosen by
-- setting hash_len. After sending one chunk, wait for compress_ready to be high
-- before sending the next chunk. When the last chunk is sent, the input
-- last_chunk needs to be set to high. After the last chunk is encoded, the
-- output valid_out will be raised and the hash will be available at its output
-- port
--
--------------------------------------------------------------------------------
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--
--------------------------------------------------------------------------------
--

entity blake2 is

	generic (

		--
		-- Width of the internal state vectors
		--
		BASE_WIDTH: integer range 32 to 64 := 64;

		--
		-- Number of compression rounds to be used
		--
		COMP_ROUNDS: integer range 1 to 64 := 12;

		--
		-- Size of each message chunk
		--
		BLOCK_SIZE: integer range 1 to 512 := 128;

		--
		-- Maximal length of the hash
		--
		MAX_HASH_LENGTH: integer range 1 to 2147483647 := 64;

		--
		-- Maximal length of input messages
		--
		MAX_MESSAGE_LENGTH: integer := 2147483647

	);

	port (

		--
		-- Active-high reset signal
		--
		reset: in std_logic;
		
		--
		-- System clock
		--
		clk: in std_logic;

		--
		-- Chunk of message to be hashed
		--
		message: in std_logic_vector(BLOCK_SIZE * 8 - 1 downto 0);

		--
		-- Desired hash length in bytes
		--
		hash_len: in integer range 1 to MAX_HASH_LENGTH;

		--
		-- Length of the key
		--
		key_len : in integer range 0 to BLOCK_SIZE * 8;

		--
		-- High as long as chunks are sent
		--
		valid_in: in std_logic;

		--
		-- Number of bytes to be hashed:
		--
		--   The algorithm could handle messages up to a length of 2**128 bytes,
		--   but VHDL can not handle numbers that big. Set generic
		--   MAX_MESSAGE_LENGTH according to your needs
		--
		message_len: in integer range 0 to MAX_MESSAGE_LENGTH;

		--
		-- Ready for next chunk
		--
		compress_ready: out std_logic;

		--
		-- High when the last chunk is sent
		--
		last_chunk: in std_logic;

		--
		-- High when the output is valid
		--
		valid_out: out std_logic;

		--
		-- Generated hash in little endian
		--
		hash: out std_logic_vector(MAX_HASH_LENGTH*8-1 downto 0)

	);
end blake2;
--
--------------------------------------------------------------------------------
--
architecture behav of blake2 is

	--
	-- SIGMA as defined in RFC7693
	--

	type sig_t is array(0 to 11, 0 to 15) of INTEGER range 0 to 15;
	constant SIGMA : sig_t :=
	(
		( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15),
		(14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3),
		(11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4),
		( 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8),
		( 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13),
		( 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9),
		(12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11),
		(13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10),
		( 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5),
		(10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13, 0),
		( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15),
		(14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3)
	);

	--
	-- Indices for eight mixing rounds. One row per count, 1 column per operator
	--
	type ind_t is array(0 to 7, 0 to 5) of INTEGER range 0 to 15;
	constant ind : ind_t :=
	(
		( 0, 4, 8,12, 0, 1),
		( 1, 5, 9,13, 2, 3),
		( 2, 6,10,14, 4, 5),
		( 3, 7,11,15, 6, 7),

		( 0, 5,10,15, 8, 9),
		( 1, 6,11,12,10,11),
		( 2, 7, 8,13,12,13),
		( 3, 4, 9,14,14,15)
	);

	type arr8 is array(0 to 7) of std_logic_vector(BASE_WIDTH-1 downto 0);
	type arr8_64 is array(0 to 7) of std_logic_vector(63 downto 0);
	type arr16 is array(15 downto 0) of std_logic_vector(BASE_WIDTH-1 downto 0);
	
	--
	-- Initialization vector for Blake2
	--
	constant VI : arr8_64 :=
	(
		X"6A09E667F3BCC908",
		X"BB67AE8584CAA73B",
		X"3C6EF372FE94F82B",
		X"A54FF53A5F1D36F1",
		X"510E527FADE682D1",
		X"9B05688C2B3E6C1F",
		X"1F83D9ABFB41BD6B",
		X"5BE0CD19137E2179"
	);

	--
	-- States for the state machine
	--
	type state_type is (
		STATE_IDLE,
		STATE_PREPARE,
		STATE_WAIT,
		STATE_MIX_H,
		STATE_COMPRESS,
		STATE_MIX_A,
		STATE_MIX_B,
		STATE_DONE
	);

	signal state: state_type;

	--
	-- Persistent state vector
	--
	signal h: arr8;

	--
	-- Local state vector
	--
	signal v: arr16;

	--
	-- Current chunk of the message
	--
	signal current_chunk: std_logic_vector(BLOCK_SIZE*8-1 downto 0);

	--
	-- Specifies whether this is the last chunk or not
	--
	signal seen_last: std_logic;

	--
	-- The number of valid bytes in the message
	--
	signal total_bytes: integer range 0 to MAX_MESSAGE_LENGTH;

	--
	-- Counts compress iterations
	--
	signal ci_done: integer range 0 to COMP_ROUNDS-1 ;

	--
	-- Counts mixing iterations
	--
	signal mi_done: integer range 0 to 7;

	--
	-- Counts operations in a single mixing round
	--
	signal mio_done: std_logic_vector(1 downto 0);

	--
	-- Counts the number of bytes that have been compressed
	--
	signal compressed_bytes: std_logic_vector(BASE_WIDTH*2-1 downto 0);

	signal x : std_logic_vector(BASE_WIDTH-1 downto 0);
	signal y : std_logic_vector(BASE_WIDTH-1 downto 0);

begin

	process(clk, reset)

	begin

		if reset = '1' then

			state <= STATE_IDLE;
			current_chunk <= (others => '0');
			seen_last <= '0';
			compress_ready <= '1';
			h <= (others => (others => '0'));
			v <= (others => (others => '0'));
			compressed_bytes <= (others => '0');
			mio_done <= "00";
			valid_out <= '0';
			hash <= (others => '0');

		elsif rising_edge(clk) then

			case(state) is

				when STATE_IDLE =>

					--
					-- Initialize the persistent state vector
					--
					h(0) <= VI(0)(63 downto 64-BASE_WIDTH) xor
								((BASE_WIDTH-32-1 downto 0 => '0') & (X"0101"
								& std_logic_vector(to_unsigned(key_len,8))
								& std_logic_vector(to_unsigned(hash_len,8))));

					for i in 1 to 7 loop
						h(i) <= VI(i)(63 downto 64-BASE_WIDTH);
					end loop;

					--
					-- No bytes received yet
					--
					if valid_in = '1' then

						--
						-- If a message chunk is received, it is saved together with all
						-- inputs and the state machine moves to the 'prepare' state
						--
						state <= STATE_PREPARE;
						current_chunk <= message;
						seen_last <= last_chunk;
						ci_done <= 0;
						compress_ready <= '0';
						total_bytes <= message_len;

						--
						-- If this was the last chunk, the number of received bytes is equal
						-- to the length of the received message. Otherwise it is increased
						-- by the double base width (which is 128 for BALKE2b)
						--
						if last_chunk = '1' then
							compressed_bytes <= std_logic_vector(to_unsigned(message_len, BASE_WIDTH*2));
						else
							compressed_bytes <= std_logic_vector(unsigned(compressed_bytes) + BASE_WIDTH*2);
						end if;

						--
						-- The entity is not ready to receive new input
						--
						valid_out <= '0';

					end if;

				when STATE_PREPARE =>

					--
					-- The persistent state vector is copied onto the local
					-- state vector
					--
					for i in 0 to 7 loop
						V(i) <= h(i);
					end loop;

					V(8)  <= VI(0) (63 downto 64-BASE_WIDTH);
					V(9)  <= VI(1) (63 downto 64-BASE_WIDTH);
					V(10) <= VI(2) (63 downto 64-BASE_WIDTH);
					V(11) <= VI(3) (63 downto 64-BASE_WIDTH);

					--
					-- The number of received bytes is mixed into the vector
					--
					V(12) <= VI(4)(63 downto 64-BASE_WIDTH) xor compressed_bytes(BASE_WIDTH-1 downto 0);
					V(13) <= VI(5)(63 downto 64-BASE_WIDTH) xor	compressed_bytes(BASE_WIDTH*2-1 downto BASE_WIDTH);

					--
					-- Inverted if the last chunk is sent
					--
					if seen_last = '1' then
						V(14) <= not VI(6)(63 downto 64-BASE_WIDTH);
					else
						V(14) <= VI(6)(63 downto 64-BASE_WIDTH);
					end if;

					V(15) <= VI(7)(63 downto 64-BASE_WIDTH);

					--
					-- Reset the counter for the compression stage
					--
					ci_done <= 0;

					--
					-- Move on to the 'compress' state
					--
					state <= STATE_COMPRESS;

				when STATE_WAIT =>

					--
					-- A subsequent message chunk was received (not the first)
					--
					if valid_in = '1' then

						state <= STATE_PREPARE;
						current_chunk <= message;
						seen_last <= last_chunk;
						compress_ready <= '0';

						if last_chunk = '1' then
							compressed_bytes <= std_logic_vector(to_unsigned(message_len,BASE_WIDTH*2));
						else
							compressed_bytes <= std_logic_vector(unsigned(compressed_bytes) + BASE_WIDTH*2);
						end if;

					end if;

				when STATE_COMPRESS =>

					--
					-- Reset the counter for the mixing stage
					--
					mi_done <= 0;

					--
					-- Start mixing
					--
					state <= STATE_MIX_A;
					
					for i in 0 to BASE_WIDTH - 1 loop
						x(i) <= current_chunk(SIGMA(ci_done, ind(0, 4))*BASE_WIDTH+i);
						y(i) <= current_chunk(SIGMA(ci_done, ind(0, 5))*BASE_WIDTH+i);
					end loop;

				when STATE_MIX_A =>

					--
					-- Additions as defined by Blake2
					--
					case mio_done is

						when "11"|"01" =>
								-- c + d
								v(ind(mi_done, 2)) <= std_logic_vector(unsigned(v(ind(mi_done, 2))) + unsigned(v(ind(mi_done, 3))));
						when "00" =>
								-- a + b + x
								v(ind(mi_done, 0)) <= std_logic_vector(unsigned(v(ind(mi_done, 0))) + unsigned(v(ind(mi_done, 1))) + unsigned(x));
						when "10" =>
								-- a + b + y
								v(ind(mi_done, 0)) <= std_logic_vector(unsigned(v(ind(mi_done, 0))) + unsigned(v(ind(mi_done, 1))) + unsigned(y));
						when others =>

					end case;

					state <= STATE_MIX_B;

				when STATE_MIX_B =>

					--
					-- XORs and shifts as defined by Blake2
					--
					-- In the comments, the notation A//B is used to differentiate between values for blake2b (A) and blake2s (B)
					--
					case mio_done is

						when "00" =>
								-- d xor a ror 32//16
								v(ind(mi_done,3)) <= std_logic_vector(unsigned(v(ind(mi_done, 3)) xor v(ind(mi_done, 0))) ror BASE_WIDTH / 2);
						when "01" =>
								-- b xor c ror 24//12
								v(ind(mi_done,1)) <= std_logic_vector(unsigned(v(ind(mi_done, 1)) xor v(ind(mi_done, 2))) ror 3 * BASE_WIDTH / 8);
						when "10" =>
								-- d xor a ror 16//8
								v(ind(mi_done,3)) <= std_logic_vector(unsigned(v(ind(mi_done, 3)) xor v(ind(mi_done, 0))) ror BASE_WIDTH/4);
						when "11" =>
								-- b xor c ror 63//7
								v(ind(mi_done,1)) <= std_logic_vector(unsigned(v(ind(mi_done, 1)) xor v(ind(mi_done, 2))) ror 7 * BASE_WIDTH / 4 - 49);
						when others =>

					end case;

					--
					-- Last mix
					--
					if mi_done = 7 and mio_done = "11" then

						--
						-- Also last compression
						--
						if ci_done = COMP_ROUNDS-1 then

							--
							-- Also last chunk
							--
							if seen_last = '1' then
								state <= STATE_DONE;
							else
								state <= STATE_MIX_H;
							end if;

							--
							-- Ready to receive a new chunk
							--
							compress_ready <= '1';

						else

							--
							-- Next compression
							--
							state <= STATE_COMPRESS;
							ci_done <= ci_done + 1;

						end if;

					else

						if mio_done = "11" then
							mi_done <= mi_done + 1;
							for i in 0 to BASE_WIDTH - 1 loop
								x(i) <= current_chunk(SIGMA(ci_done, ind(mi_done+1, 4))*BASE_WIDTH+i);
								y(i) <= current_chunk(SIGMA(ci_done, ind(mi_done+1, 5))*BASE_WIDTH+i);
							end loop;
						else
							for i in 0 to BASE_WIDTH - 1 loop
								x(i) <= current_chunk(SIGMA(ci_done, ind(mi_done, 4))*BASE_WIDTH+i);
								y(i) <= current_chunk(SIGMA(ci_done, ind(mi_done, 5))*BASE_WIDTH+i);
							end loop;
						end if;

						state <= STATE_MIX_A;

					end if;

					mio_done <= std_logic_vector(unsigned(mio_done) + 1);

				when STATE_DONE =>

					--
					-- Write output
					--
					for i in 0 to 7 loop
						hash(i * BASE_WIDTH + BASE_WIDTH - 1 downto i * BASE_WIDTH) <= h(i) xor v(i) xor v(i + 8);
					end loop;

					valid_out <= '1';
					compressed_bytes <= (others => '0');
					state <= STATE_IDLE;

				when STATE_MIX_H =>

					state <= STATE_WAIT;

					--
					-- Mix into h
					--
					for i in 0 to 7 loop
						h(i) <= h(i) xor v(i) xor v(i+8);
					end loop;

				when others =>
					state <= STATE_IDLE;

			end case;

		end if;

	end process;

end behav;
