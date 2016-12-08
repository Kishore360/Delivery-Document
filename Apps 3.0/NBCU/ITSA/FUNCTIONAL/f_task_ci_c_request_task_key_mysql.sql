SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.task_ci_final SRC
JOIN 
	nbcu_mdwdb.d_request_task LKP 
	ON (SRC.task =LKP.row_id AND SRC.sourceinstance= LKP.source_id  )
JOIN 
	nbcu_mdwdb.f_task_ci_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 else -1 end) <> TRGT.request_task_key


