package Main
with SPARK_Mode
is

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   type DoorStatus is (Open, Closed);
   type LockStatus is (Locked, Unlocked);

   type AirLockDoor is record
      door : DoorStatus;
      lock : LockStatus;
   end record;

   outerDoor : AirLockDoor := (door => Closed, lock => Locked);
   innerDoor : AirLockDoor := (door => Closed, lock => Locked);

   -- outerDoorClosedAndLocked : AirLockDoor := (door => Closed, lock => Locked);
   -- outerDoorClosedAndUnlocked : AirLockDoor := (door => Closed, lock => Unlocked);
   -- outerDoorOpenAndUnlocked: AirLockDoor := (door => Open, lock => Unlocked);

   -- innerDoorClosedAndLocked : AirLockDoor := (door => Closed, lock => Locked);
   -- innerDoorClosedAndUnlocked : AirLockDoor := (door => Closed, lock => Unlocked);
   -- innerDoorOpenAndUnlocked: AirLockDoor := (door => Open, lock => Unlocked);

   procedure CloseOuterAirLockDoor with
     Global => (In_Out => outerDoor),
     Pre => outerDoor.door = Open,
     Post => outerDoor.door = Closed;


   procedure CloseInnerAirLockDoor with
     Global => (In_Out => innerDoor),
     Pre => innerDoor.door = Open,
     Post => innerDoor.door = Closed;


   procedure OpenOuterAirLockDoor with
     Global => (In_Out => outerDoor, Input => innerDoor),
     Pre => outerDoor.door = Closed and then outerDoor.lock = Unlocked and then innerDoor.door = Closed,
     Post => outerDoor.door = Open;


   procedure OpenInnerAirLockDoor with
     Global => (In_Out => innerDoor, Input => outerDoor),
     Pre => innerDoor.door = Closed and then innerDoor.lock = Unlocked and then outerDoor.door = Closed,
     Post => innerDoor.door = Open;


   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   type OperationStatus is (Allowed, Prohibited);

   currentOperationStatus : OperationStatus := Prohibited;

   procedure LockOuterDoor with
     Global => (In_Out => outerDoor),
     Pre => outerDoor.door = Closed and then outerDoor.lock = Unlocked,
     Post => outerDoor.lock = Locked;


   procedure UnlockOuterDoor with
     Global => (In_Out => outerDoor),
     Pre => outerDoor.lock = Locked,
     Post => outerDoor.lock = Unlocked;


   procedure LockInnerDoor with
     Global => (In_Out => innerDoor),
     Pre => innerDoor.door = Closed and then innerDoor.lock = Unlocked,
     Post => innerDoor.lock = Locked;


   procedure UnlockInnerDoor with
     Global => (In_Out => innerDoor),
     Pre => innerDoor.lock = Locked,
     Post => innerDoor.lock = Unlocked;


   procedure AllowOperation with
     Global => (Output => currentOperationStatus, Input => (innerDoor, outerDoor)),
     Pre => outerDoor.lock = Locked and then innerDoor.lock = Locked,
     Post => currentOperationStatus = Allowed;

   procedure ProhibitOperation with
     Global => (Output => currentOperationStatus, Input => (innerDoor, outerDoor)),
     Pre => outerDoor.lock = Unlocked or innerDoor.lock = Unlocked,
     Post => currentOperationStatus = Prohibited;


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

   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------












end Main;
