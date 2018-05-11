----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:05 05/14/2017 
-- Design Name: 
-- Module Name:    PC - PC_arch 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( I_PC_UPDATE 	: in   STD_LOGIC;
           I_PC 			: in   STD_LOGIC_VECTOR (31 downto 0);
           O_PC 			: out  STD_LOGIC_VECTOR (31 downto 0) := x"00000000");
				-- O_PC is initialized to output 0 to fetch the first instruction
end PC;

architecture PC_arch of PC is
begin
	process(I_PC_UPDATE)
	begin
		if I_PC_UPDATE = '1' then
			O_PC <= I_PC;
		end if;
	end process;
end PC_arch;

