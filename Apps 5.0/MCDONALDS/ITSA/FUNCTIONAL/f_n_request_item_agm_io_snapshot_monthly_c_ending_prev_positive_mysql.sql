	 





  SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( select a.month_start_key,b.prev_month_start_key,ending,prev_ending_backlog from (
select assignment_gp_manager_key,prev_month_start_key, month_start_key,sum(ending_backlog) ending 
FROM     mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_monthly_c a11
join mcdonalds_mdwdb.d_internal_contact a13 on a11.assignment_gp_manager_key=a13.row_key
-- where  month_start_key>=20180101 and month_start_key<=20180601
group by 1 ,2,3 )a 
join (
select assignment_gp_manager_key, prev_month_start_key,month_start_key,sum(prev_ending_backlog) prev_ending_backlog  
FROM     mcdonalds_mdwdb.f_n_request_item_agm_io_snapshot_monthly_c a11
join mcdonalds_mdwdb.d_internal_contact a13 on a11.assignment_gp_manager_key=a13.row_key
-- where  month_start_key>=20180101 and month_start_key<=20180601
group by 1 ,2,3)b 
on  a.month_start_key=b.prev_month_start_key 
-- AND a.assignment_group_key=b.assignment_group_key    
AND a.assignment_gp_manager_key=b.assignment_gp_manager_key    
WHERE a.assignment_gp_manager_key > 0 and ending =prev_ending_backlog)a;