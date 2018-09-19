SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdwdb.d_incident d
JOIN fidelity_mdwdb.f_incident f ON d.row_key = f.incident_key AND f.source_id = d.source_id
JOIN fidelity_mdwdb.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_wh_code = 'OPEN' AND br.dimension_class = 'STATE~INCIDENT'
JOIN (
select source_id,max(lastupdated) as lastupdated from  fidelity_mdwdb.d_o_data_freshness
group by source_id
) df ON f.source_id = df.source_id and TIMESTAMPDIFF(MINUTE, d.opened_on, df.lastupdated) < 30
where d.first_call_resolution_flag <> 'P' 
union
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_expense_item.short_desc' ELSE 'SUCCESS' END as Message FROM  
 fidelity_mdwdb.d_incident d
JOIN fidelity_mdwdb.f_incident f ON d.row_key = f.incident_key
JOIN fidelity_mdwdb.d_lov_map lov_map ON f.state_src_key = lov_map.src_key and  lov_map.dimension_class = 'STATE~INCIDENT'
  AND lov_map.dimension_wh_code IN('RESOLVED','CLOSED') 
  AND TIMESTAMPDIFF(MINUTE,d.opened_on,coalesce(d.last_resolved_on,d.closed_on))<30 
WHERE d.first_call_resolution_flag<> 'Y'
 

