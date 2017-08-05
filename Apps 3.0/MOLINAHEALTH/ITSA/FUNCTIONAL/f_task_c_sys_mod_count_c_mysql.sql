SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from molinahealth_mdsdb.task_final a
left JOIN  molinahealth_mdwdb.f_task_c b
ON a.sys_id =b.row_id AND a.sourceinstance= b.source_id 
where a.sys_mod_count<>b.sys_mod_count )c



