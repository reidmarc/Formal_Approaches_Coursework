-- with Submarine;
-- use Submarine;
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
   oxygenTankLowAlarm : Alarm := Off;
   oxygenTankEmptyAlarm : Alarm := Off;

   type RecievedWarning is (Yes, No);

   oxygenTankWarningRecieved : RecievedWarning := No;


   ----------------------
   -- Fill oxygen tank --
   ----------------------

   procedure FillOxygenTank  with
     Global => (In_Out => (oxygenTankStatus,oxygenTank)),
     Pre => oxygenTankStatus /= Full,
     Post => oxygenTankStatus = Full and then (for all J in oxygenTank'Range => oxygenTank(J) = Oxygen);







   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------


   procedure OxygenTankCheck with
     Global => (In_Out => (oxygenTankStatus, oxygenTankLowAlarm, oxygenTankEmptyAlarm, oxygenTank)),
     Pre => oxygenTankLowAlarm = Off or oxygenTankEmptyAlarm = Off,
     Post => (oxygenTankStatus = Low and then oxygenTankLowAlarm = On) or
     (oxygenTankStatus = Empty and then oxygenTankEmptyAlarm = On);


   procedure TurnOffOxygenLowAlarm with
     Global => (In_Out => (oxygenTankLowAlarm, oxygenTankWarningRecieved)),
     Pre => oxygenTankLowAlarm = On and then oxygenTankWarningRecieved = No,
     Post => oxygenTankLowAlarm = Off and then oxygenTankWarningRecieved = Yes;


    ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
    ----------------------------------------------------------






end Oxygen;
