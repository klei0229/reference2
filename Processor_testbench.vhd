-- Vhdl test bench created from schematic C:\Users\Ahmed\Xilinx_Lab\MipsProcessor\Processor.sch - Sun May 21 18:54:32 2017
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Processor_Processor_sch_tb IS
END Processor_Processor_sch_tb;
ARCHITECTURE behavioral OF Processor_Processor_sch_tb IS 

   COMPONENT Processor
   PORT( I_CLK	:	IN	STD_LOGIC; 
          I_EN	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL I_CLK	:	STD_LOGIC;
   SIGNAL I_EN	:	STD_LOGIC;
	
	constant CLK_period : time := 10 ns;
	
BEGIN
   UUT: Processor PORT MAP(
		I_CLK => I_CLK, 
		I_EN => I_EN
   );
	
	CLK_process: process 
	begin
		I_CLK <= '0';
		wait for CLK_period/2;
		I_CLK <= '1';
		wait for CLK_period/2;
	end process;
	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		I_EN <= '1';
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
