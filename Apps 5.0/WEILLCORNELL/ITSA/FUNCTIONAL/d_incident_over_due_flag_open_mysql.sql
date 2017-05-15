SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
FROM weillcornell_mdwdb.d_incident d 
JOIN weillcornell_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code  IN ('OPEN')
JOIN (SELECT MAX(lastupdated) AS lastupdated,source_id FROM weillcornell_mdwdb.d_o_data_freshness GROUP BY source_id) dat 
ON d.source_id = dat.source_id
where  d.over_due_flag <> CASE WHEN d.active_flag='Y' THEN COALESCE((CASE WHEN dat.lastupdated > d.due_on THEN 'Y' ELSE 'N' END ),'N') ELSE 'N' END