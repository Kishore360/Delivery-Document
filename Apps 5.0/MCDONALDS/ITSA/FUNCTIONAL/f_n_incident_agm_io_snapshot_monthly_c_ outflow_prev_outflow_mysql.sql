SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN  'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM (    
  select a.month_start_key,b.prev_month_start_key,outflow,prev_outflow from (
select month_start_key,sum(outflow_count) outflow
FROM     mcdonalds_mdwdb.f_n_incident_agm_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_organization a12 ON assignment_gp_manager_key = a12.row_key
-- where  month_start_key>=20180101 and month_start_key<=20180326
group by 1)a 
join (
select prev_month_start_key,sum(prev_outflow_count) prev_outflow   
FROM     mcdonalds_mdwdb.f_n_incident_agm_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_organization a12 ON assignment_gp_manager_key = a12.row_key
-- where  prev_month_start_key>=20180101 and prev_month_start_key<=20180326
group by 1 )b 
on   a.month_start_key=b.prev_month_start_key where outflow<>prev_outflow)a;
