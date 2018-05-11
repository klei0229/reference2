----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:14 05/15/2017 
-- Design Name: 
-- Module Name:    ALU - ALU_arch 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( I_ALU_EN 		: in  	STD_LOGIC;
           I_ALU_CTL 	: in  	STD_LOGIC_VECTOR (3 downto 0);
           I_ALU_A 		: in  	STD_LOGIC_VECTOR (31 downto 0);
           I_ALU_B 		: in  	STD_LOGIC_VECTOR (31 downto 0);
           O_ALU_Out 	: out  	STD_LOGIC_VECTOR (31 downto 0);
           O_ALU_Zero	: out  	STD_LOGIC);
end ALU;

architecture ALU_arch of ALU is
	signal ALU_OUTPUT : STD_LOGIC_VECTOR (31 downto 0);
begin
	process (I_ALU_EN)
	begin
		if I_ALU_EN = '1' then
				-- Add
				if I_ALU_CTL = "0010" then	
					ALU_OUTPUT <= STD_LOGIC_VECTOR(unsigned(I_ALU_A) + unsigned(I_ALU_B));
				-- Subtract
				elsif I_ALU_CTL = "0110" then
					ALU_OUTPUT <= STD_LOGIC_VECTOR(unsigned(I_ALU_A) - unsigned(I_ALU_B));
				end if;
		end if;
	end process;
	O_ALU_Zero <= '1' when ALU_OUTPUT = (ALU_OUTPUT'range => '0') else '0';
	O_ALU_Out <= ALU_OUTPUT;
end ALU_arch;

