with Movement; use Movement;

package AirLockDoors with SPARK_Mode
is
   type DoorStatus is (Open, Closed);
   type LockStatus is (Locked, Unlocked);

   type AirLockDoor is record
      door : DoorStatus;
      lock : LockStatus;
   end record;

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------
   procedure OpenAirLockDoor (doorOne : in out AirLockDoor;
                              doorTwo : in AirLockDoor) with
     Pre => doorTwo.door = Closed
     and then doorOne.lock = Unlocked
     and then doorOne.door = Closed,
     Post => doorOne.door = Open;


   procedure CloseAirLockDoor (doorOne : in out AirLockDoor) with
     Pre => doorOne.door = Open,
     Post => doorOne.door = Closed;


   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------
   procedure LockAirLockDoor (doorOne : in out AirLockDoor;
                              currentOperationStatus : in out OperationStatus;
                              doorTwo : in AirLockDoor) with
     Pre => doorOne.door = Closed
     and then doorOne.lock = Unlocked,

     Post => doorOne.lock = Locked;


   procedure UnlockAirLockDoor (doorOne : in out AirLockDoor;
                                currentOperationStatus : in out OperationStatus;
                                currentDepth : in DepthMonitor) with
     Pre => currentDepth = 0
     and then doorOne.lock = Locked,

     Post => doorOne.lock = Unlocked
     and then currentOperationStatus = Prohibited;

end AirLockDoors;
