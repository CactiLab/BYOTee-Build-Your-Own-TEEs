----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Generate I2S audio stream
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
 
entity i2s_output is
    Port ( clk            : in  STD_LOGIC;
           -- Interface to the source of the audio
           data_l         : in  STD_LOGIC_VECTOR (15 downto 0);
           data_r         : in  STD_LOGIC_VECTOR (15 downto 0);
           data_accepted  : out  STD_LOGIC;
                      
           -- Interface out to the DAC
           i2s_sd    : out  STD_LOGIC;
           i2s_lrclk : out  STD_LOGIC;
           i2s_sclk  : out  STD_LOGIC;
           i2s_mclk  : out  STD_LOGIC);
end i2s_output;
 
architecture Behavioral of i2s_output is
   signal step      : unsigned(8 downto 0)  := (others => '0');
   signal shift_out : std_logic_vector(16 downto 0) := (others => '0');
   signal hold_r    : std_logic_vector(15 downto 0) := (others => '0');
begin
   -- Set the output signals
   i2s_lrclk <= std_logic(step(8));
   i2s_sclk  <= std_logic(step(3));
   i2s_sd    <= shift_out(shift_out'high);
 
mclk_ODDR: ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => i2s_mclk,   -- 1-bit DDR output
      C  => clk,  -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => '1',  -- 1-bit data input (positive edge)
      D2 => '0',  -- 1-bit data input (negative edge)
      R  => '0',  -- 1-bit reset input
      S  => '0'   -- 1-bit set input
   );
 
   
process(clk)
   begin
      if rising_edge(clk) then
         -- Default to telling the source to wait
         data_accepted <= '0';
         
         if step = "111111111" then
            -- start sending the left sample, and signal the source
            -- that we have started sending both channels
            shift_out(15 downto 0) <= data_l;
            hold_r                 <= data_r;
            data_accepted          <= '1';
         elsif step = "011111111" then
              -- switch to sending the right sample
              shift_out(15 downto 0) <= hold_r;
         elsif step(3 downto 0) = "1111" then
                -- Just send the next bit.
               shift_out <= shift_out(shift_out'high-1 downto 0) & '1';
         end if;
         step <= step + 1;
      end if;
   end process;
 
end Behavioral;