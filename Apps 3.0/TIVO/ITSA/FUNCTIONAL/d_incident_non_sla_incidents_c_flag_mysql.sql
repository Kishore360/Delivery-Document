 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

 SELECT count(1) as cnt from tivo_mdwdb.d_incident d
JOIN tivo_mdwdb.f_incident f ON d.row_key = f.incident_key
LEFT JOIN tivo_mdwdb.d_lov_map disposition ON f.disposition_src_c_key = disposition.src_key
AND disposition.dimension_class = 'DISPOSITION_CODE~INCIDENT'
LEFT JOIN tivo_mdwdb.d_lov_map priority ON f.priority_src_key = priority.src_key
AND priority.dimension_class = 'PRIORITY~TASK'
LEFT JOIN tivo_mdwdb.d_lov_map incident_state ON f.state_src_key = incident_state.src_key
AND incident_state.dimension_class = 'STATE~INCIDENT'
WHERE
d.non_sla_incidents_c_flag <> CASE
									 WHEN disposition.dimension_wh_code <> 'DUPLICATE'
										  AND incident_state.dimension_wh_code <> 'CANCELLED'
										  AND priority.dimension_wh_code = 'N/A' THEN 'Y'
									 ELSE 'N'
								 END) tmp;
								 
								 