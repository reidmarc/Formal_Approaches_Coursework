with Submarine;
use Submarine;


package Movement with SPARK_Mode
is
   function MaxDepthInvariant return Boolean is
     (currentDepth <= 2000);

   function NotSurfacedInvariant return Boolean is
      (currentDepth > 0);

   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------
   procedure DiveTheSubmarine100ft with
     Global => (In_Out => currentDepth, Input => currentOperationStatus),
     Pre => currentDepth <= 1900 and then currentDepth >= 0 and then currentoperationStatus = Allowed,
     Post => currentDepth <= 2000 and then currentDepth >= 100;


   procedure DiveTheSubmarineToMaxDepth with
     Global => (In_Out => currentDepth, Input => currentOperationStatus),
     Pre => currentDepth < 2000 and then currentOperationStatus = Allowed,
     Post => currentDepth = 2000;


   procedure RaiseTheSubmarine100ft with
     Global => (In_Out => currentDepth),
     Pre => currentDepth >= 100 and then MaxDepthInvariant,
     Post => currentDepth <= 1900 and then currentDepth >= 0;


   procedure SurfaceTheSubmarine with
     Global => (In_Out => currentDepth),
     Pre => NotSurfacedInvariant and then MaxDepthInvariant,
     Post => currentDepth = 0;

end Movement;
