with Movement;
use Movement;

package Reactor with SPARK_Mode
is
   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------
   type ReactorTempRange is range 0..2400;

   type ReactorTempStatus is (Overheating, Cool);

   procedure ReactorTempOverheats (reactorTemp : in out ReactorTempRange;
                                   currentDepth : in out DepthMonitor;
                                   currentOperationStatus : in out OperationStatus;
                                   reactorStatus : in out ReactorTempStatus) with
     Pre => reactorTemp < ReactorTempRange'Last
     and then currentDepth > DepthMonitor'First,

     Post => reactorTemp = ReactorTempRange'Last
     and then currentOperationStatus = Prohibited
     and then currentDepth = DepthMonitor'First
     and then reactorStatus = Overheating;


   procedure ReactorTempCoolsdown (reactorTemp : in out ReactorTempRange;
                                   currentDepth : in DepthMonitor;
                                   currentOperationStatus : in out OperationStatus;
                                   reactorStatus : in out ReactorTempStatus) with
     Pre => reactorTemp = ReactorTempRange'Last
     and then currentDepth = DepthMonitor'First
     and then currentOperationStatus = Prohibited,

     Post => currentOperationStatus = Allowed
     and then reactorStatus = Cool;

end Reactor;
