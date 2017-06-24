SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
WHERE a.sys_created_by <> b.created_by ) temp