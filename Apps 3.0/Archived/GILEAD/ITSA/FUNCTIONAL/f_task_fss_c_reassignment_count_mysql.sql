SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from gilead_mdsdb.u_task_fss_final a
left JOIN  gilead_mdwdb.f_task_fss_c b
ON a.sys_id =b.row_id AND a.sourceinstance= b.source_id 
where a.reassignment_count<>b.reassignment_count )c



