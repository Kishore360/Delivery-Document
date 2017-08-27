SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_stop_condition' ELSE 'SUCCESS' END as Message from  
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.d_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE SUBSTRING(SRC.StopQualification,1,255)<> COALESCE(TRGT.sla_stop_condition,'UNSPECIFIED')