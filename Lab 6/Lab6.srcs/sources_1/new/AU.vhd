----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 02:20:09 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    
    COMPONENT Slow_Clk 
        PORT(
            Clk_in : IN STD_LOGIC;
            Clk_out : OUT STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT Reg 
        PORT (
            Clk, En : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
    COMPONENT RCA_4 
        PORT (
            A, B : IN STD_LOGIC_VECTOR(3 downto 0);
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 downto 0);
            C_out : OUT STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL R0_En, R1_En : STD_LOGIC;
    SIGNAL Q0, Q1, S_out : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Clk_slow : STD_LOGIC;
    
begin
    
    Slow_Clk0 : Slow_Clk 
        PORT MAP (
            Clk_in => Clk,
            Clk_out => Clk_slow
        );
    
    R0_En <= NOT RegSel;
    R1_En <= RegSel;
    
    Reg0 : Reg 
        PORT MAP (
            En => R0_En,
            Clk => Clk_slow,
            D => A,
            Q => Q0
        );
        
    Reg1 : Reg 
        PORT MAP(
            En => R1_En,
            Clk => Clk_slow,
            D => A,
            Q => Q1
        );
        
    RCA : RCA_4 
        PORT MAP(
            A => Q0,
            B => Q1,
            C_in => '0',
            S => S_out,
            C_out => Carry
        );
        
        
    Zero <= NOT(S_out(0)) AND NOT(S_out(1)) AND NOT(S_out(2)) AND NOT(S_out(3));
    S <= S_out;


end Behavioral;
