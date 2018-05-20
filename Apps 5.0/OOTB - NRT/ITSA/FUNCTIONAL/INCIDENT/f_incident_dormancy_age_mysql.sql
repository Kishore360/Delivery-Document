 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM (select * from <<tenant>>_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(SECOND,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness where (SRC.cdctime<=f1.lastupdated) and sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>)),0)<> TRGT.dormancy_age )b
 
 

