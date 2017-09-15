


SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.hr_case_key' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.task_sla_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance
join schneider_mdwdb.d_hr_case lkp on lkp.row_id=coalesce(src.task,'UNSPECIFIED')
where coalesce(lkp.row_key , case when src.task is null then 0 else -1 end)<>stg.hr_case_key;