----------------------------------------------------------------------------------
-- Company: UOM
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 03/15/2023 03:07:04 PM
-- Design Name: RCA_4 
-- Module Name: TB_4_RCA - Behavioral
-- Project Name: Lab 3
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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is

    COMPONENT RCA_4
        PORT( A0, A1, A2, A3, B0, B1, B2, B3, C_in : IN STD_LOGIC;
               S0, S1, S2, S3, C_out : OUT STD_LOGIC);
    END COMPONENT;
    
    SIGNAL A0, A1, A2, A3, B0, B1, B2, B3 : std_logic;
    SIGNAL S0, S1, S2 ,S3, C_out : std_logic;

begin
    
    UUT: RCA_4 PORT MAP (
       A0 => A0,
       A1 => A1,
       A2 => A2,
       A3 => A3,
       B0 => B0,
       B1 => B1,
       B2 => B2,
       B3 => B3,
       C_in => '0',
       S0 => S0,
       S1 => S1,
       S2 => S2,
       S3 => S3,
       C_out => C_out
   );
   
   PROCESS 
   BEGIN
   
        -- My Index Number is 210077D
        -- It's binary representation is 0011 0011 0100 1001 1101
        -- so binary combinatins are
        --           1101 + 1001
        --           0100 + 0011
        
        -- A = 1001 and B = 1101
        A0 <= '1';
        A1 <= '0';
        A2 <= '0';
        A3 <= '1';
        
        B0 <= '1';
        B1 <= '0';
        B2 <= '1';
        B3 <= '1';
        WAIT FOR 100ns; -- output shoud be S = 0110 and C_out = 1
        
         -- A = 0011 and B = 0100
        A0 <= '1';
        A1 <= '1';
        A2 <= '0';
        A3 <= '0';
                        
        B0 <= '0';
        B1 <= '1';
        B2 <= '0';
        B3 <= '0';
        WAIT FOR 100ns; -- output shoud be S = 0101 and C_out = 0
        
        -- 0101 + 1011
         A0 <= '1';
         A1 <= '1';
         A2 <= '0';
         A3 <= '1';
                               
         B0 <= '1';
         B1 <= '0';
         B2 <= '1';
         B3 <= '0';
         WAIT FOR 100ns; -- output shoud be S = 0000 and C_out = 1
         
         -- 0111 + 1111 
         A0 <= '1';
         A1 <= '1';
         A2 <= '1';
         A3 <= '1';
                                        
         B0 <= '1';
         B1 <= '1';
         B2 <= '1';
         B3 <= '0';
         WAIT FOR 100ns; -- output shoud be S = 0110 and C_out = 1
         
         -- 1011 + 1101
         A0 <= '1';
         A1 <= '0';
         A2 <= '1';
         A3 <= '1';
                                                 
         B0 <= '1';
         B1 <= '1';
         B2 <= '0';
         B3 <= '1';
         WAIT FOR 100ns; -- output shoud be S = 1000 and C_out = 1
         
         -- 1111 + 0011
         A0 <= '1';
         A1 <= '1';
         A2 <= '0';
         A3 <= '0';
                                                         
         B0 <= '1';
         B1 <= '1';
         B2 <= '1';
         B3 <= '1';
         WAIT FOR 100ns; -- output shoud be S = 0010 and C_out = 1
         
         -- 1001 + 1111
         A0 <= '1';
         A1 <= '1';
         A2 <= '1';
         A3 <= '1';
                                                                   
         B0 <= '1';
         B1 <= '0';
         B2 <= '0';
         B3 <= '1';
         WAIT FOR 100ns; -- output shoud be S = 1000 and C_out = 1
         
         -- 1111 + 1111
         A0 <= '1';
         A1 <= '1';
         A2 <= '1';
         A3 <= '1';
                                                          
         B0 <= '1';
         B1 <= '1';
         B2 <= '1';
         B3 <= '1';
         WAIT FOR 100ns; -- output shoud be S = 1110 and C_out = 1
        
        
      WAIT;
      END PROCESS;
        

end Behavioral;

   
