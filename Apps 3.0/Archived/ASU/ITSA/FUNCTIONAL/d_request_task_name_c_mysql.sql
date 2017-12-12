
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.d_request_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdsdb.sc_req_item_final l1
ON s.request_item=l1.sys_id 
left join asu_mdsdb. sc_cat_item_final l2 
on l2.sys_id=l1.cat_item
WHERE l2.name <> t.name_c
) temp