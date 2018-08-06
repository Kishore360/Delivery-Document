	 
	 
	 
 SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'Age_key not populated correctly' ELSE 'SUCCESS' END as Message 
FROM ( 
     select a.assigned_to_key,a.vendor_name_c, a.grouped_vendor_name_c,a.week_start_key,b.prev_week_start_key,ending,beg from (
select assigned_to_key,a12.vendor_name_c, a12.grouped_vendor_name_c, prev_week_start_key, week_start_key,sum(ending_backlog) ending
FROM     mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_weekly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
where  week_start_key>=20180101 and week_start_key<=20180601
group by 1 ,2,3,4,5 )a 
join (
select assigned_to_key,a12.vendor_name_c, a12.grouped_vendor_name_c,  prev_week_start_key,week_start_key,sum(beginning_backlog) beg   
FROM     mcdonalds_mdwdb.f_n_request_item_vdr_io_snapshot_weekly_c
Join mcdonalds_mdwdb.d_internal_contact a12 ON assigned_to_key = a12.row_key
where  prev_week_start_key>=20180101 and prev_week_start_key<=20180601
group by 1 ,2,3,4,5)b 
on   a.assigned_to_key=b.assigned_to_key and a.week_start_key=b.prev_week_start_key where ending<>beg)a;

