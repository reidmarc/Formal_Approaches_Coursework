with Movement;
use Movement;

package body Oxygen with Spark_Mode
is

   ----------------------
   -- Fill oxygen tank --
   ----------------------
   procedure FillOxygenTank is
      Position : TankLevelPercentage := oxygenTank'First;

   begin
      if ((oxygenTankStatus = Empty or oxygenTankStatus = Low or oxygenTankStatus = Adequate) and currentDepth = 0) then
         while Position <= oxygenTank'Last loop
            oxygenTank(Position) := Oxygen;
            if Position = 100 then exit;
            else Position := Position + 1;
            end if;
            pragma Loop_Invariant (for all J in oxygenTank'First..(Position - 1) => oxygenTank(J) = Oxygen);
         end loop;
         oxygenTankStatus := Full;
      end if;
   end FillOxygenTank;

   -----------------------------------------------------
   -- If the oxygen runs low, a warning must be shown --
   -----------------------------------------------------
   ----------------------------------------------------------
   -- If the oxygen runs out, the submarine has to surface --
   ----------------------------------------------------------
   procedure OxygenTankCheck is
      Position : TankLevelPercentage := oxygenTank'Last;

   begin
      if (oxygenTankStatus = Full or oxygenTankStatus = Adequate) then
         while Position > oxygenTank'First loop
            oxygenTank(Position) := Nothing;
            if Position = 10 then exit;
            else Position := Position - 1;
            end if;
         end loop;
         oxygenTankAlarm := On;
         oxygenTankStatus := Low;
      else
         while Position >= oxygenTank'First loop
            oxygenTank(Position) := Nothing;
            if Position = 0 then exit;
            else Position := Position - 1;
            end if;
         end loop;
         oxygenTankStatus := Empty;
         oxygenTankAlarm := On;
         SurfaceTheSubmarine;
      end if;
   end OxygenTankCheck;


   procedure TurnOffOxygenLowAlarm is
   begin
      oxygenTankAlarm := Off;
      oxygenTankLowWarningRecieved := Yes;
   end TurnOffOxygenLowAlarm;



end Oxygen;
