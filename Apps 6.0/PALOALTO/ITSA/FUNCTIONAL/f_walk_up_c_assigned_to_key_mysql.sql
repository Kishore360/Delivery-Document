SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_walk_up_final s
left join paloalto_mdwdb.f_walk_up_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join paloalto_mdwdb.d_internal_contact lkp
on lkp.row_id = (concat('INTERNAL_CONTACT~',assigned_to)) AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.assigned_to_key) temp

