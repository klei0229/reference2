----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:12 05/15/2017 
-- Design Name: 
-- Module Name:    REG - REG_arch 
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

entity REG is
    Port ( I_REG_EN 			: in  STD_LOGIC;
           I_REG_WE 			: in  STD_LOGIC;
           I_REG_SEL_RS 	: in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RT 	: in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RD 	: in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_DATA_RD 	: in  STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_A 	: out STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_B 	: out STD_LOGIC_VECTOR (31 downto 0));
			  
		-- Note:
		-- I_REG_EN: this signal is used when the processor wants to write into the register module
		-- I_REG_WE: this signal indicates if the current instruction needs to write to the register or not
end REG;

architecture REG_arch of REG is
	-- Creating 32 32-bit registers initialized to 0
	type data_array is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
	signal reg: data_array := (others => (others => '0'));
begin
	-- access and output the data in the registers based on the input address/register number
	O_REG_DATA_A <= reg(to_integer(unsigned(I_REG_SEL_RS)));
	O_REG_DATA_B <= reg(to_integer(unsigned(I_REG_SEL_RT)));
	process (I_REG_EN)
	begin
		-- if the register module is enabled and the write enable signal is 1
		if I_REG_EN = '1' and I_REG_WE = '1' then
			-- then write to the register at the given input address
			reg(to_integer(unsigned(I_REG_SEL_RD))) <= I_REG_DATA_RD;
		end if;
	end process;
end REG_arch;

