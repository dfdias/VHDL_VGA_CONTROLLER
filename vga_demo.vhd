library	IEEE;
use		IEEE.STD_LOGIC_1164.all;

entity vga_demo is
	port	(	CLOCK_50		:	in std_logic;
					SW					:	in std_logic_vector(17 downto 17);

					VGA_R 			:	out	std_logic_vector(7 downto 0);
					VGA_G				:	out	std_logic_vector(7 downto 0);
					VGA_B				:	out	std_logic_vector(7 downto 0);
					VGA_SYNC_N	:	out	std_logic;
					VGA_BLANK_N :	out std_logic;
					VGA_HS			:	out	std_logic;
					VGA_VS			:	out	std_logic);
end vga_demo;

architecture struct	of vga_demo is 

begin	
	core	:	entity	work.vga_controller(struct)
									port map	(	clk =>	CLOCK_50,
															reset	=> SW(17),

															--R 	=>	r, 
															--G 	=>	g,
															--B 	=>	b,

															R 	=>	"01010101",		--for test purpposes only
															G 	=>	"01010101",
															B 	=>	"01010101",

															dac_red			=>	VGA_R,
															dac_green		=>	VGA_G,
															dac_blue 		=>	VGA_B,
															dac_n_sync	=>	VGA_SYNC_N,
															dac_n_blank	=>	VGA_BLANK_N,
															vga_h_sync	=>	VGA_HS,
															vga_v_sync	=>	VGA_VS);
end struct;





