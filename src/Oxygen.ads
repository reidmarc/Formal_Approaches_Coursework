with Movement;
use Movement;

package Oxygen with SPARK_Mode
is

   type Content is (Oxygen, Nothing);

   type TankLevelPercentage is range 0..100;

   type OxygenTankContainer is array (TankLevelPercentage) of Content;

   oxygenTank : OxygenTankContainer;

   type TankStatus is (Full, Adequate, Low, Empty);
   oxygenTankStatus : TankStatus := Empty;

   type Alarm is (On, Off);
   oxygenTankAlarm : Alarm := Off;

   type RecievedWarning is (Yes, No);

   oxygenTankLowWarningRecieved : RecievedWarning := No;
   oxygenTankEmptyWarningRecieved : RecievedWarning := No;


   ----------------------
   -- Fill oxygen tank --
   ----------------------
   procedure FillOxygenTank with
     Global => (In_Out => (oxygenTankStatus,oxygenTank), Input => currentDepth),
     Pre => oxygenTankStatus /= Full and then currentDepth = 0,
     Post => oxygenTankStatus = Full and then (for all J in oxygenTank'Range => oxygenTank(J) = Oxygen);


   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------
   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------
   procedure OxygenTankCheck with
     Global => (In_Out => (oxygenTankStatus, oxygenTankAlarm, oxygenTank, currentDepth)),
     Pre => oxygenTankAlarm = Off and then currentDepth /=0,
     Post => (oxygenTankStatus = Low  or oxygenTankStatus = Empty) and then oxygenTankAlarm = On;


   procedure TurnOffOxygenLowAlarm with
     Global => (In_Out => (oxygenTankAlarm, oxygenTankLowWarningRecieved)),
     Pre => oxygenTankAlarm = On and then oxygenTankLowWarningRecieved = No,
     Post => oxygenTankAlarm = Off and then oxygenTankLowWarningRecieved = Yes;




end Oxygen;
