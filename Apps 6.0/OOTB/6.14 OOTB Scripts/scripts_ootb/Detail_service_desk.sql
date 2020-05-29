/* No of calls made by each caller*/
select row_key, source_url
,task_number
,location_name
, num_of_calls 

--,time_spent
from (
select
d.source_url,
 d.call_number as caller_id
 
 ,d.row_key
 ,loc.row_id
,loc.location_name as location_name
,tas.row_id
,tas.task_number
,count(1) as num_of_calls
,sum(time_spent/60.00) time_spent
from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'
join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon
on dintcon.row_key=f.caller_key
join	 #DWH_TABLE_SCHEMA.d_location	loc
on loc.row_key=f.location_key
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon_emp
on dintcon_emp.row_key=f.opened_by_key

join	 #DWH_TABLE_SCHEMA.d_h_all_hierarchies	d_all
on dintcon_emp.row_key=d_all.lev_0_key
and d_all.hierarchy_class='EMPLOYEE'

inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang1
 ON d_all.lev_1_key=mang1.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang2
 ON d_all.lev_2_key=mang2.ROW_KEY
 
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang3
 ON d_all.lev_3_key=mang3.ROW_KEY
  
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang4
 ON d_all.lev_4_key=mang4.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang5
 ON d_all.lev_5_key=mang5.ROW_KEY

inner JOIN  #DWH_TABLE_SCHEMA.d_task tas
 ON f.task_key=tas.ROW_KEY
 
 where loc.row_id not in ('8228cda2ac1d55eb7029baf443945c37','30fffb993790200044e0bfc8bcbe5dcc')
 --loc.location_name  in  ('Bockenheimer Landstraße 223, Frankfurt','Bockenheimer Landstraße 123, Frankfurt')
group by 
d.source_url,
 d.call_number
 ,d.row_key
 ,loc.row_id
,loc.location_name
,tas.row_id
,tas.task_number
order by  
d.row_key
 ,loc.row_id
 ,tas.row_id

)
where location_name not in  ('Bockenheimer Landstraße 223, Frankfurt','Bockenheimer Landstraße 123, Frankfurt');
