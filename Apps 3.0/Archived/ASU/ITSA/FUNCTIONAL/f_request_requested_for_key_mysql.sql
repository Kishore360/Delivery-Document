SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join asu_mdsdb.sc_request_final r
on s.request=r.sys_id and r.sourceinstance=s.sourceinstance
left join asu_mdwdb.d_internal_contact l
on (concat('INTERNAL_CONTACT~',r.requested_for)=l.row_id and s.sourceinstance=l.source_id)
where t.requested_for_key <>l.row_key
) temp 