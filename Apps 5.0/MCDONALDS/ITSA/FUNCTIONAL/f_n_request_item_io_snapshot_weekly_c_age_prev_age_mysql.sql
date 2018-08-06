	   SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM (  
	 select a.assignment_group_key,a.priority_src_key,b.business_service_c_key,a.week_start_key,b.prev_week_start_key,round(truncate(age,2)),round(truncate(prev_age,2)) from (
select assignment_group_key ,priority_src_key,business_service_c_key,prev_week_start_key, week_start_key,sum(age/86400) age
FROM     mcdonalds_mdwdb.f_n_request_item_io_snapshot_weekly_c
group by 1 ,2,3,4,5 )a 
join (
select assignment_group_key ,priority_src_key,business_service_c_key, prev_week_start_key,week_start_key,sum((prev_age/86400)) prev_age
FROM     mcdonalds_mdwdb.f_n_request_item_io_snapshot_weekly_c
group by 1 ,2,3,4,5)b 
on  a.week_start_key=b.prev_week_start_key 
where a.assignment_group_key=b.assignment_group_key 
and  a.priority_src_key=b.priority_src_key
and a.business_service_c_key=b.business_service_c_key
 -- and prev_age not in (0) and
and round(truncate(age,2))<>round(truncate(prev_age,2)))a ;

