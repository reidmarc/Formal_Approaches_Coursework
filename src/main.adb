with AirLockDoors; use AirLockDoors;
with Oxygen; use Oxygen;
with Movement; use Movement;
with Reactor; use Reactor;
with Torpedoes; use Torpedoes;

with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   outerDoor : AirLockDoor := (door => Closed, lock => Locked);
   innerDoor : AirLockDoor := (door => Closed, lock => Locked);

   currentOperationStatus : OperationStatus := Allowed;
   currentDepth : DepthMonitor := 0;
   reactorTemp : ReactorTempRange := 0;
   reactorStatus : ReactorTempStatus := Cool;

   oxygenTank : TankLevelPercentage := 0;
   oxygenTankStatus : TankStatus := Empty;
   oxygenTankAlarm : Alarm := Off;
   oxygenTankLowWarningRecieved : RecievedWarning := No;
   oxygenTankEmptyWarningRecieved : RecievedWarning := No;

   torpedoeTube : Launcher := (Empty);
   torpedoeStorage : Storage;


begin
   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Fill oxygen tank before use...");
   FillOxygenTank(oxygenTankStatus, oxygenTank, currentDepth, currentOperationStatus);

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);





   Put_Line("Outer Door is: ");
   Put_Line(outerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(outerDoor.lock'Image);
   Put_Line("Inner Door is: ");
   Put_Line(innerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Try open the outer door...");
   OpenAirLockDoor(outerDoor, innerDoor);
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try unlock the outer door...");
   UnlockAirLockDoor(outerDoor, currentOperationStatus, currentDepth);
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.lock'Image);

   Put_Line("Try open the outer door again...");
   OpenAirLockDoor(outerDoor, innerDoor);
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try open the inner door...");
   OpenAirLockDoor(innerDoor, outerDoor);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);

   Put_Line("Try close the outer door...");
   CloseAirLockDoor(outerDoor);
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try open the inner door again...");
   OpenAirLockDoor(innerDoor, outerDoor);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);

   Put_Line("Try unlock the inner door...");
   UnlockAirLockDoor(innerDoor, currentOperationStatus, currentDepth);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Try open the inner door again...");
   OpenAirLockDoor(innerDoor, outerDoor);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);

   Put_Line("Try open the outer door again...");
   OpenAirLockDoor(outerDoor, innerDoor);
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try operate the submarine...");
   Put_Line("Operation Status:");
   Put_Line(currentOperationStatus'Image);

   Put_Line("Try close the inner door...");
   CloseAirLockDoor(innerDoor);
   Put_Line("The inner door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try operate the submarine...");
   Put_Line("Operation Status:");
   Put_Line(currentOperationStatus'Image);

   Put_Line("Outer Door is: ");
   Put_Line(outerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(outerDoor.lock'Image);
   Put_Line("Inner Door is: ");
   Put_Line(innerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Lock both doors...");
   LockAirLockDoor(outerDoor, currentOperationStatus, innerDoor);
   LockAirLockDoor(innerDoor, currentOperationStatus, outerDoor);

   Put_Line("Try operate the submarine...");
   Put_Line("Operation Status:");
   Put_Line(currentOperationStatus'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Submarine dives by 100ft");
   DiveTheSubmarine(100, currentDepth, currentOperationStatus);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Try unlock the inner door...");
   UnlockAirLockDoor(innerDoor, currentOperationStatus, currentDepth);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Submarine rises by 100ft");
   RaiseTheSubmarine(100, currentDepth);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Try unlock the inner door...");
   UnlockAirLockDoor(innerDoor, currentOperationStatus, currentDepth);
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Lock the inner door...");
   LockAirLockDoor(innerDoor, currentOperationStatus, outerDoor);

   Put_Line("Submarine dives to 2000ft");
   DiveTheSubmarine(2000, currentDepth, currentOperationStatus);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Submarine attempts to dive past the 2000ft limit by 100ft");
   DiveTheSubmarine(100, currentDepth, currentOperationStatus);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankAlarm'Image);

   Put_Line("Oxygen starts decreasing...");
   OxygenTankCheck(oxygenTankStatus, oxygenTankAlarm, oxygenTank, currentDepth, currentOperationStatus);

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankAlarm'Image);

   Put_Line("Acknowledge the alarm");
   TurnOffOxygenAlarm(oxygenTankAlarm, oxygenTankLowWarningRecieved);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankAlarm'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Oxygen starts decreasing...");
   OxygenTankCheck(oxygenTankStatus, oxygenTankAlarm, oxygenTank, currentDepth, currentOperationStatus);

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankAlarm'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Acknowledge the alarm");
   TurnOffOxygenAlarm(oxygenTankAlarm, oxygenTankLowWarningRecieved);

   Put_Line("Refill oxygen tanks...");
   FillOxygenTank(oxygenTankStatus, oxygenTank, currentDepth, currentOperationStatus);

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Reactor temp is:");
   Put_Line(reactorTemp'Image);

   Put_Line("Submarine dives to 2000ft");
   DiveTheSubmarine(2000, currentDepth, currentOperationStatus);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Reactor temp rises...");
   ReactorTempOverheats(reactorTemp, currentDepth, currentOperationStatus, reactorStatus);

   Put_Line("Reactor temp status is:");
   Put_Line(reactorStatus'Image);

   Put_Line("Reactor temp is:");
   Put_Line(reactorTemp'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Reactor temp drops...");
   ReactorTempCoolsdown(reactorTemp, currentDepth, currentOperationStatus, reactorStatus);

   Put_Line("Reactor temp status is:");
   Put_Line(reactorStatus'Image);

   Put_Line("Reactor temp is:");
   Put_Line(reactorTemp'Image);

   Put_Line("Fill torpedo storage..");
   FillTorpedoeStorage(torpedoeStorage, currentDepth);

   Put_Line("Torpedoe storage check...");
   Put_Line(CountTorps(torpedoeStorage, torp)'Image);

   Put_Line("First torpedoe is in slot");
   Put_Line(torpLocation(torpedoeStorage, torp)'Image);

   -----------------------------------------------------------------------------

--     Put_Line("Load the launcher...");
--     LoadLauncher(torpedoeTube, torpedoeStorage, Torp);
--
--     Put_Line("The launcher is...");
--     Put_Line(torpedoeTube'Image);
--
--     Put_Line("Fire torpedoe...");
--     FireTorpedoe(torpedoeTube, currentDepth);
--
--     Put_Line("The launcher is still...");
--     Put_Line(torpedoeTube'Image);
--
--     Put_Line("Submarine dives to 2000ft");
--     DiveTheSubmarine(2000, currentDepth, currentOperationStatus);
--
--     Put_Line("Current depth of the submarine:");
--     Put_Line(currentDepth'Image);
--
--     Put_Line("Fire torpedoe...");
--     FireTorpedoe(torpedoeTube, currentDepth);
--
--     Put_Line("The launcher is...");
--     Put_Line(torpedoeTube'Image);
--
--     Put_Line("Next torpedoe is in slot");
--     Put_Line(torpLocation(torpedoeStorage, torp)'Image);
--
--     Put_Line("Load the launcher...");
--     LoadLauncher(torpedoeTube, torpedoeStorage, Torp);
--
--     Put_Line("The launcher is...");
--     Put_Line(torpedoeTube'Image);
--
--     Put_Line("Fire torpedoe...");
--     FireTorpedoe(torpedoeTube, currentDepth);
--
--     Put_Line("The launcher is...");
--     Put_Line(torpedoeTube'Image);
--
--     Put_Line("Next torpedoe is in slot");
--     Put_Line(torpLocation(torpedoeStorage, torp)'Image);
--
--     Put_Line("Torpedoe storage check...");
--     Put_Line(CountTorps(torpedoeStorage, torp)'Image);
--
--     Put_Line("Surface the submarine to restock on torpedoes");
--     SurfaceTheSubmarine(currentDepth);
--
--     Put_Line("Current depth of the submarine:");
--     Put_Line(currentDepth'Image);
--
--     Put_Line("Fill torpedo storage..");
--     FillTorpedoeStorage(torpedoeStorage, currentDepth);
--
--     Put_Line("Torpedoe storage check...");
--     Put_Line(CountTorps(torpedoeStorage, torp)'Image);
--
--     Put_Line("Next torpedoe is in slot");
--     Put_Line(torpLocation(torpedoeStorage, torp)'Image);

   -----------------------------------------------------------------------------

end Main;
