SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM pan6_mdsdb.task_final task
join pan6_mdsdb.task_sla_final src on task.sys_id=src.task and task.sourceinstance=src.sourceinstance
LEFT OUTER JOIN pan6_mdwdb.d_incident_tasks_c x 
ON case when upper(task.sys_class_name) = 'U_INCIDENT_TASKS' then COALESCE(src.task,'UNSPECIFIED') else 'UNSPECIFIED' END =x.row_id
and task.sourceinstance=x.source_id
join pan6_mdwdb.f_task_sla a on a.row_id=src.sys_id and a.source_id=src.sourceinstance
WHERE upper(task.sys_class_name) = 'U_INCIDENT_TASKS'  and a.incident_tasks_c_key <> coalesce(x.row_key,case when task is null then 0 else -1 end )
 

 
 