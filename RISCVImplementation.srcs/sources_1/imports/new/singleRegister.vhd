library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.basic.all;

entity singleRegister is
  port(
    input:      in std_logic_vector(31 downto 0);
    writeEn:    in std_logic;
    clock:      in std_logic;
    reset:      in std_logic;
    output:     out std_logic_vector(31 downto 0)
  );
end singleRegister;

architecture singleRegister_ARCH of singleRegister is

begin

  SINGLEREGISTER_DRIVER: process(reset, clock)
  begin
    if (reset = ACTIVE) then
      output <= (others => '0');
    elsif (rising_edge(clock)) then
      if (writeEn = ACTIVE) then
        output <= input;
      end if;
    end if;
  end process SINGLEREGISTER_DRIVER;

end singleRegister_ARCH;