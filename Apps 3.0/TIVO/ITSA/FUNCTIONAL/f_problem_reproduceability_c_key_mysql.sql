

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_final s
left join tivo_mdwdb.f_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l
on concat('REPRODUCEABILITY_C~PROBLEM~~~',s.u_reproduceability) = l.row_id and s.sourceinstance=t.source_id
 WHERE coalesce(l.row_key, case when s.u_reproduceability is null then 0 else -1 end) <> t.reproduceability_src_c_key
) temp

