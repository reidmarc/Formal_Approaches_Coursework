

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

end Submarine;
