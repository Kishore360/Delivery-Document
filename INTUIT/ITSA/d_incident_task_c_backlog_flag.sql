SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
left join intuit_mdwdb.f_incident_task_c l1
ON b.row_key=l1.incident_task_key  AND  b.source_id=l1.source_id 
left join intuit_mdwdb.d_lov_map l2
on l1.state_src_key=l2.src_key 
WHERE case when l2.dimension_class = 'STATE~U_INCIDENT_TASK' AND    l2.dimension_wh_code NOT IN( 'RESOLVED','CLOSED') then 'Y' else 'N'
end <> b.backlog_flag ) temp