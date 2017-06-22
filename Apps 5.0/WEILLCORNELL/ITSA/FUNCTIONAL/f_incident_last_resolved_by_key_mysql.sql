select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
from weillcornell_mdsdb.incident_final x 
left outer join weillcornell_mdwdb.d_internal_contact y 
ON (y.user_name = x.sys_updated_by  AND x.sourceinstance= y.source_id)
left outer join weillcornell_mdwdb.d_internal_contact z on
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=z.row_id  AND x.sourceinstance= z.source_id
JOIN   weillcornell_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id 
join weillcornell_mdwdb.d_lov_map map on ( B.state_src_key = map.src_key AND map.dimension_class = 'STATE~INCIDENT')
where last_resolved_by_key<>
case when (coalesce(z.row_key,case when resolved_by is null then 0 end ))=0 
then coalesce(y.row_key,-1) else coalesce(z.row_key,case when resolved_by is null then 0 else -1 end) end
and map.dimension_wh_code ='RESOLVED' and last_resolved_by_key<>-2
AND SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' )
)temp;  

