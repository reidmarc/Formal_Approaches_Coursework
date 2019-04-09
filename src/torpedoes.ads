with Movement;
use Movement;

package Torpedoes with SPARK_Mode
is
   -----------------------------------------------------------------------------------
   -- The submarine must be capable of storing, loading and firing torpedoes safely --
   -----------------------------------------------------------------------------------

   type Torps is (Torp, Nothing);

   type StorageCapacity is range 0..5;

   type Storage is array (StorageCapacity) of Torps;

   type Launcher is (Loaded, Empty);




   ---------------------------
   -- Fill torpedoe storage --
   ---------------------------
   procedure FillTorpedoeStorage (torpedoeStorage : in  out Storage;
                                 currentDepth : DepthMonitor) with
     Pre => currentDepth = 0 and then StorageHasEmptySlots(torpedoeStorage),
     Post => StorageIsFull(torpedoeStorage);


   function StorageIsFull (torpedoeStorage : Storage) return Boolean is
     (for all I in torpedoeStorage'Range => torpedoeStorage(I) = Torp);


   function StorageHasEmptySlots (torpedoeStorage : Storage) return Boolean is
     (for some I in torpedoeStorage'Range => torpedoeStorage(I) /= Torp);



   function CountTorps (torpedoeStorage : Storage; torp : Torps) return Integer
     with
       Post => CountTorps'Result >= 0 and CountTorps'Result <= torpedoeStorage'Length;


   -----------------------
   -- Load the launcher --
   -----------------------

   function TorpExists (torpedoeStorage : Storage; torp : Torps) return Boolean is
     (for some I in torpedoeStorage'Range => torpedoeStorage(I) = torp);

   function TorpLocation (torpedoeStorage : Storage; torp : Torps) return StorageCapacity with
     Pre => torpExists(torpedoeStorage, torp),
     Post => torpedoeStorage(torpLocation'Result) = torp;
--------------------------------------------------------------------------------------------------
--
--
--
--  --       Contract_Cases =>
--  --         (torpedoeStorage(1) = torp and then (for some J in 2..torpedoeStorage'Last => torpedoeStorage(J) = torp) => torpLocation'Result = 1,
--  --         torpedoeStorage(1) /= torp => torpLocation'Result > 1);
--
--
--
--
--
--     procedure LoadLauncher (torpedoeTube : in out Launcher; torpedoeStorage : in out Storage; torp : Torps) with
--       Pre => torpedoeTube = Empty and then StorageHasEmptySlots(torpedoeStorage) /= True,
--       Post => torpedoeTube = Loaded;
--
--
--
--
--
--     -----------------------
--     -- Fire the launcher --
--     -----------------------
--
--     procedure FireTorpedoe (torpedoeTube : in out Launcher; currentDepth : in DepthMonitor) with
--       Pre => torpedoeTube = Loaded and then currentDepth > DepthMonitor'First,
--       Post => torpedoeTube = Empty;
-----------------------------------------------------------------------------------------------------
















end Torpedoes;
