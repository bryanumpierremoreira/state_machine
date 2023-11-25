library ieee;
use ieee.std_logic_1164.all;


-- definindo a entidade
entity divisorClock is
port(clk, rst  : in std_logic;
	  clk1Hz    : out std_logic);
end divisorClock;

-- comportamento
architecture comportamento of divisorClock is
-- signals ou components
signal preset   : integer range 0 to 3 := 3;
signal counter  : integer range 0 to 3 := 0;
signal s_1Hz    : std_logic;

begin
process(clk)
begin
	if rst = '1' then
		counter <= 0;
		s_1Hz <= '0';
		clk1Hz <= '0';
		
	elsif(rising_edge(clk)) then
		--if(counter = 100000000) then
		if(counter = 3) then
			-- signal intermediario 
			s_1Hz <= not s_1Hz;
			-- saida real
			--clk1Hz <= s_1Hz;
			counter <= 0;
		else
			counter <= counter + 1;
		end if;
	
	end if;
clk1Hz <= s_1Hz;
	end process;
end comportamento;