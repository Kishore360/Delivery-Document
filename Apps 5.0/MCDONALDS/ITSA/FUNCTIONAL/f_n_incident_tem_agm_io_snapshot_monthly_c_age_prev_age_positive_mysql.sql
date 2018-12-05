  SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( select a.assignment_gp_manager_key,a.priority_src_key,b.business_service_c_key,a.month_start_key,b.prev_month_start_key,coalesce(age,0),coalesce(prev_age,0) from (
select assignment_group_key,assignment_gp_manager_key ,priority_src_key,business_service_c_key,prev_month_start_key, month_start_key,sum(age/86400) age
FROM     mcdonalds_mdwdb.f_n_incident_agm_io_snapshot_monthly_c
   join mcdonalds_mdwdb.d_internal_organization a13 on assignment_gp_manager_key=a13.row_key
-- where  month_start_key>=20180101 and month_start_key<=20180601
group by 1 ,2,3,4,5 )a 
join (
select assignment_group_key,assignment_gp_manager_key, priority_src_key,business_service_c_key, prev_month_start_key,month_start_key,sum((prev_age/86400)) prev_age
FROM     mcdonalds_mdwdb.f_n_incident_agm_io_snapshot_monthly_c
   join mcdonalds_mdwdb.d_internal_organization a13 on assignment_gp_manager_key=a13.row_key
-- where  prev_month_start_key>=20180101 and prev_month_start_key<=20180601
group by 1 ,2,3,4,5)b 
on  a.month_start_key=b.prev_month_start_key 
where a.assignment_gp_manager_key=b.assignment_gp_manager_key 
and  a.priority_src_key=b.priority_src_key
and a.business_service_c_key=b.business_service_c_key
 -- and prev_age not in (0) and
and  (age)=(prev_age) )a;