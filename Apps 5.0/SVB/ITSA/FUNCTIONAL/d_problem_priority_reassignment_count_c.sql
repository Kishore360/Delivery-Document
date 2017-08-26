 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_problem d 
join (select problem_key, count(row_key) as reassignment_count from svb_mdwdb.f_problem_activity 
	where task_attribute_wh_name='priority' and task_wh_type='problem' and problem_key not in(0,-1) and task_attribute_wh_old_value is not null group by problem_key) f
on d.row_key=f.problem_key and d.priority_reassignment_count_c<>f.reassignment_count
where d.priority_reassignment_count_c<>COALESCE(f.reassignment_count,0))a
;