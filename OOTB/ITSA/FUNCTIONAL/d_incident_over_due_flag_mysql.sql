	

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (
 select ( CASE WHEN  due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def
 FROM <<tenant>>_mdsdb.incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE due_date is not null
 )a
 WHERE abc<>def

