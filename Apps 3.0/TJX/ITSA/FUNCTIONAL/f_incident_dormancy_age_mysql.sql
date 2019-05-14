 select 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 
FROM 
(SELECT count(1) as CNT
 
FROM (select sys_id, sourceinstance, sys_updated_on from tjx_mdsdb.incident_final) SRC 
 
LEFT JOIN (select row_id, source_id, state_src_key,etl_run_number,dormancy_age from tjx_mdwdb.f_incident) TRGT 
 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
 
left join (select src_key,dimension_class, dimension_wh_code from tjx_mdwdb.d_lov_map) lm 
 
ON (lm.src_key = TRGT.state_src_key)
 
where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN' AND COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM tjx_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'
and etl_run_number=TRGT.etl_run_number),'America/New_York','GMT')),0)<> TRGT.dormancy_age)temp;