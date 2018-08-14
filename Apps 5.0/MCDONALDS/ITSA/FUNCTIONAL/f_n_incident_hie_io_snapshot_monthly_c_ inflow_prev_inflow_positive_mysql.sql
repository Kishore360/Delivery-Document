SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM (    
  select a.month_start_key,b.prev_month_start_key,inflow,prev_inflow from (
select month_start_key,sum(inflow_count) inflow
FROM     mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
-- where  month_start_key>=20180101 and month_start_key<=20180326
group by 1)a 
join (
select prev_month_start_key,sum(prev_inflow_count) prev_inflow   
FROM     mcdonalds_mdwdb.f_n_request_item_hie_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
-- where  prev_month_start_key>=20180101 and prev_month_start_key<=20180326
group by 1 )b 
on   a.month_start_key=b.prev_month_start_key where inflow=prev_inflow)a;

