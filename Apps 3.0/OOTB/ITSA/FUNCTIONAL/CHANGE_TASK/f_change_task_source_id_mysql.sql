
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.source_id' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.change_task_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_change_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.sourceinstance,'')<> COALESCE(TRGT.source_id,'')
