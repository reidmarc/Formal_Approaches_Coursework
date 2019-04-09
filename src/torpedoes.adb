with Movement;
use Movement;

package body Torpedoes with Spark_Mode
is

   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------

   ---------------------------
   -- Fill torpedoe Storage --
   ---------------------------
   procedure FillTorpedoeStorage (torpedoeStorage : in  out Storage;
                                 currentDepth : DepthMonitor) is
      Position : StorageCapacity := torpedoeStorage'First;

   begin
      if (currentDepth = 0) then
         while Position <= torpedoeStorage'Last loop
            if (torpedoeStorage(Position) /= Torp) then
               torpedoeStorage(Position) := Torp;
            end if;
            if Position = torpedoeStorage'Last then exit;
            else Position := Position + 1;
            end if;
            pragma Loop_Invariant (for all J in torpedoeStorage'First..(Position - 1) => torpedoeStorage(J) = Torp);
         end loop;
      end if;
   end FillTorpedoeStorage;


   function CountTorps (torpedoeStorage : Storage; torp : Torps) return Integer
   is count : Integer := 0;
      first : StorageCapacity := torpedoeStorage'First;
      last : StorageCapacity := torpedoeStorage'Last;
   begin
      for I in first..last loop
         if torpedoeStorage(I) = torp then
            count := count + 1;
         else
            count := count;
         end if;
      end loop;
      return count;
   end CountTorps;



   -----------------------
   -- Load the launcher --
   -----------------------


   function TorpLocation (torpedoeStorage : Storage; torp : Torps) return StorageCapacity
   is
      position : StorageCapacity := torpedoeStorage'First;
   begin
      while(position < torpedoeStorage'Last) loop
         if (torpedoeStorage(position) = torp) then
            return position;
         end if;
         pragma Loop_Invariant
           (for all I in torpedoeStorage'First..position => torpedoeStorage(I) /= torp);
         position := position + 1;
      end loop;
      return position;
   end TorpLocation;


----------------------------------------------------------------------------------------------
--     procedure LoadLauncher (torpedoeTube : in out Launcher; torpedoeStorage : in out Storage; torp : Torps)
--     is
--     begin
--        if (torpedoeTube = Empty) then
--           torpedoeStorage(TorpLocation(torpedoeStorage, torp)) := Nothing;
--           torpedoeTube := Loaded;
--        end if;
--     end LoadLauncher;
--
--
--
--     -----------------------
--     -- Fire the launcher --
--     -----------------------
--
--     procedure FireTorpedoe (torpedoeTube : in out Launcher; currentDepth : in DepthMonitor)
--     is
--     begin
--        if (currentDepth > DepthMonitor'First) then
--           torpedoeTube := Empty;
--        end if;
--
--     end FireTorpedoe;
--
------------------------------------------------------------------------------------------------











end Torpedoes;
