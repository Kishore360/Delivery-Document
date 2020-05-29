SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  from (
 select ( CASE WHEN  due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') and TRGT.active_flag='Y' then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def
 FROM #MDS_TABLE_SCHEMA.incident_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE due_date is not null and active_flag='Y'
 )a
 WHERE abc<>def)b
 
 
