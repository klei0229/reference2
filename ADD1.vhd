----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:30 05/15/2017 
-- Design Name: 
-- Module Name:    ADD1 - ADD1_arch 
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

entity ADD1 is
    Port ( I_ADD1_A 		: in   STD_LOGIC_VECTOR (31 downto 0);
           O_ADD1_Out 	: out  STD_LOGIC_VECTOR (31 downto 0));
end ADD1;

architecture ADD1_arch of ADD1 is
begin
	O_ADD1_Out <= STD_LOGIC_VECTOR(unsigned(I_ADD1_A) + 4);
end ADD1_arch;

