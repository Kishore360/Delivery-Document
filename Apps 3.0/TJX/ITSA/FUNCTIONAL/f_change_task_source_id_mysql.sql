
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.source_id' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.change_task_final SRC 
LEFT JOIN tjx_mdwdb.f_change_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE (SRC.sourceinstance)<>(TRGT.source_id)
