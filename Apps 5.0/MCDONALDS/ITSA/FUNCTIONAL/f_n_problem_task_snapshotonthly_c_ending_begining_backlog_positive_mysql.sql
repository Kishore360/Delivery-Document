SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE  'SUCCESS'  END as Result, 
CASE WHEN count(1)>0  THEN  'Age_key not populated correctly' ELSE  'SUCCESS'  END as Message 
from (   
select a.assignment_group_key,a.month_start_key,b.prev_month_start_key,ending,beg from (
select assignment_group_key ,prev_month_start_key, month_start_key,sum(ending_backlog) ending
FROM     mcdonalds_mdwdb.f_n_problem_task_io_snapshot_monthly_c
group by 1 ,2,3 )a 
join (
select assignment_group_key , prev_month_start_key,month_start_key,sum(beginning_backlog) beg   
FROM     mcdonalds_mdwdb.f_n_problem_task_io_snapshot_monthly_c
group by 1 ,2,3)b 
on  a.month_start_key=b.prev_month_start_key where a.assignment_group_key=b.assignment_group_key  and ending=beg)a;