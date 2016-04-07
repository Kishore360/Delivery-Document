

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_final s
left join tivo_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
 WHERE case when s.u_result_of_major_inc_p0='1' then 'Y' else 'N' end <> t.result_of_major_inc_p0_c_flag
) temp