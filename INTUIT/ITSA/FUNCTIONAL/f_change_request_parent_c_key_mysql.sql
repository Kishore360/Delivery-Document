SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from intuit_mdsdb.change_request_final a
 left  JOIN  intuit_mdwdb.f_change_request b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
left join (select row_id,row_key from intuit_mdwdb.d_request_task) c
on a.parent = c.row_id
 where  c.row_key <> b.parent_c_key ) temp
