SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt   from meritsa_mdwdb.d_incident d 
JOIN meritsa_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
where d.over_due_flag <> COALESCE((CASE WHEN d.last_resolved_on > d.due_on THEN 'Y' ELSE 'N' END ),'N') )a