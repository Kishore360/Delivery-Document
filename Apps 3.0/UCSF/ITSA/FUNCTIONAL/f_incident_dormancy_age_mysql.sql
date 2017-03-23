 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM ucsf_mdsdb.incident_final SRC 
  JOIN ucsf_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join ucsf_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM ucsf_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),'America/Los_Angeles','GMT')),0)<> TRGT.dormancy_age )b
 
 

