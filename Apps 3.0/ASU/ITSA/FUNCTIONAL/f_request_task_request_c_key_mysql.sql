
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdsdb.sc_req_item_final l 
ON s.request_item=l.sys_id and s.sourceinstance=l.sourceinstance  
left join asu_mdwdb.d_request l1
on COALESCE(l.request,'UNSPECIFIED')=l1.row_id and l.sourceinstance=l1.source_id
WHERE COALESCE(l1.row_key,CASE WHEN l.request IS NULL THEN 0 else -1 end)<> (t.request_c_key) 
) temp