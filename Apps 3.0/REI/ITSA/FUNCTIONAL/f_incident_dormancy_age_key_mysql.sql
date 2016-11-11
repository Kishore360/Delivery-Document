 select COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM rei_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT")),0), TRGT.dormancy_age 
 FROM rei_mdsdb.incident_final SRC 
 LEFT JOIN rei_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join rei_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM rei_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),"America/Los_Angeles","GMT")),0)<> TRGT.dormancy_age 
; 