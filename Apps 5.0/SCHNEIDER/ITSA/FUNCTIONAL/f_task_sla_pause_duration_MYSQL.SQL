

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.pause_duration' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance 
where case when src.downelapsedtime is null  then null   when src.downelapsedtime < 0 then null  when src.downelapsedtime  > 214748364 then null else src.downelapsedtime  end <> stg.pause_duration