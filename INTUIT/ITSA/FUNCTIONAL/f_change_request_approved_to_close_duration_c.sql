SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from intuit_mdsdb.change_request_final a
 left  JOIN  intuit_mdwdb.f_change_request b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
 where  timestampdiff(SECOND,a.approval_set,a.closed_at) <> b.approved_to_close_duration_c )b

