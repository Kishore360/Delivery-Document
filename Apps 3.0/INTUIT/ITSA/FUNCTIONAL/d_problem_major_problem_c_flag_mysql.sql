SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.problem_final s
left join intuit_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where t.major_problem_c_flag  <> CASE WHEN COALESCE(s.u_major_problem,0)=1 THEN 'Y' ELSE 'N'END) temp