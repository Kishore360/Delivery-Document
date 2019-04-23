SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from rogers_mdsdb.problem_final a
left join rogers_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where  a.contact_type <> b.contact_type_c)g



