 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.problem_final d 
join 
svb_mdwdb.d_problem p
on p.row_id = d.sys_id and p.source_id = d.sourceinstance
where  d.reassignment_count<>p.reassignment_count
 )c
