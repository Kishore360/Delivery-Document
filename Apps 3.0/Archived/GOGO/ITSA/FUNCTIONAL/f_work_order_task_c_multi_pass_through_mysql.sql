
  
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.time_worked' ELSE 'SUCCESS' END as Message
FROM gogo_mdsdb.wm_task_final SRC 
LEFT JOIN gogo_mdwdb.f_work_order_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE CREATED_BY	<>	sys_created_by	or
CHANGED_BY	<>	sys_updated_by	or
CREATED_ON	<>	convert_tz(sys_created_on,'GMT','America/Chicago')	or
CHANGED_ON	<>	convert_tz(sys_updated_on,'GMT','America/Chicago')	or
PIVOT_DATE	<>	convert_tz(opened_at,'GMT','America/Chicago')	or
CDCTYPE	<>	CDCTYPE	

