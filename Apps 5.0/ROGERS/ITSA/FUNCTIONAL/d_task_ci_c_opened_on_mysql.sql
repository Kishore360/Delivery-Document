
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for d_task_ci_c.opened_on' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
from (select sys_id,opened_at,sourceinstance from  rogers_mdsdb.task_final where sys_class_name='problem' and extract(year from opened_at )='2019' ) src1
join (select task,sys_id,sourceinstance from   rogers_mdsdb.task_ci_final where extract(year from sys_created_on )='2019' ) src on src1.sys_id=src.task and src.sourceinstance=src1.sourceinstance 
join (select source_id,opened_on,row_id from  rogers_mdwdb.d_task_ci_c where  extract(year from opened_on )='2019') trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
where     convert_tz(src1.opened_at,'GMT','America/New_York')<> trgt.opened_on )a