with Submarine;
use Submarine;


package Movement with SPARK_Mode
is

   -------------------------------------------------------
   -- The submarine cannot dive beneath a certain depth --
   -------------------------------------------------------


   procedure DiveTheSubmarine100ft with
     Global => (In_Out => currentDepth),
     Pre => currentDepth <= 1900 and then currentDepth >= 0,
     Post => currentDepth <= 2000 and then currentDepth >= 100;


   procedure RaiseTheSubmarine100ft with
     Global => (In_Out => currentDepth),
     Pre => currentDepth >= 100 and then currentDepth <= 2000,
     Post => currentDepth <= 1900 and then currentDepth >= 0;





end Movement;
