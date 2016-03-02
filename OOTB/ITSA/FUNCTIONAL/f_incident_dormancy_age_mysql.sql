 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,SRC.sys_updated_on,(SELECT CONVERT_TZ(MAX(lastupdated),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) AS lastupdated
FROM tjx_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')),0)<> TRGT.dormancy_age 
 
 

