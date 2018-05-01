SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task.reopened_c_flag' ELSE 'SUCCESS' END as Message 
FROM tjx_mdsdb.task_final src
left JOIN tjx_mdsdb.incident_final i ON src.sys_id = i.sys_id AND src.sourceinstance = i.sourceinstance
join tjx_mdwdb.d_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE case when src.sys_class_name = 'Incident' then IF(i.reopen_count>0,'Y','N') else 'X' end   <> trgt.reopened_c_flag