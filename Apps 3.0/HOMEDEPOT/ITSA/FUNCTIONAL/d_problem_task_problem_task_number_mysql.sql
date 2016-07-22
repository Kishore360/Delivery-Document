SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.u_problem_task_final a
 left  JOIN   homedepot_mdwdb.d_problem_task b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where a.number <> b.problem_task_number) temp;

