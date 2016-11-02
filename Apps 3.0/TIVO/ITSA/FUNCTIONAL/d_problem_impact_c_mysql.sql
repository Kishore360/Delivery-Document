


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
from tivo_mdsdb.problem_final s
left join tivo_mdwdb.d_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
 WHERE s.impact <> t.impact_c
) temp