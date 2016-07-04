
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_response_task.security_incident_id' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_task_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_security_response_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.parent,'')<> COALESCE(TRGT.security_incident_id,'')
