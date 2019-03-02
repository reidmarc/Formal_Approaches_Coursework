package Main
with SPARK_Mode
is


   innerAirLockDoorClosed : Boolean := False;
   outerAirLockDoorClosed : Boolean := True;

   innerAirLockDoorLocked : Boolean := False;
   outerAirLockDoorLocked : Boolean := False;


   bothAirLockDoorsLocked : Boolean := False;

   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   -- Outer Air Lock Door
   procedure closeOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorClosed, Input => innerAirLockDoorClosed),
     Pre => outerAirLockDoorClosed = False and then innerAirLockDoorClosed = True,
     Post => outerAirLockDoorClosed = True;

   procedure openOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorClosed, Input => innerAirLockDoorClosed),
     Pre => outerAirLockDoorClosed = True and then innerAirLockDoorClosed = True,
     Post => outerAirLockDoorClosed = False;


   -- Inner Air Lock Door
   procedure closeInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorClosed, Input => outerAirLockDoorClosed),
     Pre => innerAirLockDoorClosed = False and then outerAirLockDoorClosed = True,
     Post => innerAirLockDoorClosed = True;

   procedure openInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorClosed, Input => outerAirLockDoorClosed),
     Pre => innerAirLockDoorClosed = True and then outerAirLockDoorClosed = True,
     Post => innerAirLockDoorClosed = False;



   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   -- Lock Inner Air Lock Door
   procedure lockInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorLocked, Input => innerAirLockDoorClosed),
     Pre => innerAirLockDoorLocked = False and then innerAirLockDoorClosed = True,
     Post => innerAirLockDoorLocked = True;


   -- Lock Outer Air Lock Door
   procedure lockOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorLocked, Input => outerAirLockDoorClosed),
     Pre => outerAirLockDoorLocked = False and then outerAirLockDoorClosed = True,
     Post => outerAirLockDoorLocked = True;


   -- Unlock Inner Air Lock Door
   procedure unlockInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorLocked),
     Pre => innerAirLockDoorLocked = True,
     Post => innerAirLockDoorLocked = False;


   -- Unlock Outer Air Lock Door
   procedure unlockOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorLocked),
     Pre => outerAirLockDoorLocked = True,
     Post => outerAirLockDoorLocked = False;


   -- Allows Operations
   procedure canPerformOperations with
     Global => (In_Out => bothAirLockDoorsLocked, Input => (innerAirLockDoorLocked, outerAirLockDoorLocked)),
     Pre => bothAirLockDoorsLocked = False and then innerAirLockDoorLocked = True and then outerAirLockDoorLocked = True,
     Post => bothAirLockDoorsLocked = True;


   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------

   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------

   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------

   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------

   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------












end Main;
