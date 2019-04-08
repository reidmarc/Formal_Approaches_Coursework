package Movement with SPARK_Mode
is

   type DepthMonitor is range 0..2000;
   type OperationStatus is (Allowed, Prohibited);



--     function MaxDepthInvariant return Boolean is
--       (currentDepth <= 2000);
--
--     function NotSurfacedInvariant return Boolean is
--        (currentDepth > 0);

   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------
   procedure DiveTheSubmarine (diveBy : in DepthMonitor;
                               currentDepth : in out DepthMonitor;
                               currentOperationStatus : in OperationStatus) with
     Pre => (currentDepth + diveBy) <= DepthMonitor'Last
     and then currentDepth >= DepthMonitor'First
     and then currentoperationStatus = Allowed
     and then diveBy > 0,

     Post => currentDepth <= DepthMonitor'Last
     and then currentDepth > DepthMonitor'First;


   procedure RaiseTheSubmarine (riseBy : in DepthMonitor;
                                currentDepth : in out DepthMonitor) with
     Pre => (currentDepth - riseBy) >= DepthMonitor'First
     and then currentDepth > DepthMonitor'First
     and then riseBy > 0,

     Post => currentDepth >= DepthMonitor'First;


   procedure SurfaceTheSubmarine (currentDepth : in out DepthMonitor) with
     Pre => currentDepth > DepthMonitor'First,
     Post => currentDepth = DepthMonitor'First;

end Movement;
