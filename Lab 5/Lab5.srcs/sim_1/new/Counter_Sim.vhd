----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2023 12:38:37 PM
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is

    COMPONENT Counter is 
        PORT (
            Dir : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (2 downto 0)
        );
    END COMPONENT;
    
    SIGNAL Dir, Res, Clk : STD_LOGIC;
    SIGNAL Q : STD_LOGIC_VECTOR (2 downto 0);
    
begin
    
    UUT: Counter PORT MAP (
        Dir => Dir,
        Res => Res,
        Clk => Clk,
        Q => Q
    );
    
    -- Clock process definitions
    clock_process :process
    begin
      Clk <= '0';
      wait for 5 ns;
      Clk <= '1';
      wait for 5 ns;
    end process;
    
    
    -- Stimiuli peocess
    stim_proc: process
    begin        
     
       Dir <= '0';
       Res <= '1';
       wait for 40 ns; -- hold the reset for 40ns    
       Res <= '0';
       WAIT FOR 280ns; -- wait until counter counts clockwise one round
       
       Dir <= '1'; -- invert the direction
       Res <= '1';
       WAIT FOR 20ns; -- hold the reset 20ns
       Res <= '0';
       wait;
    end process;
end Behavioral;
