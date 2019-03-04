package body Main
with SPARK_Mode
is

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   procedure CloseOuterAirLockDoor is
   begin
      outerDoor.door := Closed;
   end CloseOuterAirLockDoor;

   procedure CloseInnerAirLockDoor is
   begin
      innerDoor.door := Closed;
   end CloseInnerAirLockDoor;

   procedure OpenOuterAirLockDoor is
   begin
      outerDoor.door := Open;
   end OpenOuterAirLockDoor;

   procedure OpenInnerAirLockDoor is
   begin
      innerDoor.door := Open;
   end OpenInnerAirLockDoor;


   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   procedure LockOuterDoor is
   begin
      outerDoor.lock := Locked;
   end LockOuterDoor;


   procedure UnlockOuterDoor is
   begin
      outerDoor.lock := Unlocked;
   end UnlockOuterDoor;


   procedure LockInnerDoor is
   begin
      innerDoor.lock := Locked;
   end LockInnerDoor;


   procedure UnlockInnerDoor is
   begin
      innerDoor.lock := Unlocked;
   end UnlockInnerDoor;


   procedure AllowOperation is
   begin
      currentOperationStatus := Allowed;
   end AllowOperation;


   procedure ProhibitOperation is
   begin
      currentOperationStatus := Prohibited;
   end ProhibitOperation;


   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------

   procedure OxygenTankLow (level : in out OxygenTank) is
      Position : TankLevelPercentage := level'Last;
   begin
      while Position > level'First loop
         level(Position) := Nothing;
         if Position = 10 then exit;
         else Position := Position - 1;
         end if;
      end loop;
      oxygenTankStatus := low;
   end OxygenTankLow;


   procedure SoundOxygenLowAlarm is
   begin
      oxygenTankLowAlarm := On;
   end SoundOxygenLowAlarm;


   procedure TurnOffOxygenLowAlarm is
   begin
      oxygenTankLowAlarm := Off;
   end TurnOffOxygenLowAlarm;


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
