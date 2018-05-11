----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:21 05/15/2017 
-- Design Name: 
-- Module Name:    MUX32 - MUX32_arch 
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

entity MUX32 is
    Port ( I_MUX_0 	: in  STD_LOGIC_VECTOR (31 downto 0);
           I_MUX_1 	: in  STD_LOGIC_VECTOR (31 downto 0);
           I_MUX_Sel : in  STD_LOGIC;
           O_MUX_Out : out STD_LOGIC_VECTOR (31 downto 0));
end MUX32;

architecture MUX32_arch of MUX32 is
begin
	O_MUX_Out <= I_MUX_0 when I_MUX_Sel = '0' else I_MUX_1;
end MUX32_arch;

