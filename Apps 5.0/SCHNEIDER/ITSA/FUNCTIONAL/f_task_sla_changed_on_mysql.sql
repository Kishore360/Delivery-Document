SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.last_modified_date' ELSE 'SUCCESS' END as Message from schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE convert_tz(SRC.last_modified_date,'GMT','America/Los_Angeles')<> TRGT.changed_on
