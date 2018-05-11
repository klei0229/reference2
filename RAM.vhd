----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:51 05/15/2017 
-- Design Name: 
-- Module Name:    RAM - RAM_arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( I_RAM_EN 		: in  STD_LOGIC;
           I_RAM_RE 		: in  STD_LOGIC;
           I_RAM_WE 		: in  STD_LOGIC;
           I_RAM_ADDR 	: in  STD_LOGIC_VECTOR (31 downto 0);
           I_RAM_DATA 	: in  STD_LOGIC_VECTOR (31 downto 0);
           O_RAM_DATA 	: out STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture RAM_arch of RAM is
	-- Create the 256 bytes of data memory intialized to 0's.
	-- Note: Little Endian is used
	type ram_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal ram : ram_type := (others => (others => '0'));
begin
	process(I_RAM_EN) 
		variable index : integer;
	begin
		if I_RAM_EN = '1' then
			index := to_integer(unsigned(I_RAM_ADDR(7 downto 0)));  -- only last 8 bits contribute to the address
			if I_RAM_RE = '1' then
				O_RAM_DATA <= ram(index+3) & ram(index+2) & ram(index+1) & ram(index);
			elsif I_RAM_WE = '1' then
				ram(index)   <= I_RAM_DATA(7 downto 0);
				ram(index+1) <= I_RAM_DATA(15 downto 8);
				ram(index+2) <= I_RAM_DATA(23 downto 16);
				ram(index+3) <= I_RAM_DATA(31 downto 24);				
			end if;
		end if;
	end process;
end RAM_arch;

