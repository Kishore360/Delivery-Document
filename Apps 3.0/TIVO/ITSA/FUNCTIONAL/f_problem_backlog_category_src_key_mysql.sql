
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_final s
left join tivo_mdwdb.f_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l 
on concat( 'CATEGORY_C~PROBLEM~~~',upper(s.u_category))=l.row_id and 
s.sourceinstance=l.source_id
WHERE coalesce(l.row_key,CASE WHEN  s.u_category IS NULL THEN 0 else -1 end) <> category_src_key
) temp



