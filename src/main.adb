package body Main
with SPARK_Mode
is



   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   -- Outer AirLock Door
   procedure closeOuterAirLockDoor is
   begin
      outerAirLockDoorClosed := True;
   end closeOuterAirLockDoor;

   procedure openOuterAirLockDoor is
   begin
      outerAirLockDoorClosed := False;
   end openOuterAirLockDoor;


   -- Inner Air Lock Door
   procedure closeInnerAirLockDoor is
   begin
      innerAirLockDoorClosed := True;
   end closeInnerAirLockDoor;


   procedure openInnerAirLockDoor is
   begin
      innerAirLockDoorClosed := False;
   end openInnerAirLockDoor;



   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   -- Lock Inner Air Lock Door
   procedure lockInnerAirLockDoor is
   begin
      innerAirLockDoorLocked := True;
   end lockInnerAirLockDoor;


   -- Lock Outer Air Lock Door
   procedure lockOuterAirLockDoor is
   begin
      outerAirLockDoorLocked := True;
   end lockOuterAirLockDoor;


   -- Unlock Inner Air Lock Door
   procedure unlockInnerAirLockDoor is
   begin
      innerAirLockDoorLocked := False;
   end unlockInnerAirLockDoor;


   -- Unlock Outer Air Lock Door
   procedure unlockOuterAirLockDoor is
   begin
      outerAirLockDoorLocked := False;
   end unlockOuterAirLockDoor;


   -- Allows Operations
   procedure canPerformOperations is
   begin
      bothAirLockDoorsLocked := True;
   end canPerformOperations;



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
