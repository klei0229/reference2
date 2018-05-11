----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:56 05/14/2017 
-- Design Name: 
-- Module Name:    FSM - FSM_arch 
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

entity FSM is
    Port ( I_FSM_CLK 	: in   STD_LOGIC;
           I_FSM_EN 		: in   STD_LOGIC;
           I_FSM_INST	: in   STD_LOGIC_VECTOR (31 downto 0);
           O_FSM_IF 		: out  STD_LOGIC;
           O_FSM_ID 		: out  STD_LOGIC;
           O_FSM_EX 		: out  STD_LOGIC;
           O_FSM_ME 		: out  STD_LOGIC;
           O_FSM_WB 		: out  STD_LOGIC);
end FSM;

architecture FSM_arch of FSM is
	type state_type is (InF, ID, EX, ME, WB);	-- used InF instead of IF since IF is a keyword
	signal state : state_type := InF;
begin
	process(I_FSM_CLK)
	begin
		-- if FSM is enabled, instruction is not 0's
		if I_FSM_EN = '1' and I_FSM_INST /= (I_FSM_INST'range => '0') then
			-- and if it's the rising edge, produce correct output signals based on current state
			if rising_edge(I_FSM_CLK) then
				case state is
					when InF =>
						O_FSM_IF <= '1';
						O_FSM_ID <= '0';
						O_FSM_EX <= '0';
						O_FSM_ME <= '0';
						O_FSM_WB <= '0';
						state <= ID;
					when ID =>
						O_FSM_IF <= '0';
						O_FSM_ID <= '1';
						state <= EX;
					when EX =>
						O_FSM_ID <= '0';
						O_FSM_EX <= '1';
						state <= ME;
					when ME =>
						O_FSM_EX <= '0';
						O_FSM_ME <= '1';
						state <= WB;
					when WB =>
						O_FSM_ME <= '0';
						O_FSM_WB <= '1';
						state <= InF;
				end case;
			end if;
		end if;
	end process;
end FSM_arch;

