----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:24 05/14/2017 
-- Design Name: 
-- Module Name:    Control - Control_arch 
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

entity Control is
    Port ( I_CTL_EN 			: in   STD_LOGIC;
           I_CTL_INST 		: in   STD_LOGIC_VECTOR (5 downto 0);
           O_CTL_RegDst 	: out  STD_LOGIC;
           O_CTL_Branch 	: out  STD_LOGIC;
           O_CTL_MemRead 	: out  STD_LOGIC;
           O_CTL_MemtoReg 	: out  STD_LOGIC;
           O_CTL_ALUOp 		: out  STD_LOGIC_VECTOR (1 downto 0);
           O_CTL_MemWrite 	: out  STD_LOGIC;
           O_CTL_ALUSrc 	: out  STD_LOGIC;
           O_CTL_RegWrite 	: out  STD_LOGIC);
end Control;

architecture Control_arch of Control is
begin
	process(I_CTL_EN)
	begin
		if I_CTL_EN = '1' then
			-- addu
			if I_CTL_INST = "000000" then
				O_CTL_RegDst <= '1';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "10";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '0';
				O_CTL_RegWrite <= '1';
			-- addi or addiu
			elsif I_CTL_INST = "001000" or I_CTL_INST = "001001" then
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "00";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '1';
				O_CTL_RegWrite <= '1';
			-- bne
			elsif I_CTL_INST = "000101" then
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '1';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "01";
				O_CTL_MemWrite <= '0';
				O_CTL_ALUSrc <= '0';
				O_CTL_RegWrite <= '0';
			-- sw
			elsif I_CTL_INST = "101011" then
				O_CTL_RegDst <= '0';
				O_CTL_Branch <= '0';
				O_CTL_MemRead <= '0';
				O_CTL_MemtoReg <= '0';
				O_CTL_ALUOp <= "00";
				O_CTL_MemWrite <= '1';
				O_CTL_ALUSrc <= '1';
				O_CTL_RegWrite <= '0';
			end if;
		end if;
	end process;
end Control_arch;

