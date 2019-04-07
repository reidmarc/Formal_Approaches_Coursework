with Submarine;
use Submarine;


package Torpedoes with SPARK_Mode
is
   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------

   type Content is (Torp, Nothing);

   type StorageCapacity is range 0..50;

   type Storage is array (StorageCapacity) of Content;

   torpedoeStorage : Storage;

   type Launcher is (Loaded, Empty);

   torpedoeTube : Launcher := (Empty);




   ---------------------------
   -- Fill torpedoe storage --
   ---------------------------
   procedure FillTorpedoeStorage with
     Global => (In_Out => (torpedoeStorage), Input => currentDepth),
     Pre => currentDepth = 0,
     Post => StorageIsFull(torpedoeStorage);

   -- for all J in torpedoeStorage'Range => torpedoeStorage(J) = Torp);


   function StorageIsFull (d : Storage) return Boolean is
     (for all I in d'Range => d(I) = Torp);






   -- Storing

   -- Loading

   -- Firing







end Torpedoes;
