SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_service_request_final s
left join paloalto_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join paloalto_mdwdb.d_internal_contact lkp
on lkp.row_id = CONCAT('INTERNAL_CONTACT~',s.u_resolved_by) AND lkp.source_id=s.sourceinstance
WHERE coalesce(lkp.row_key,case when s.u_resolved_by is null then 0 else -1 end ) <> t.last_resolved_by_key) temp

