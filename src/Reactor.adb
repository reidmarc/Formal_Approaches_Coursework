with Submarine;
use Submarine;
with Movement;
use Movement;


package body Reactor with Spark_Mode
is

   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------

   procedure ReactorTempOverheats is
   begin
      for A in ReactorTempRange loop
         reactorTemp := A;
      end loop;
      SurfaceTheSubmarine;
   end ReactorTempOverheats;

end Reactor;
