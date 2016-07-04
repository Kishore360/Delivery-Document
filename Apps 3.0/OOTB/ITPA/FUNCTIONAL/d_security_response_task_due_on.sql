
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_response_task.due_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.sn_si_task_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_security_response_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.due_date<> TRGT.due_on 
