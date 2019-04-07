package Reactor with SPARK_Mode
is


   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------


   procedure P1 (s, n : in out Integer) with
     Pre=> n > Integer'First + 3 and then s <= n - 3,
     Post => s <= n;





end Reactor;
