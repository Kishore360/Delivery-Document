

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from whirlpool_mdsdb.problem_task_final a
 JOIN   whirlpool_mdwdb.f_problem_task b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where a.u_total_extensions <> b.u_total_extensions_c) temp;