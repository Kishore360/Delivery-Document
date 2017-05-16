SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
FROM weillcornell_mdwdb.d_incident d 
JOIN weillcornell_mdwdb.d_lov_map br ON d.state_src_key = br.src_key AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
where d.over_due_flag <> COALESCE((CASE WHEN d.last_resolved_on > d.due_on THEN 'Y' ELSE 'N' END ),'N')  