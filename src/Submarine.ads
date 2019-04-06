package Submarine with SPARK_Mode
is

   -- GLOBALS
   type DepthMonitor is range 0..2000;
   currentDepth : DepthMonitor;


   type DoorStatus is (Open, Closed);
   type LockStatus is (Locked, Unlocked);

   type AirLockDoor is record
      door : DoorStatus;
      lock : LockStatus;
   end record;

   outerDoor : AirLockDoor := (door => Closed, lock => Locked);
   innerDoor : AirLockDoor := (door => Closed, lock => Locked);


   type OperationStatus is (Allowed, Prohibited);
   currentOperationStatus : OperationStatus;


   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------


   procedure OpenOuterAirLockDoor with
     Global => (In_Out => outerDoor, Input => innerDoor),
     Pre => innerDoor.door = Closed and then outerDoor.lock = Unlocked and then outerDoor.door = Closed,
     Post => outerDoor.door = Open;


   procedure OpenInnerAirLockDoor with

     Global => (In_Out => innerDoor, Input => outerDoor),
     Pre => outerDoor.door = Closed and then innerDoor.lock = Unlocked and then innerDoor.door = Closed,
     Post => innerDoor.door = Open;


   procedure CloseOuterAirLockDoor with
     Global => (In_Out => outerDoor),
     Pre => outerDoor.door = Open,
     Post => outerDoor.door = Closed;


   procedure CloseInnerAirLockDoor with
     Global => (In_Out => innerDoor),
     Pre => innerDoor.door = Open,
     Post => innerDoor.door = Closed;



   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   procedure LockOuterDoor with
     Global => (In_Out => (outerDoor, currentOperationStatus), Input => innerDoor),
     Pre => outerDoor.door = Closed and then outerDoor.lock = Unlocked,
     Post => outerDoor.lock = Locked;


   procedure UnlockOuterDoor with
     Global => (In_Out => (outerDoor, currentOperationStatus), Input => currentDepth),
     Pre => currentDepth = 0 and then outerDoor.lock = Locked,
     Post => outerDoor.lock = Unlocked and then currentOperationStatus = Prohibited;


   procedure LockInnerDoor with
     Global => (In_Out => (innerDoor, currentOperationStatus), Input => outerDoor),
     Pre => innerDoor.door = Closed and then innerDoor.lock = Unlocked,
     Post => innerDoor.lock = Locked;


   procedure UnlockInnerDoor with
     Global => (In_Out => (innerDoor, currentOperationStatus), Input => currentDepth),
     Pre => currentDepth = 0 and then innerDoor.lock = Locked,
     Post => innerDoor.lock = Unlocked and then currentOperationStatus = Prohibited;


--     procedure AllowOperation with
--       Global => (In_Out => currentOperationStatus, Input => (innerDoor, outerDoor)),
--       Pre => outerDoor.lock = Locked and then innerDoor.lock = Locked,
--       Post => currentOperationStatus = Allowed;
--
--
--     procedure ProhibitOperation with
--       Global => (In_Out => currentOperationStatus, Input => (innerDoor, outerDoor)),
--       Pre => outerDoor.lock = Unlocked or innerDoor.lock = Unlocked,
--       Post => currentOperationStatus = Prohibited;


   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------

   type Content is (Oxygen, Nothing);

   type TankLevelPercentage is range 0..100;

   type OxygenTank is array (TankLevelPercentage) of Content;

   type TankStatus is (Adequate, Low, Empty);

   oxygenTankStatus : TankStatus := Adequate;

   type Alarm is (On, Off);

   oxygenTankLowAlarm : Alarm := Off;

   type RecievedWarning is (Yes, No);

   oxygenTankWarningRecieved : RecievedWarning := No;

   procedure OxygenTankLow (level : in out OxygenTank) with
     Global => (In_Out => oxygenTankStatus),
     Pre => oxygenTankStatus = Adequate,
     Post => oxygenTankStatus = Low;


   procedure SoundOxygenLowAlarm with
     Global => (In_Out => oxygenTankLowAlarm, Input => oxygenTankStatus),
     Pre => oxygenTankLowAlarm = Off and then oxygenTankStatus = Low,
     Post => oxygenTankLowAlarm = On;


   -- Needs works to improve logic
   procedure TurnOffOxygenLowAlarm with
     Global => (In_Out => oxygenTankLowAlarm, Input => oxygenTankWarningRecieved),
     Pre => oxygenTankLowAlarm = On and then oxygenTankWarningRecieved = Yes,
     Post => oxygenTankLowAlarm = Off;




   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------
   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------
   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------

   procedure DiveTheSubmarine100ft with
     Global => (In_Out => currentDepth),
     Pre => currentDepth <= 1900 and then currentDepth >= 0,
     Post => currentDepth <= 2000 and then currentDepth >= 100;



   procedure RaiseTheSubmarine100ft with
     Global => (In_Out => currentDepth),
     Pre => currentDepth >= 100 and then currentDepth <= 2000,
     Post => currentDepth <= 1900 and then currentDepth >= 0;







   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------





end Submarine;
