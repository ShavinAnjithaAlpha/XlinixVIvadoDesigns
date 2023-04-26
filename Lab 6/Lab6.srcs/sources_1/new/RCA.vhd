----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 02:04:32 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

    COMPONENT FA 
        PORT (
            A, B, C_in : in STD_LOGIC;
            S, C_out : out STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL C0, C1, C2 : STD_LOGIC;

begin

    FA0 : FA 
        PORT MAP (
            A => A[0],
            B => B[0],
            C_in => C_in,
            S => S[0],
            C_out => C0
        );
        
    FA1 : FA 
         PORT MAP (
            A => 
            B =>
            C_in => 
            S => 
            C_out =>
          );
                
    FA2 : FA 
         PORT MAP (
            A => 
            B =>
            C_in => 
            S => 
            C_out =>
         );
                        
    FA3 : FA 
         PORT MAP (
            A => 
            B =>
            C_in => 
            S => 
            C_out =>
         );
    

end Behavioral;
