library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockTb is 
end clockTb;


architecture stim of clockTb is
	signal s_clk, s_reset :std_logic;
begin

uut:entity work.vga_controller(struct)
			port map(clk=>s_clk,reset=>s_reset);
			
			clock_proc: process
			begin 
			s_clk <='1'; wait for 20 ns;
			s_clk<='0'; wait for 20 ns;
			end process;
			
			process
			begin
				

				s_reset <= '1';
				wait for 65 ns;
				s_reset <= '0';
			

				wait;
			end process;
						
end architecture;
