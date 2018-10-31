



    SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( 
select a.assignment_group_key,a.month_start_key,b.prev_month_start_key,begining,prev_begining_backlog from (
select assignment_group_key , month_start_key,sum(beginning_backlog) begining 
FROM     mcdonalds_mdwdb.f_n_request_item_io_snapshot_monthly_c
group by 1 ,2 )a 
join (
select assignment_group_key , prev_month_start_key,sum(prev_beginning_backlog) prev_begining_backlog   
FROM     mcdonalds_mdwdb.f_n_request_item_io_snapshot_monthly_c
group by 1 ,2)b 
on  a.month_start_key=b.prev_month_start_key and a.assignment_group_key=b.assignment_group_key  where begining<>prev_begining_backlog)a;

