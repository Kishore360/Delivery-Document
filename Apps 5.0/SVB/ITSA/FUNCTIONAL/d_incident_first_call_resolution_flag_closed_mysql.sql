SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM svb_mdwdb.d_incident d
JOIN svb_mdwdb.f_incident f ON d.row_key = f.incident_key
JOIN svb_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key
and lov_map.dimension_class = 'STATE~INCIDENT'
  AND lov_map.dimension_wh_code IN('RESOLVED','CLOSED') 
where case when  TIMESTAMPDIFF(MINUTE,d.opened_on,coalesce(d.last_resolved_on,d.closed_on))<30 then 'Y' else 'N' end<>d.first_call_resolution_flag
)b