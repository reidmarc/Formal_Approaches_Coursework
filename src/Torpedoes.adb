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
   procedure FillTorpedoeStorage is
      Position : StorageCapacity := torpedoeStorage'First;

   begin
      if (currentDepth = 0) then
         while Position <= torpedoeStorage'Last loop
            torpedoeStorage(Position) := Torp;
            if Position = torpedoeStorage'Last then exit;
            else Position := Position + 1;
            end if;
            pragma Loop_Invariant (for all J in torpedoeStorage'First..(Position - 1) => torpedoeStorage(J) = Torp);
         end loop;
      end if;
     end FillTorpedoeStorage;

end Torpedoes;
