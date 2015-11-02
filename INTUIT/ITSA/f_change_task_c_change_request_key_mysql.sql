 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c on a.sys_id=c.row_id 
and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_change_request b on 
a.parent = b.row_id and a.sourceinstance=b.source_id 
where c.change_request_key <> b.row_key) g