select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
from rogers6_mdwdb.f_incident f 
join rogers6_mdwdb.d_internal_contact d on f.changed_by=d.user_name and f.source_id=d.source_id
join rogers6_mdwdb.d_lov_map lov ON (f.state_src_key = lov.src_key and lov.dimension_class = 'STATE~INCIDENT' )
where lov.dimension_wh_code  in ('RESOLVED','CLOSED') and
(case when coalesce(f.last_resolved_by_key,0)=0 then (case when coalesce(f.closed_by_key,0)=0 then
coalesce(d.row_key,-1) else f.closed_by_key end) else f.last_resolved_by_key end <> f.last_resolved_by_key)
and d.soft_deleted_flag='N' and lov.soft_deleted_flag='N')temp;  

