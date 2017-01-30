
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

 SELECT count(1) as cnt from 
 tivo_mdwdb.d_incident d
JOIN tivo_mdwdb.f_incident f ON d.row_key = f.incident_key
LEFT JOIN tivo_mdwdb.d_lov_map incident_state ON f.state_src_key = incident_state.src_key
AND incident_state.dimension_class = 'STATE~INCIDENT'
WHERE d.tivo_incidents_c_flag <> CASE
                                  WHEN coalesce(incident_state.dimension_wh_code,'UNSPECIFIED') <> 'CANCELLED'
                                       AND d.duplicate_incidents_c_flag = 'N'
                                       AND d.client_caused_incidents_c_flag = 'N'
                                       AND d.non_tivo_incidents_c_flag = 'N'
                                       AND d.non_sla_incidents_c_flag = 'N' THEN 'Y'
                                  ELSE 'N'
                              END) tmp;

							  
							  