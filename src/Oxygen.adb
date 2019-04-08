with Movement;
use Movement;

package body Oxygen with Spark_Mode
is

   ----------------------
   -- Fill oxygen tank --
   ----------------------
   procedure FillOxygenTank (oxygenTankStatus : in out TankStatus;
                             oxygenTank : in out TankLevelPercentage;
                             currentDepth : in DepthMonitor;
                             currentOperationStatus : in out OperationStatus) is
   begin
      if ((oxygenTankStatus /= Full)
          and currentDepth = 0) then
         for I in oxygenTank..TankLevelPercentage'Last loop
            oxygenTank := I;
         end loop;
         if (oxygenTank = TankLevelPercentage'Last) then
            oxygenTankStatus := Full;
            currentOperationStatus := Allowed;
         end if;
      end if;
   end FillOxygenTank;

   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------
   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------
   procedure OxygenTankCheck (oxygenTankStatus : in out TankStatus;
                              oxygenTankAlarm : in out Alarm;
                              oxygenTank : in out TankLevelPercentage;
                              currentDepth : in out DepthMonitor;
                              currentOperationStatus : in out OperationStatus) is
   begin
      if (oxygenTankStatus = Full or oxygenTankStatus = Adequate) then
         for I in oxygenTank..TankLevelPercentage'First loop
            oxygenTank := I;
            if (oxygenTank = 10) then
               exit;
            end if;
         end loop;

         oxygenTankAlarm := On;
         oxygenTankStatus := Low;

      else
         for I in oxygenTank..TankLevelPercentage'First loop
            oxygenTank := I;
         end loop;

      oxygenTankStatus := Empty;
      oxygenTankAlarm := On;
      currentOperationStatus := Prohibited;
      SurfaceTheSubmarine(currentDepth);
      end if;
   end OxygenTankCheck;


   procedure TurnOffOxygenAlarm (oxygenTankAlarm : in out Alarm;
                                    oxygenTankLowWarningRecieved : in out RecievedWarning) is
   begin
      oxygenTankAlarm := Off;
      oxygenTankLowWarningRecieved := Yes;
   end TurnOffOxygenAlarm;



end Oxygen;
