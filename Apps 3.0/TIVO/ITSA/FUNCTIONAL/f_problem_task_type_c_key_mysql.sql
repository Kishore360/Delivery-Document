
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_task_final s
left join tivo_mdwdb.f_problem_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l 
on concat( 'TYPE~PROBLEM_TASK~~~',upper(s.u_type))=l.row_id and 
s.sourceinstance=l.source_id
WHERE coalesce(l.row_key,case when s.u_type is null then 0 else -1 end) <> t.problem_task_type_c_key
) temp


