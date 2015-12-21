 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join <<tenant>>_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness df 
 ON (TRGT.source_id = df.source_id
 AND TRGT.etl_run_number = df.etl_run_number)
where lm.dimension_class = 'STATE~INCIDENT'
AND CASE WHEN lm.dimension_wh_code = 'OPEN' THEN 
DATEDIFF(CONVERT_TZ(df.lastupdated,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),TRGT.changed_on)
 ELSE 0 END <> TRGT.dormancy_age 