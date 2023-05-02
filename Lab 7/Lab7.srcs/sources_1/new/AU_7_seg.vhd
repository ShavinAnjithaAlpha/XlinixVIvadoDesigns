----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 03:07:05 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU_7_seg is
  Port (A : in STD_LOGIC_VECTOR (3 downto 0);
        RegSel : in STD_LOGIC;
        Clk : in STD_LOGIC;
        S_LED : out STD_LOGIC_VECTOR(3 downto 0);
        S_7Seg : out STD_LOGIC_VECTOR(6 downto 0);
        Carry : out STD_LOGIC;
        Zero : out STD_LOGIC);
end AU_7_seg;

architecture Behavioral of AU_7_seg is

    COMPONENT 
        AU PORT (
            RegSel, Clk : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(3 downto 0);
            Carry, Zero : OUT STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
    COMPONENT LUT_16_7
        PORT (
            address : IN STD_LOGIC_VECTOR(3 downto 0);
            data : OUT STD_LOGIC_VECTOR(6 downto 0)
        );
    END COMPONENT;
    
    SIGNAL AU_out : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
   AU_0 : AU PORT MAP (
      RegSel => RegSel,
      A => A,
      Clk => Clk,
      Carry => Carry,
      Zero => Zero,
      S => AU_out
   ); 
   
   LUT_16_7_0 : LUT_16_7 PORT MAP (
        address => AU_out,
        data => S_7Seg
   );
   
   S_LED <= AU_out;
    
    

end Behavioral;
