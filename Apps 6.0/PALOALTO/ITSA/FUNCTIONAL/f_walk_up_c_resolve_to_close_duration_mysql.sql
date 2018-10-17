SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_walk_up_final s 
left join paloalto_mdwdb.f_walk_up_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN paloalto_mdwdb.d_walk_up_c a 
ON s.sys_id= a.row_id AND s.sourceinstance= a.source_id
JOIN  paloalto_mdwdb.d_lov_map br 
ON  a.state_src_key = br.src_key
WHERE case when br.dimension_wh_code='CLOSED' THEN 
case when s.closed_at<coalesce(s.u_resolved_at,s.closed_at) then null else TIMESTAMPDIFF(SECOND,CONVERT_TZ(coalesce(s.u_resolved_at,s.closed_at),'GMT','America/Los_Angeles'),
CONVERT_TZ(s.closed_at,'GMT','America/Los_Angeles')) end ELSE NULL end
<> f.resolve_to_close_duration)b  