
  SELECT CASE WHEN count(1)<1  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)<1  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( 
select a.*,b.prev_age from
(select assigned_to_key,a12.full_name,a12.vendor_name_c, a12.grouped_vendor_name_c  ,priority_src_key,business_service_key,prev_month_start_key, month_start_key,sum(age/86400) age
FROM     mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
-- where    month_start_key='20180122' and a12.full_name='Aakanksha Sharma' and  priority_src_key=54610 and business_service_c_key= 49 and  month_start_key>=20180101 and month_start_key<=20180601 
group by 1 ,2,3,4,5,6,7,8)a
join
(
select assigned_to_key,a12.full_name,a12.vendor_name_c, a12.grouped_vendor_name_c  ,priority_src_key,business_service_key, prev_month_start_key,month_start_key,sum((prev_age/86400)) prev_age
FROM     mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_monthly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
--where    prev_month_start_key='20180122' and a12.full_name='Aakanksha Sharma' and  priority_src_key=54610 and business_service_c_key= 49 and  prev_month_start_key>=20180101 and prev_month_start_key<=20180601 
group by 1 ,2,3,4,5,6,7,8)b

on  a.month_start_key=b.prev_month_start_key 
where  a.assigned_to_key=b.assigned_to_key and
 a.priority_src_key=b.priority_src_key
and a.business_service_key=b.business_service_key 
-- and a.month_start_key>=20180101 and a.month_start_key<=20180601 
 -- and prev_age not in (0) and
and  (age)<>(prev_age) )a;

