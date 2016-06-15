select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.incident_final SRC 
 LEFT JOIN wow_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join wow_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,CONVERT_TZ(SRC.sys_updated_on,'GMT','MST'),(SELECT MAX(lastupdated) AS lastupdated
FROM wow_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')),0) <> TRGT.dormant_age_c ;