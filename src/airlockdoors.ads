with Movement;
use Movement;

package AirLockDoors with SPARK_Mode
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

end AirLockDoors;