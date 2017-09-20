

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.percentage_taken' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance 
where  src.available__   <> stg.percentage_taken