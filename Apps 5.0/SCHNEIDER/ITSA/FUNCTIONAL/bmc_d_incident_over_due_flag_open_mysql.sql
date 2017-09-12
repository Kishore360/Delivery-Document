SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.incident_number = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
JOIN schneider_mdwdb.d_lov_map br ON TRGT.state_src_key = br.src_key AND br.dimension_wh_code  IN ('OPEN')
JOIN (SELECT MAX(lastupdated) AS lastupdated,source_id FROM schneider_workdb.d_o_data_freshness GROUP BY source_id) dat 
ON TRGT.source_id = dat.source_id
WHERE ( CASE WHEN TRGT.active_flag='Y' THEN coalesce((case when dat.lastupdated > TRGT.due_on then 'Y' else 'N' end ),'N') ELSE 'N' END) <> (TRGT.over_due_flag) 
