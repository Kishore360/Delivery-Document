SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.ptask_effectiveness_sum_c' ELSE 'SUCCESS' END as Message 
from mcd_mdsdb.problem_final src
join mcd_mdwdb.f_problem f_problem
on src.sys_id=f_problem.row_id and src.sourceinstance=f_problem.source_id
join (select f_problem_task.problem_key,SUM(case                  
                when d_problem_task.closed_on<=d_problem_task.due_on then 1                  
                else 0              
            end) AS der  FROM
mcd_mdwdb.f_problem_task f_problem_task      
INNER JOIN mcd_mdwdb.d_problem_task d_problem_task 
ON f_problem_task.problem_task_key=d_problem_task.row_key 
where f_problem_task.problem_key>0
group by 1)tmp
on f_problem.problem_key=tmp.problem_key
where f_problem.ptask_effectiveness_sum_c<>tmp.der;