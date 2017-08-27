SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.incident_id' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE COALESCE(SRC.ApplicationInstanceId,'UNSPECIFIED') <> ( TRGT.incident_id or TRGT.problem_id or TRGT.problem_task_id or TRGT.request_id or
TRGT.request_item_id or TRGT.request_task_id or TRGT.security_incident_id )