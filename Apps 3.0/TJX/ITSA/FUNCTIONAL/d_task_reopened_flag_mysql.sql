SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task.reopened_flag_c' ELSE 'SUCCESS' END as Message 
FROM tjx_mdsdb.task_final src
join tjx_mdwdb.d_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.sys_class_name = 'incident' THEN IF(src.reopen_count>0,'Y','N') ELSE NULL END <> trgt.reopened_flag_c