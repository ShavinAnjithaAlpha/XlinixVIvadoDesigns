----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:08:13 PM
-- Design Name: 
-- Module Name: RegisterSystem - Behavioral
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

entity RegisterSystem is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           in_1 : in STD_LOGIC;
           in_2 : in STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR(3 downto 0);
           Seg_data : out STD_LOGIC_VECTOR(6 downto 0));
end RegisterSystem;

architecture Behavioral of RegisterSystem is

    Component Reg_Bank 
        PORT (
            I : in STD_LOGIC_VECTOR (3 downto 0);
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
            R0 : out STD_LOGIC_VECTOR (3 downto 0);
            R1 : out STD_LOGIC_VECTOR (3 downto 0);
            R2 : out STD_LOGIC_VECTOR (3 downto 0);
            R3 : out STD_LOGIC_VECTOR (3 downto 0);
            R4 : out STD_LOGIC_VECTOR (3 downto 0);
            R5 : out STD_LOGIC_VECTOR (3 downto 0);
            R6 : out STD_LOGIC_VECTOR (3 downto 0);
            R7 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    End Component;
    
    Component Slow_Clk
        PORT(
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
        );
    End Component;
    
    Component LUT_7_Display
        PORT (
            address : in STD_LOGIC_VECTOR (3 downto 0);
            data : out STD_LOGIC_VECTOR (6 downto 0)
        );
    End Component;
    
    SIGNAL S_Clk : STD_LOGIC;
    SIGNAL R7_out : STD_LOGIC_VECTOR(3 downto 0);

begin

    Slow_Clk_0 : Slow_Clk
        PORT MAP(
            Clk_in => Clk,
            Clk_out => S_Clk
        );
        
    Reg_Bank_0 : Reg_Bank
        PORT MAP(
            I => 
            Clk => S_Clk,
            Rst => Rst,
            Reg_Enb => ,
            R0 => "0000",
            R1 => "0001",
            R2 => "0010",
            R3 => "0011",
            R4 => "0100",
            R5 => "0101",
            R6 => "0110",
            R7 => R7_out;
        );
        
    R7_out
        
    Display : LUT_7_Display
        PORT MAP(
            address => "111",
            data => Seg_data
        );

end Behavioral;