SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.created_on' ELSE 'SUCCESS' END as Message from schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE  convert_tz(SRC.submit_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> TRGT.created_on 
