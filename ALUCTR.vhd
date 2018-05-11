----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:35 05/15/2017 
-- Design Name: 
-- Module Name:    ALUCTR - ALUCTR_arch 
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

entity ALUCTR is
    Port ( I_ALU_OP 		: in   STD_LOGIC_VECTOR (1 downto 0);
           I_ALU_FUNCT 	: in   STD_LOGIC_VECTOR (5 downto 0);
           O_ALU_CTR 	: out  STD_LOGIC_VECTOR (3 downto 0));
end ALUCTR;

architecture ALUCTR_arch of ALUCTR is
begin
	process(I_ALU_OP, I_ALU_FUNCT)
	begin
		-- if I-type instruction, then add
		if I_ALU_OP = "00" then	
			O_ALU_CTR <= "0010";
			
		-- if branch instruction, then subtract
		elsif I_ALU_OP = "01" then 
			O_ALU_CTR <="0110";
			
		-- if R-type instruction, then check funct
		elsif I_ALU_OP = "10" then 
			if I_ALU_FUNCT = "100001" then 	-- if addu, then add
				O_ALU_CTR <= "0010";
			end if;
		end if;
	end process;
end ALUCTR_arch;

