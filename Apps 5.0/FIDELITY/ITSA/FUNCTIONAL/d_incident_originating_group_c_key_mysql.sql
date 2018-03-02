
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from fidelity_mdsdb.incident_final s
join fidelity_mdwdb.d_incident t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join fidelity_mdwdb.d_internal_organization_group l
on s.u_originating_group  = concat('GROUP~',l.row_id) and s.sourceinstance=t.source_id
 WHERE coalesce(l.row_key,case when s.u_originating_group  is Null then 0 else -1 end)  <> t.originating_group_c_key
) temp


