package Main
with SPARK_Mode
is


   --innerAirLockDoorClosed : Boolean := False;
   --outerAirLockDoorClosed : Boolean := True;

   --innerAirLockDoorLocked : Boolean := False;
   --outerAirLockDoorLocked : Boolean := False;


   --bothAirLockDoorsLocked : Boolean := False;


   type status is new Boolean;

   innerAirLockDoorClosed : status := FALSE;
   outerAirLockDoorClosed : status := TRUE;

   innerAirLockDoorLocked : status := FALSE;
   outerAirLockDoorLocked : status := FALSE;

   canPerformOperation : status := FALSE;

   oxygenLowWarning : status := TRUE;
   oxygenEmptyWarning : status := TRUE;

   reactorOverheating : status := TRUE;


   emergencyOperation : status := FALSE;


   ---------------------------------------------------------------------------
   -- The submarine must have at least one airlock door closed at all times --
   ---------------------------------------------------------------------------

   -- Outer Air Lock Door
   procedure closeOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorClosed, Input => innerAirLockDoorClosed),
     Pre => outerAirLockDoorClosed = FALSE and then innerAirLockDoorClosed = TRUE,
     Post => outerAirLockDoorClosed = TRUE;

   procedure openOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorClosed, Input => (innerAirLockDoorClosed, emergencyOperation)),
     Pre => outerAirLockDoorClosed = TRUE and then innerAirLockDoorClosed = TRUE and then emergencyOperation = FALSE,
     Post => outerAirLockDoorClosed = FALSE;


   -- Inner Air Lock Door
   procedure closeInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorClosed, Input => outerAirLockDoorClosed),
     Pre => innerAirLockDoorClosed = FALSE and then outerAirLockDoorClosed = TRUE,
     Post => innerAirLockDoorClosed = TRUE;

   procedure openInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorClosed, Input => (outerAirLockDoorClosed, emergencyOperation)),
     Pre => innerAirLockDoorClosed = TRUE and then outerAirLockDoorClosed = TRUE and then emergencyOperation = FALSE,
     Post => innerAirLockDoorClosed = FALSE;



   -------------------------------------------------------------------------------------
   -- The submarine can perform no operations unless both doors are closed and locked --
   -------------------------------------------------------------------------------------

   -- Lock Inner Air Lock Door
   procedure lockInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorLocked, Input => innerAirLockDoorClosed),
     Pre => innerAirLockDoorLocked = FALSE and then innerAirLockDoorClosed = TRUE,
     Post => innerAirLockDoorLocked = TRUE;


   -- Lock Outer Air Lock Door
   procedure lockOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorLocked, Input => outerAirLockDoorClosed),
     Pre => outerAirLockDoorLocked = FALSE and then outerAirLockDoorClosed = TRUE,
     Post => outerAirLockDoorLocked = TRUE;


   -- Unlock Inner Air Lock Door
   procedure unlockInnerAirLockDoor with
     Global => (In_Out => innerAirLockDoorLocked, Input => emergencyOperation),
     Pre => innerAirLockDoorLocked = TRUE and then emergencyOperation = FALSE,
     Post => innerAirLockDoorLocked = FALSE;


   -- Unlock Outer Air Lock Door
   procedure unlockOuterAirLockDoor with
     Global => (In_Out => outerAirLockDoorLocked, Input => emergencyOperation),
     Pre => outerAirLockDoorLocked = TRUE and then emergencyOperation = FALSE,
     Post => outerAirLockDoorLocked = FALSE;


   -- Allows Operations
   procedure canPerformOperations with
     Global => (In_Out => canPerformOperation, Input => (innerAirLockDoorLocked, outerAirLockDoorLocked)),
     Pre => canPerformOperation = FALSE and then innerAirLockDoorLocked = TRUE and then outerAirLockDoorLocked = TRUE,
     Post => canPerformOperation = TRUE;


   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------


   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------

   procedure noOxygenLeftAction with
     Global => (In_Out => emergencyOperation, Input => (oxygenEmptyWarning, canPerformOperation)),
     Pre => emergencyOperation = FALSE and then oxygenEmptyWarning = TRUE and then canPerformOperation = TRUE,
     Post => emergencyOperation = TRUE;


   ------------------------------------------------------------
   -- If the reactor overheats, the submarine has to surface --
   ------------------------------------------------------------

   procedure reactorOverheatingAction with
     Global => (In_Out => emergencyOperation, Input => (reactorOverheating, canPerformOperation)),
     Pre => emergencyOperation = FALSE and then reactorOverheating = TRUE and then canPerformOperation = TRUE,
     Post => emergencyOperation = TRUE;


   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------

   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------












end Main;
