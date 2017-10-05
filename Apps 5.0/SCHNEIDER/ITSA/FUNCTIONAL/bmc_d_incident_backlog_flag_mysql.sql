SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.entry_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
JOIN schneider_mdwdb.f_incident TRGT1  on TRGT.row_key = TRGT1.incident_key  
JOIN schneider_mdwdb.d_lov_map lov_map on TRGT1.state_src_key = lov_map.src_key    and     
  lov_map.dimension_class = 'STATE~INCIDENT' 
 WHERE ( case when lov_map.dimension_wh_code NOT IN('RESOLVED','CLOSED') then'Y' else 'N' end) <> (TRGT.backlog_flag) 


