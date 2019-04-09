with Movement;
use Movement;

package body Reactor with Spark_Mode
is

   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------
   procedure ReactorTempOverheats (reactorTemp : in out ReactorTempRange;
                                   currentDepth : in out DepthMonitor;
                                   currentOperationStatus : in out OperationStatus;
                                   reactorStatus : in out ReactorTempStatus) is
   begin
      for I in reactorTemp..ReactorTempRange'Last loop
         reactorTemp := I;
      end loop;

      if (reactorTemp = ReactorTempRange'Last) then
         currentOperationStatus := Prohibited;
         SurfaceTheSubmarine(currentDepth);
         reactorStatus := Overheating;
      end if;
   end ReactorTempOverheats;


   procedure ReactorTempCoolsdown (reactorTemp : in out ReactorTempRange;
                                   currentDepth : in DepthMonitor;
                                   currentOperationStatus : in out OperationStatus;
                                   reactorStatus : in out ReactorTempStatus) is
   begin
      if (reactorStatus = Overheating
          and currentDepth = DepthMonitor'First
          and currentOperationStatus = Prohibited) then
         for I in reverse ReactorTempRange'First..reactorTemp loop
            reactorTemp := I;
         end loop;
      end if;

      currentOperationStatus := Allowed;
      reactorStatus := Cool;
   end ReactorTempCoolsdown;




end Reactor;
