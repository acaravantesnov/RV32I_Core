library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ComponentsPkg is

  component Registers is
    port(
      rs1:        in unsigned(4 downto 0);
      rs2:        in unsigned(4 downto 0);
      rd:         in unsigned(4 downto 0);
      writeData:  in std_logic_vector(31 downto 0);
      regWriteEn: in std_logic;
      clock:			in std_logic;
      reset:      in std_logic;
      r1:         out std_logic_vector(31 downto 0);
      r2:         out std_logic_vector(31 downto 0)
     );
  end component;
    
  component ALU is
    port (
      r1:           in std_logic_vector(31 downto 0);
      r2:           in std_logic_vector(31 downto 0);
      control:      in std_logic_vector(3 downto 0);
      cOut:         out std_logic;
      overflow:     out std_logic;
      resultValue:  out std_logic_vector(31 downto 0)
    );
  end component;

  component DataMemory is
    port(
      memWriteEn: in std_logic;
      memReadEn:  in std_logic;
      address:    in std_logic_vector(31 downto 0);
      dataIn:     in std_logic_vector(31 downto 0);
      clock:      in std_logic;
      dataOut:    out std_logic_vector(31 downto 0)
    );
  end component;

end package;