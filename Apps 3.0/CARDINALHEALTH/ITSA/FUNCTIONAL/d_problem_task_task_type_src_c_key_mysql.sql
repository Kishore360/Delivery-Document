



 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.problem_task_final a
JOIN  cardinalhealth_mdwdb.d_problem_task b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_lov LKP
 ON COALESCE(CONCAT('TASK_TYPE_C~PROBLEM_TASK','~','~','~',upper(a.u_ptask_type)),'UNSPECIFIED')= LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN a.u_ptask_type IS NULL THEN 0 else -1 end) <> b.task_type_src_c_key)c
 
 
 