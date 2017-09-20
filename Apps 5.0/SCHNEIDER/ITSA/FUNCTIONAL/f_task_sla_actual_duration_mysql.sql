SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.sla_duration' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance
WHERE (
  CASE WHEN src.overallelapsedtime  is null  THEN NULL   WHEN src.overallelapsedtime < 0 THEN NULL when src.overallelapsedtime  > 214748364 THEN NULL 
  ELSE src.overallelapsedtime  end
  
             ) <> stg.actual_duration;
			
            
         
			