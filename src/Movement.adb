package body Movement with Spark_Mode
is
   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------


   procedure DiveTheSubmarine100ft is
   begin
      if (currentDepth <= 1900 and currentDepth >= 0 and currentoperationStatus = Allowed) then
         currentDepth := currentDepth + 100;
      end if;
   end DiveTheSubmarine100ft;


   procedure DiveTheSubmarineToMaxDepth is
   begin
      if (currentDepth < 2000 and currentoperationStatus = Allowed) then
         currentDepth := 2000;
      end if;
   end DiveTheSubmarineToMaxDepth;


   procedure RaiseTheSubmarine100ft is
   begin
      if (currentDepth >= 100 and currentDepth <= 2000) then
         currentDepth := currentDepth - 100;
      end if;
   end RaiseTheSubmarine100ft;


   procedure SurfaceTheSubmarine is
   begin
      if (currentDepth > 0 and currentDepth <= 2000) then
         currentDepth := 0;
      end if;
   end SurfaceTheSubmarine;





end Movement;
