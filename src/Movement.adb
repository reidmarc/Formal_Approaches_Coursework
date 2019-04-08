package body Movement with Spark_Mode
is
   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------


   procedure DiveTheSubmarine (diveBy : in DepthMonitor;
                               currentDepth : in out DepthMonitor;
                               currentOperationStatus : in OperationStatus) is
   begin
      if ((currentDepth + diveBy) <= DepthMonitor'Last
          and currentDepth >= 0
          and currentoperationStatus = Allowed
          and diveBy > 0) then
         currentDepth := currentDepth + diveBy;
      end if;
   end DiveTheSubmarine;


   procedure RaiseTheSubmarine (riseBy : in DepthMonitor;
                                currentDepth : in out DepthMonitor) is
   begin
      if ((currentDepth - riseBy) >= DepthMonitor'First
          and currentDepth > 0
          and riseBy > 0) then
         currentDepth := currentDepth - riseBy;
      end if;
   end RaiseTheSubmarine;


   procedure SurfaceTheSubmarine (currentDepth : in out DepthMonitor) is
   begin
      if (currentDepth > 0) then
         currentDepth := currentDepth - currentDepth;
      end if;
   end SurfaceTheSubmarine;





end Movement;
