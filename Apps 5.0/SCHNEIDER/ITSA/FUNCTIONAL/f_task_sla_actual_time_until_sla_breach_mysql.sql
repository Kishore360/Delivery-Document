SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.actual_time_until_sla_breach' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE COALESCE(SRC.MetMissedAmount,'UNSPECIFIED') <> TRGT.actual_time_until_sla_breach