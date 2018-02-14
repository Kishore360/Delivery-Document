SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.entry_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
JOIN schneider_mdwdb.f_incident TRGT1  on TRGT.row_key = TRGT1.incident_key  
JOIN schneider_mdwdb.d_lov_map lov_map on TRGT1.state_src_key = lov_map.src_key    and     
  lov_map.dimension_class = 'STATE~INCIDENT' 
JOIN (select max(lastupdated) as lastupdated,source_id from schneider_workdb.d_o_data_freshness group by source_id) df ON TRGT1.source_id = df.source_id	
 WHERE ( case when lov_map.dimension_wh_code NOT IN('RESOLVED','CLOSED')  and timestampdiff(second,  TRGT.opened_on, df.lastupdated) > 432000   then 'Y' else 'N' end) <> (TRGT.backlog_flag) 


