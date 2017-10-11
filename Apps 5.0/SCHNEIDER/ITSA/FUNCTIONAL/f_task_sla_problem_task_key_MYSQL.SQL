

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.problem_task_key' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance 
join schneider_mdwdb.d_problem_task lkp on lkp.row_id=coalesce(src.applicationinstanceid,'UNSPECIFIED')
where coalesce(lkp.row_key , case when src.applicationinstanceid is null then 0 else -1 end)<>stg.problem_task_key;