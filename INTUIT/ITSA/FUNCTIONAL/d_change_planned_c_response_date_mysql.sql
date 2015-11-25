
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.d_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where a.u_planned_response_date <> c.planned_response_date) g