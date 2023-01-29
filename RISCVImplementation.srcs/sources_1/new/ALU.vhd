library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.basic.all;
use work.ALU_ft.all;

entity ALU is
  port (
    r1:           in std_logic_vector(31 downto 0);
    r2:           in std_logic_vector(31 downto 0);
    control:      in std_logic_vector(3 downto 0);
    cout:         out std_logic;
    overflow:     out std_logic;
    resultValue:  out std_logic_vector(31 downto 0)
  );
end ALU;

architecture ALU_ARCH of ALU is
  
  signal result: std_logic_vector(32 downto 0);                    

begin

  with control select result <=
    add_ins(r1, r2) when "0000",
    std_logic_vector(sub_ins(unsigned(r1), unsigned(r2))) when "1000",
    std_logic_vector(sll_ins(unsigned(r1), unsigned(r2))) when "0001" | "1001",
    std_logic_vector(slt_ins(signed(r1), signed(r2))) when "0010" | "1010",
    std_logic_vector(sltu_ins(unsigned(r1), unsigned(r2))) when "0011" | "1011",
    ('0' & (r1 xor r2)) when "0100" | "1100",
    std_logic_vector(srl_ins(unsigned(r1), unsigned(r2))) when "0101",
    std_logic_vector(sra_ins(unsigned(r1), unsigned(r2))) when "1101",
    ('0' & (r1 or r2)) when "0110" | "1110",
    ('0' & (r1 and r2)) when "0111" | "1111",
    (others => '0') when others;
  resultValue <= result(31 downto 0);
  cout <= result(32);

end ALU_ARCH;
