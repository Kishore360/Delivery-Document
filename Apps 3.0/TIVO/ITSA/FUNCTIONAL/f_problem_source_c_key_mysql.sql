SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_final s
left join tivo_mdwdb.f_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l
on concat('SOURCE_C~PROBLEM~~~',u_source)=l.row_id and s.sourceinstance=t.source_id
 WHERE t.source_c_key <> coalesce(l.row_key,case when u_source is null then 0 else -1 end)
) temp