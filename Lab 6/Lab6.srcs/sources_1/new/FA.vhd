----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 01:48:51 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

    COMPONENT HA PORT(
        A, B : IN std_logic;
        S, C : OUT std_logic
        );
    END COMPONENT;
    
    SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic;
    
begin

    HA0 : HA 
        PORT MAP(
            A => A,
            B => B,
            S => HA0_S,
            C => HA0_C
        );
        
    HA1 : HA 
        PORT MAP (
            A => HA0_S,
            B => C_in,
            S => HA1_S,
            C => HA1_C
        );
        
        
    S <= HA1_S;
    C_out <= HA0_C OR HA1_C;
    
end Behavioral;
