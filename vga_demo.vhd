library	IEEE;
use		IEEE.STD_LOGIC_1164.all;

entity vga_demo is
	port	(	CLOCK_50		:	in std_logic;
					SW					:	in std_logic_vector(17 downto 17);

					VGA_CLK			:	out	std_logic;
					VGA_R 			:	out	std_logic_vector(7 downto 0);
					VGA_G				:	out	std_logic_vector(7 downto 0);
					VGA_B				:	out	std_logic_vector(7 downto 0);
					VGA_SYNC_N	:	out	std_logic;
					VGA_BLANK_N :	out std_logic;
					VGA_HS			:	out	std_logic;
					VGA_VS			:	out	std_logic);
end vga_demo;

architecture struct	of vga_demo is 

signal s_r, s_g, s_b : std_logic_vector(7 downto 0);
signal s_x : integer range 0 to 800-1;
signal s_y : integer range 0 to 600-1;
begin	


	core	:	entity	work.vga_controller(struct)
									port map	(	clk =>	CLOCK_50,
										
															reset	=> SW(17),

															R 	=>	s_r, 
															G 	=>	s_g,
															B 	=>	s_b,

															--R 	=>	"10001111" ,
															--G 	=>	"10001111", 
															--B 	=>	"10001111" ,
															x  => s_x,
															y  =>	s_y,	
														
															dac_clk			=>	VGA_CLK,
															dac_red			=>	VGA_R,
															dac_green		=>	VGA_G,
															dac_blue 		=>	VGA_B,
															dac_n_sync	=>	VGA_SYNC_N,
															dac_n_blank	=>	VGA_BLANK_N,
															vga_h_sync	=>	VGA_HS,
															vga_v_sync	=>	VGA_VS);

		draw	:	entity	work.vga_draws(behav)
									port map 	(	R 	=> 	s_r,
															G 	=>	s_g,
															B 	=>	s_b,
															x  	=> s_x,
															y  	=>	s_y);
end struct;





