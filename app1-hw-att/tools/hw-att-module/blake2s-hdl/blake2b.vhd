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
-- This is a wrapper for the 'blake2' entity. It only defines the generics as
-- needed for Blake2b
--
--------------------------------------------------------------------------------
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--
--------------------------------------------------------------------------------
--
entity blake2b is

	generic (

		MAX_MESSAGE_LENGTH : integer := 2147483647

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
		message: in std_logic_vector(128 * 8 - 1 downto 0);

		--
		-- Desired hash length in bytes
		--
		hash_len: in integer range 1 to 128;

		--
		-- Length of the key
		--
		key_len : in integer range 0 to 128*8;
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
		hash: out std_logic_vector(64 * 8 - 1 downto 0)

	);

end blake2b;
--
--------------------------------------------------------------------------------
--
architecture behav of blake2b is

	component blake2 is

		generic (

			BASE_WIDTH: integer range 32 to 64 := 64;
			COMP_ROUNDS: integer range 1 to 64 := 12;
			BLOCK_SIZE: integer range 1 to 512 := 128;
			MAX_HASH_LENGTH: integer range 1 to 2147483647 := 64;
			MAX_MESSAGE_LENGTH: integer := 2147483647

		);

		port (
			reset          : in std_logic;
			clk            : in std_logic;
			message        : in std_logic_vector(BLOCK_SIZE * 8 - 1 downto 0);
			hash_len       : in integer range 1 to MAX_HASH_LENGTH;
			key_len        : in integer range 0 to BLOCK_SIZE * 8;
			valid_in       : in std_logic;
			message_len    : in integer range 0 to MAX_MESSAGE_LENGTH;
			compress_ready : out std_logic;
			last_chunk     : in std_logic;
			valid_out      : out std_logic;
			hash           : out std_logic_vector(MAX_HASH_LENGTH * 8 - 1 downto 0)
		);

	end component;

begin

	blake2_inst : blake2

	generic map (
		BASE_WIDTH         => 64,
		COMP_ROUNDS        => 12,
		BLOCK_SIZE         => 128,
		MAX_HASH_LENGTH    => 64,
		MAX_MESSAGE_LENGTH => MAX_MESSAGE_LENGTH
	)

	port map (
		reset          => reset,
		clk            => clk,
		message        => message,
		valid_in       => valid_in,
		message_len    => message_len,
		hash_len       => hash_len,
		key_len        => key_len,
		compress_ready => compress_ready,
		last_chunk     => last_chunk,
		valid_out      => valid_out,
		hash           => hash
	);

end behav;
--
--------------------------------------------------------------------------------
