SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt  from mercuryins_mdwdb.d_incident d 
JOIN mercuryins_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code  IN ('OPEN')
JOIN (SELECT MAX(lastupdated) AS lastupdated,source_id FROM mercuryins_mdwdb.d_o_data_freshness GROUP BY source_id) dat 
ON d.source_id = dat.source_id
where d.over_due_flag <> CASE WHEN d.active_flag='Y' THEN COALESCE((CASE WHEN dat.lastupdated > d.due_on THEN 'Y' ELSE 'N' END ),'N') ELSE 'N' END)a 