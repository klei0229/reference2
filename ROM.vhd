----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:01 05/20/2017 
-- Design Name: 
-- Module Name:    ROM - ROM_arch 
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
library IEEE, STD;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( I_ROM_EN 		: in  STD_LOGIC;
           I_ROM_ADDR 	: in  STD_LOGIC_VECTOR (31 downto 0);
           O_ROM_DATA 	: out STD_LOGIC_VECTOR (31 downto 0));
end ROM;

architecture ROM_arch of ROM is
	-- Define the type of ROM. It is an array of size 256.
	-- Each element of the array is an one byte STD_LOGIC_VECTOR
	type rom_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	impure function init_rom(RomFileName : in string) return rom_type is
		file fp : text;
		variable file_line : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		variable rom_count : integer := 0;
	begin
		temp_mem := (others => x"00");
		file_open(fp, RomFileName, read_mode);
		while not endfile(fp) loop
			-- read a line from a file and stores it in a line type variable
			readline(fp, file_line);
			-- read a string from the line
			read(file_line, temp_bv);
			temp_mem(rom_count)		:= to_stdlogicvector(temp_bv(7 downto 0));
			temp_mem(rom_count+1)	:= to_stdlogicvector(temp_bv(15 downto 8));
			temp_mem(rom_count+2)	:= to_stdlogicvector(temp_bv(23 downto 16));
			temp_mem(rom_count+3)	:= to_stdlogicvector(temp_bv(31 downto 24));
			rom_count := rom_count + 4;
			if rom_count >= 256 then
				exit;
			end if;
		end loop;
		file_close(fp);
		return temp_mem;
	end function;
	-- Call the function to initialize the ROM
	signal rom : rom_type := init_rom("Fibonacci.bin");
begin
	process(I_ROM_EN)
		variable index : integer;  -- index (address) to access the ROM data
	begin
		if I_ROM_EN = '1' then
			index := to_integer(unsigned(I_ROM_ADDR));
			O_ROM_DATA <= rom(index+3) & rom(index+2) & rom(index+1) & rom(index);
		end if;
	end process;
end ROM_arch;

