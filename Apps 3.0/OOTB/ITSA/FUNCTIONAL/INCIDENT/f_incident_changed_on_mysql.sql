SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.changed_on' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt   FROM <<tenant>>_mdsdb.incident_final SRC  
 JOIN <<tenant>>_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(SRC.sys_updated_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)<> TRGT.changed_on )b
