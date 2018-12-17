SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task.opened_on' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from (select sys_id, sourceinstance, sys_created_on from gilead_mdsdb.task_final) src
left join gilead_mdwdb.d_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
WHERE CONVERT_TZ(src.sys_created_on,'GMT','America/New_York') <> trgt.created_on) temp;