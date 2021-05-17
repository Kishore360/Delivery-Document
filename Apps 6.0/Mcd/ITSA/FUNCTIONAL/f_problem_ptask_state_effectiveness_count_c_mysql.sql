SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.ptask_state_effectiveness_count_c' ELSE 'SUCCESS' END as Message 
from mcd_mdwdb.f_problem fact
join (select lkp.sys_id,count(src.number) as cnt_effectiveness from mcd_mdsdb.problem_task_final src
join mcd_mdsdb.problem_final lkp
on src.problem=lkp.sys_id and src.sourceinstance=lkp.sourceinstance
group by 1)tmp
on  tmp.sys_id=fact.row_id
where tmp.cnt_effectiveness<>fact.ptask_state_effectiveness_count_c;