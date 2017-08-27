SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.outcome_flag' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE COALESCE(CASE WHEN SRC.SLM_STATUS IN ('Service Targets Breached','All Service Targets Breached') 
THEN 'Y' ELSE 'N' END ,'UNSPECIFIED') <> TRGT.outcome_flag