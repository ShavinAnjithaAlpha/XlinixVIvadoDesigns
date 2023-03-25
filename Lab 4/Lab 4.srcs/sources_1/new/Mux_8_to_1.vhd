----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 07:22:35 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    Component Decoder_3_to_8 PORT (
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR
    );
    End Component; 

    SIGNAL D_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    Deocder_3_to_8_0 : Decoder_3_to_8 PORT MAP (
        I => S,
        EN => EN,
        Y => D_out
    );

    Y <= (D_out(0) AND D(0)) OR
         (D_out(1) AND D(1)) OR
         (D_out(2) AND D(2)) OR
         (D_out(3) AND D(3)) OR
         (D_out(4) AND D(4)) OR
         (D_out(5) AND D(5)) OR
         (D_out(6) AND D(6)) OR
         (D_out(7) AND D(7));

end Behavioral;
