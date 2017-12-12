
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join asu_mdwdb.d_internal_contact l
on concat('INTERNAL_CONTACT~',(s.u_requester))=l.row_id and s.sourceinstance=l.source_id
WHERE  l.row_key <> t.req_task_requester_c_key
) temp

