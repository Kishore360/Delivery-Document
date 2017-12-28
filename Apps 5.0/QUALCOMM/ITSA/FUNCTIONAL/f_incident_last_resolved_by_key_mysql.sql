select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
from qualcomm_mdsdb.incident_final x 
left outer join qualcomm_mdwdb.d_internal_contact z on
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=z.row_id  AND x.sourceinstance= z.source_id
JOIN   qualcomm_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id 
join qualcomm_mdwdb.d_lov_map map on ( B.state_src_key = map.src_key AND map.dimension_class = 'STATE~INCIDENT')
where last_resolved_by_key<>  coalesce(z.row_key,case when resolved_by is null then 0 else -1 end) and map.dimension_wh_code ='RESOLVED' )temp;  

