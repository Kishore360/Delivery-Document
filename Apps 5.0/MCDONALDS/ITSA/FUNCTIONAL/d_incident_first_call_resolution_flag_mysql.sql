 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM  mcdonalds_mdwdb.d_incident d
JOIN mcdonalds_mdwdb.f_incident f ON d.row_key = f.incident_key
JOIN mcdonalds_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key
WHERE  case when (lov_map.dimension_class = 'STATE~INCIDENT' AND lov_map.dimension_wh_code IN('RESOLVED','CLOSED') 
  AND TIMESTAMPDIFF(MINUTE,d.opened_on,d.last_resolved_on)<30) then 'Y' else 'N' end<>  d.first_call_resolution_flag)a

