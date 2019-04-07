with Submarine; use Submarine;
with Oxygen; use Oxygen;
with Movement; use Movement;
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
begin
   Put_Line("Outer Door is: ");
   Put_Line(outerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(outerDoor.lock'Image);
   Put_Line("Inner Door is: ");
   Put_Line(innerDoor.door'Image);
   Put_Line("and: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Try open the outer door...");
   OpenOuterAirLockDoor;
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);

   Put_Line("Try unlock the outer door...");
   UnlockOuterDoor;
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.lock'Image);

   Put_Line("Try open the outer door again...");
   OpenOuterAirLockDoor;
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);



   Put_Line("Try open the inner door...");
   OpenInnerAirLockDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);


   Put_Line("Try close the outer door...");
   CloseOuterAirLockDoor;
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);


   Put_Line("Try open the inner door again...");
   OpenInnerAirLockDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);

   Put_Line("Try unlock the inner door...");
   UnlockInnerDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);

   Put_Line("Try open the inner door again...");
   OpenInnerAirLockDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.door'Image);

   Put_Line("Try open the outer door again...");
   OpenOuterAirLockDoor;
   Put_Line("The outer door is: ");
   Put_Line(outerDoor.door'Image);



   Put_Line("Try operate the submarine...");
   Put_Line("Operation Status:");
   Put_Line(currentOperationStatus'Image);

   Put_Line("Try close the inner door...");
   CloseInnerAirLockDoor;
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
   LockInnerDoor;
   LockOuterDoor;


   Put_Line("Try operate the submarine...");
   Put_Line("Operation Status:");
   Put_Line(currentOperationStatus'Image);


   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Submarine dives by 100ft");
   DiveTheSubmarine100ft;

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Try unlock the inner door...");
   UnlockInnerDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);


   Put_Line("Submarine rises by 100ft");
   RaiseTheSubmarine100ft;


   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);


   Put_Line("Try unlock the inner door...");
   UnlockInnerDoor;
   Put_Line("The inner door is: ");
   Put_Line(innerDoor.lock'Image);


   Put_Line("Lock the inner door...");
   LockInnerDoor;

   Put_Line("Submarine dives by 2000ft");
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;
   DiveTheSubmarine100ft;


   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);


   Put_Line("Submarine attempts to dive past the 2000ft limit by 100ft");
   DiveTheSubmarine100ft;

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);



   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankLowAlarm'Image);


   Put_Line("Oxygen starts decreasing...");
   OxygenTankCheck;


   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankLowAlarm'Image);

   Put_Line("Acknowledge the alarm");
   TurnOffOxygenLowAlarm;

   Put_Line("Oxygen alarm check:");
   Put_Line(oxygenTankLowAlarm'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);

   Put_Line("Oxygen starts decreasing...");
   OxygenTankCheck;

   Put_Line("Oxygen levels check:");
   Put_Line(oxygenTankStatus'Image);

   Put_Line("Current depth of the submarine:");
   Put_Line(currentDepth'Image);





end Main;
