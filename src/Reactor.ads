with Submarine;
use Submarine;
with Movement;
use Movement;

package Reactor with SPARK_Mode
is
   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------
   type ReactorTempRange is range 0..100;
   reactorTemp : ReactorTempRange := 0;


   procedure ReactorTempOverheats with
     Global => (In_Out => (currentDepth, reactorTemp)),
     Pre => reactorTemp < ReactorTempRange'Last and then currentDepth > 0,
     Post => reactorTemp = ReactorTempRange'Last and then currentDepth = 0;

end Reactor;
