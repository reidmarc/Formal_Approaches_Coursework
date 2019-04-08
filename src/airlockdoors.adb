with Movement; use Movement;

package body AirLockDoors with Spark_Mode
is

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------
   procedure OpenAirLockDoor (doorOne : in out AirLockDoor;
                              doorTwo : in AirLockDoor) is
   begin
      if (doorTwo.door = Closed
          and doorOne.lock = Unlocked) then
         doorOne.door := Open;
      end if;
   end OpenAirLockDoor;


   procedure CloseAirLockDoor (doorOne : in out AirLockDoor) is
   begin
      if (doorOne.door = Open) then
         doorOne.door := Closed;
      end if;
   end CloseAirLockDoor;


   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------
   procedure LockAirLockDoor (doorOne : in out AirLockDoor;
                              currentOperationStatus : in out OperationStatus;
                              doorTwo : in AirLockDoor) is
   begin
      if (doorOne.door = Closed and doorOne.lock = Unlocked) then
         doorOne.lock := Locked;
         if (doorTwo.lock = Locked) then
            currentOperationStatus := Allowed;
         end if;
      end if;
   end LockAirLockDoor;


   procedure UnlockAirLockDoor (doorOne : in out AirLockDoor;
                                currentOperationStatus : in out OperationStatus;
                                currentDepth : in DepthMonitor) is
   begin
      if (doorOne.lock = Locked and currentDepth = 0) then
         doorOne.lock := Unlocked;
         currentOperationStatus := Prohibited;
      end if;
   end UnlockAirLockDoor;
end AirLockDoors;
