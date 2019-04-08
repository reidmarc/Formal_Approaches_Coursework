with Movement;
use Movement;

package Oxygen with SPARK_Mode
is



   type TankLevelPercentage is range 0..100;

   type TankStatus is (Full, Adequate, Low, Empty);

   type Alarm is (On, Off);

   type RecievedWarning is (Yes, No);




   ----------------------
   -- Fill oxygen tank --
   ----------------------
   procedure FillOxygenTank (oxygenTankStatus : in out TankStatus;
                             oxygenTank : in out TankLevelPercentage;
                             currentDepth : in DepthMonitor;
                             currentOperationStatus : in out OperationStatus) with
     Pre => oxygenTankStatus /= Full
     and then currentDepth = 0,

     Post => oxygenTankStatus = Full
     and then oxygenTank = TankLevelPercentage'Last;


   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------
   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------
   procedure OxygenTankCheck (oxygenTankStatus : in out TankStatus;
                              oxygenTankAlarm : in out Alarm;
                              oxygenTank : in out TankLevelPercentage;
                              currentDepth : in out DepthMonitor;
                              currentOperationStatus : in out OperationStatus) with
     Pre => oxygenTankAlarm = Off
     and then currentDepth > DepthMonitor'First,

     Post => (oxygenTankStatus = Low  or oxygenTankStatus = Empty)
     and then oxygenTankAlarm = On;


   procedure TurnOffOxygenAlarm (oxygenTankAlarm : in out Alarm;
                                    oxygenTankLowWarningRecieved : in out RecievedWarning) with
     Pre => oxygenTankAlarm = On and then oxygenTankLowWarningRecieved = No,
     Post => oxygenTankAlarm = Off and then oxygenTankLowWarningRecieved = Yes;




end Oxygen;
