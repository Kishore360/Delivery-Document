 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM  mcdonalds_mdsdb.incident_final a
join mcdonalds_mdwdb.d_incident d on sys_id=row_id and sourceinstance=source_id
JOIN mcdonalds_mdwdb.f_incident f ON d.row_key = f.incident_key
JOIN mcdonalds_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = a.sourceinstance)
where (a.cdctime<=f1.lastupdated) and  case when (lov_map.dimension_class = 'STATE~INCIDENT' AND lov_map.dimension_wh_code IN('RESOLVED','CLOSED') 
  AND TIMESTAMPDIFF(MINUTE,d.opened_on,d.last_resolved_on)<30) then 'Y' else 'N' end<>  d.first_call_resolution_flag)a

