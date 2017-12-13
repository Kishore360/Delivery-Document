
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.problem_final s
left join asu_mdwdb.f_problem   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE 
TIMESTAMPDIFF(second,'1970-01-01',s.business_duration)<> t.business_duration_c)  temp