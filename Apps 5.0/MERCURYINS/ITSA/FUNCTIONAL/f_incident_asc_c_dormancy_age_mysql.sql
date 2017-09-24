 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.u_asc_ticket_final SRC 
 LEFT JOIN mercuryins_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join mercuryins_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.asc_incident_state_c_key)
 where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(DAY,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM mercuryins_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/Los_Angeles','GMT')),0)<> TRGT.dormancy_age 
 
 

