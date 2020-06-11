/* No of calls made by each caller*/
select 
employee_name
, num_of_calls 
,time_spent
from (
select
dintcon_emp.full_name as employee_name
,count(1) as num_of_calls
,to_char(sum(f.time_spent/86400.00),'FM9,999,990.0') time_spent

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'
join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon
on dintcon.row_key=f.caller_key

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

group by 
dintcon_emp.full_name 
order by case when dintcon_emp.full_name='UNSPECIFIED' then '0' else dintcon_emp.full_name end
)
;
