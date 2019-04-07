with Submarine;
use Submarine;

package body Movement with Spark_Mode
is


   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------


   procedure DiveTheSubmarine100ft is
   begin
      if (currentDepth <= 1900 and currentDepth >= 0) then
         currentDepth := currentDepth + 100;
      end if;
   end DiveTheSubmarine100ft;


   procedure RaiseTheSubmarine100ft is
   begin
      if (currentDepth >= 100 and currentDepth <= 2000) then
         currentDepth := currentDepth - 100;
      end if;
   end RaiseTheSubmarine100ft;





end Movement;
