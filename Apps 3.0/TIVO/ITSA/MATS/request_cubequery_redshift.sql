
select 'f_request' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11
union
select 'd_location' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11
 join  ldb.d_location  a12
on(a11.location_key = a12.row_key)
union
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11
join	ldb.d_internal_contact	a13
  on 	(a11.opened_by_key = a13.row_key)
union
select 'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11
  join	ldb.d_calendar_time	a14
  on 	(a11.opened_time_key = a14.row_key)	
union
select 'd_request' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11
join	ldb.d_request	a15
  on 	(a11.request_key = a15.row_key)  
union
select 'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join	ldb.d_calendar_date	a16
  on 	(a11.opened_on_key = a16.row_key)
union
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join	ldb.d_internal_contact	a17
  on 	(a11.assigned_to_key = a17.row_key)	
union
select 'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join	ldb.d_internal_organization_group	a18
  on 	(a11.assignment_group_key = a18.row_key)	 
 union
select 'd_internal_contact_caller_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join	ldb.d_internal_contact_caller_c	a19
  on 	(a11.caller_key = a19.row_key)
union
select 'd_request_category_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
join	ldb.d_request_category_c	a110
  on 	(a11.category_src_c_key = a110.row_key)	
 union
select 'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_configuration_item	a111
  on 	(a11.configuration_item_key = a111.row_key)	
union
select 'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_internal_contact	a13
  on 	(a11.opened_by_key = a13.row_key) 
join	ldb.d_internal_contact_mdm	a112
  on 	(a13.row_current_key = a112.row_current_key)
union
select 'd_hr_change_category' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
join	ldb.d_hr_change_category	a113
  on 	(a11.hr_category_src_key = a113.row_key)	
 union
select 'd_hr_change' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_hr_change	a114
  on 	(a11.hr_change_key = a114.row_key)	
union
select 'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
  join	ldb.d_calendar_time	a14
  on 	(a11.opened_time_key = a14.row_key)	
join	ldb.d_calendar_time_hour	a115
  on 	(a14.hour_24_format_num = a115.hour_24_format_num)	
 union
select 'd_sc_request_stage' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_sc_request_stage	a116
  on 	(a11.stage_src_key = a116.row_key)	
 union
select 'd_sc_request_request_state' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_sc_request_request_state	a117
  on 	(a11.state_src_key = a117.row_key)	
 union
select 'd_request_request_type_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_request_request_type_c	a118
  on 	(a11.report_type_src_c_key = a118.row_key)	
 union
select 'd_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_internal_contact_requested_for	a119
  on 	(a11.requested_for_key = a119.row_key)	
 union
select 'd_master_item_sub_category_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_master_item_sub_category_c	a120
  on 	(a11.sub_category_c_key = a120.row_key)	
union
select 'd_task_approval' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
join	ldb.d_task_approval	a121
  on 	(a11.approval_state_src_key = a121.row_key)	
union
select 'd_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
join	ldb.d_internal_contact_task_closed_by	a122
  on 	(a11.closed_by_key = a122.row_key)	
union
select 'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11   
join	ldb.d_task_priority	a123
  on 	(a11.priority_src_key = a123.row_key)	
 union
select 'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_request a11  
join	ldb.d_calendar_date	a16
  on 	(a11.opened_on_key = a16.row_key)
join	ldb.d_calendar_month	a124
  on 	(a16.month_start_date_key = a124.row_key)
