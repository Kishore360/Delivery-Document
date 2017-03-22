SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.due_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt   
FROM <<tenant>>_mdsdb.incident_final SRC  
 JOIN <<tenant>>_mdwdb.d_incident TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE 
coalesce(convert_tz(SRC.due_date,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),-99)<> coalesce(TRGT.due_on,-99))b
