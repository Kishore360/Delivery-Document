SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_problem_task.created_on' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from (select sys_id, sourceinstance, sys_created_on from gilead_mdsdb.problem_task_final) src
left join gilead_mdwdb.d_problem_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
WHERE convert_tz(src.sys_created_on,'GMT', 'America/New_York') <> trgt.created_on) temp;