package body Reactor with Spark_Mode
is



   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------



   procedure P1 (s, n : in out Integer) is
   begin
      s := s + 2;
      n := n - 1;
   end P1;








end Reactor;
