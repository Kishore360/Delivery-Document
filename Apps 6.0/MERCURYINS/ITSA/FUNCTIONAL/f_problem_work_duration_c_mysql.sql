SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from mercury_mdsdb.problem_final a
left join mercury_mdwdb.f_problem b
on a.sys_id=b.row_id and
a.sourceinstance=b.source_id
where coalesce(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.u_work_duration),0)
<>b.work_duration_c)a;