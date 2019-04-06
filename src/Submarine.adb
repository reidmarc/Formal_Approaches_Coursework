package body Submarine with Spark_Mode
is

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------


   procedure OpenOuterAirLockDoor is
   begin
      if (innerDoor.door = Closed and outerDoor.lock = Unlocked) then
         outerDoor.door := Open;
      end if;
   end OpenOuterAirLockDoor;


   procedure OpenInnerAirLockDoor is
   begin
      if (outerDoor.door = Closed and innerDoor.lock = Unlocked) then
         innerDoor.door := Open;
      end if;
   end OpenInnerAirLockDoor;


   procedure CloseOuterAirLockDoor is
   begin
      if (outerDoor.door = Open) then
         outerDoor.door := Closed;
      end if;
   end CloseOuterAirLockDoor;


   procedure CloseInnerAirLockDoor is
   begin
      if (innerDoor.door = Open) then
         innerDoor.door := Closed;
      end if;
   end CloseInnerAirLockDoor;


   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------


   procedure LockOuterDoor is
   begin
      if (outerDoor.door = Closed and outerDoor.lock = Unlocked) then
         outerDoor.lock := Locked;
         if (innerDoor.lock = Locked) then
            currentOperationStatus := Allowed;
         end if;
      end if;
   end LockOuterDoor;


   procedure UnlockOuterDoor is
   begin
      if (outerDoor.lock = Locked and currentDepth = 0) then
         outerDoor.lock := Unlocked;
         currentOperationStatus := Prohibited;
      end if;
   end UnlockOuterDoor;


   procedure LockInnerDoor is
   begin
      if (innerDoor.door = Closed and innerDoor.lock = Unlocked) then
         innerDoor.lock := Locked;
         if (outerDoor.lock = Locked) then
            currentOperationStatus := Allowed;
         end if;
      end if;
   end LockInnerDoor;


   procedure UnlockInnerDoor is
   begin
      if (innerDoor.lock = Locked and currentDepth = 0) then
         innerDoor.lock := Unlocked;
         currentOperationStatus := Prohibited;
      end if;
   end UnlockInnerDoor;


--     procedure AllowOperation is
--     begin
--        if (outerDoor.lock = Locked and innerDoor.lock = Locked) then
--           currentOperationStatus := Allowed;
--        end if;
--     end AllowOperation;
--
--
--     procedure ProhibitOperation is
--     begin
--        if (outerDoor.lock = Unlocked or innerDoor.lock = Unlocked) then
--           currentOperationStatus := Prohibited;
--           end if;
--     end ProhibitOperation;



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


   procedure DiveTheSubmarine100ft is
   begin
      if (currentDepth <= 1900 and currentDepth >= 0) then
         currentDepth := currentDepth + 100;
      end if;
   end DiveTheSubmarine100ft;


   procedure RaiseTheSubmarine100ft is
   begin
      if (currentDepth >= 100 and currentDepth <= 2000) then
         currentDepth := currentDepth - 100;
      end if;
   end RaiseTheSubmarine100ft;






   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------
end Submarine;
