select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
from qualcomm_mdsdb.incident_final x 
<<<<<<< HEAD
=======
left outer join qualcomm_mdwdb.d_internal_contact y 
ON (y.user_name = x.sys_updated_by  AND x.sourceinstance= y.source_id)
>>>>>>> 173a273a5c9ca02e0c3aa4910136dbb1a4fc6c24
left outer join qualcomm_mdwdb.d_internal_contact z on
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=z.row_id  AND x.sourceinstance= z.source_id
JOIN   qualcomm_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id 
join qualcomm_mdwdb.d_lov_map map on ( B.state_src_key = map.src_key AND map.dimension_class = 'STATE~INCIDENT')
<<<<<<< HEAD
where last_resolved_by_key<>  coalesce(z.row_key,case when resolved_by is null then 0 else -1 end) and map.dimension_wh_code ='RESOLVED' )temp;  
=======
where last_resolved_by_key<>
case when (coalesce(z.row_key,case when resolved_by is null then 0 end ))=0 
then coalesce(y.row_key,-1) else coalesce(z.row_key,case when resolved_by is null then 0 else -1 end) end
and map.dimension_wh_code ='RESOLVED' and  B.pivot_date between z.effective_from and z.effective_to
and last_resolved_by_key<>-2)temp;  
>>>>>>> 173a273a5c9ca02e0c3aa4910136dbb1a4fc6c24

