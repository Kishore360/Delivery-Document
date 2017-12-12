 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.problem_final src
join 
svb_mdwdb.f_problem c
on src.sys_id=c.row_id and src.sourceinstance=c.source_id
where  src.sys_mod_count<>c.update_count_c

 )c		
