SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  from (
 select ( CASE WHEN  due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness where (SRC.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) and TRGT.active_flag='Y' then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def
 FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and due_date is not null and active_flag='Y'
 )a
 where abc<>def)b
 
 
