SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.ptask_state_effectiveness_sum_c' ELSE 'SUCCESS' END as Message 
from mcd_mdsdb.problem_final src
join mcd_mdwdb.f_problem f_problem
on src.sys_id=f_problem.row_id and src.sourceinstance=f_problem.source_id
join (select f_problem_task.problem_key,SUM(case                  
                when (d_lov_map.dimension_wh_code='CLOSED'                  
                and d_problem_task.closed_on<d_problem_task.due_on)                   
                OR (d_lov_map.dimension_wh_code<>'CLOSED'                  
                and d_problem_task.due_on<convert_tz(d_df_consumption.freshness_date,
                d_df_consumption.source_tz,
                d_df_consumption.target_tz)) then 1                  
                else 0              
            end) AS der  FROM
mcd_mdwdb.f_problem_task f_problem_task      
INNER JOIN mcd_mdwdb.d_problem_task d_problem_task 
ON f_problem_task.problem_task_key=d_problem_task.row_key 
INNER JOIN mcd_mdwdb.d_lov_map d_lov_map 
ON f_problem_task.state_src_key=d_lov_map.src_key 
and d_lov_map.dimension_class='STATE~PROBLEM_TASK' 
LEFT OUTER JOIN mcd_mdwdb.d_df_consumption d_df_consumption 
ON f_problem_task.source_id=d_df_consumption.sourceinstance 
and d_df_consumption.physical_table='f_problem_task' 
where f_problem_task.problem_key>0
group by 1)tmp
on f_problem.problem_key=tmp.problem_key
where f_problem.ptask_state_effectiveness_sum_c<>tmp.der;