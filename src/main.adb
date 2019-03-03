package body Main
with SPARK_Mode
is



   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   -- Outer AirLock Door
   procedure closeOuterAirLockDoor is
   begin
      outerAirLockDoorClosed := TRUE;
   end closeOuterAirLockDoor;

   procedure openOuterAirLockDoor is
   begin
      outerAirLockDoorClosed := FALSE;
   end openOuterAirLockDoor;


   -- Inner Air Lock Door
   procedure closeInnerAirLockDoor is
   begin
      innerAirLockDoorClosed := TRUE;
   end closeInnerAirLockDoor;


   procedure openInnerAirLockDoor is
   begin
      innerAirLockDoorClosed := FALSE;
   end openInnerAirLockDoor;



   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   -- Lock Inner Air Lock Door
   procedure lockInnerAirLockDoor is
   begin
      innerAirLockDoorLocked := TRUE;
   end lockInnerAirLockDoor;


   -- Lock Outer Air Lock Door
   procedure lockOuterAirLockDoor is
   begin
      outerAirLockDoorLocked := TRUE;
   end lockOuterAirLockDoor;


   -- Unlock Inner Air Lock Door
   procedure unlockInnerAirLockDoor is
   begin
      innerAirLockDoorLocked := FALSE;
   end unlockInnerAirLockDoor;


   -- Unlock Outer Air Lock Door
   procedure unlockOuterAirLockDoor is
   begin
      outerAirLockDoorLocked := FALSE;
   end unlockOuterAirLockDoor;


   -- Allows Operations
   procedure canPerformOperations is
   begin
      canPerformOperation := TRUE;
   end canPerformOperations;

   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------

   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------

   -- Surfaces the submarine when the oxygen tank is empty
   procedure noOxygenLeftAction is
   begin
      emergencyOperation := TRUE;
   end noOxygenLeftAction;

   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------

    -- Surfaces the submarine when the reactor is overheating
   procedure reactorOverheatingAction is
   begin
      emergencyOperation := TRUE;
   end reactorOverheatingAction;

   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------

   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------


end Main;
