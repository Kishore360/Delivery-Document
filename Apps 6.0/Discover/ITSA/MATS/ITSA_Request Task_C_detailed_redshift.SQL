/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_configuration_item
d_configuration_item_mdm
d_internal_contact
d_internal_contact_assigned_to
d_internal_contact_mdm
d_internal_organization_group
d_location
d_master_item_c
d_req_item_open_by_dept
d_req_item_open_by_loc
d_req_item_opened_by
d_request
d_request_item
d_request_opened_by
d_request_opened_by_dept
d_request_opened_by_loc
d_request_req_for_depart
d_request_req_for_loc
d_request_requested_for
d_request_task
d_request_task_resolved_by_c
d_sc_task_priority
d_sc_task_state
f_request_task */

select 'ldb."f_request_task" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_configuration_item" a12 
	on (a11.configuration_item_key = a12.row_key)  
 union
select 'ldb."d_internal_contact" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_internal_contact" a13 
	on (a11.employee_key = a13.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_internal_contact_assigned_to" a14 
	on (a11.assigned_to_key = a14.row_key)  
 union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_internal_organization_group" a15 
	on (a11.assignment_group_key = a15.row_key)  
 union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_calendar_date" a16 
	on (a11.date_key = a16.row_key)  
 union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_month" a17 
	on (a16.month_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_quarter" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a17 
 on (a16.month_start_date_key = a17.row_key) 
	join "ldb"."d_calendar_quarter" a18 
	on (a17.quarter_start_date_key = a18.row_key)  
 union
select 'ldb."d_request_task" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_task" a19 
	on (a11.request_task_key = a19.row_key)  
 union
select 'ldb."d_request_item" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_item" a110 
	on (a11.request_item_key = a110.row_key)  
 union
select 'ldb."d_req_item_opened_by" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_item" a110 
 on (a11.request_item_key = a110.row_key) 
	join "ldb"."d_req_item_opened_by" a111 
	on (a110.opened_by_key = a111.row_key)  
 union
select 'ldb."d_request" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
	on (a11.request_key = a112.row_key)  
 union
select 'ldb."d_request_opened_by" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) 
	join "ldb"."d_request_opened_by" a113 
	on (a112.opened_by_key = a113.row_key)  
 union
select 'ldb."d_request_requested_for" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) 
	join "ldb"."d_request_requested_for" a114 
	on (a112.requested_for_key = a114.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_configuration_item" a12 
 on (a11.configuration_item_key = a12.row_key) 
	join "ldb"."d_configuration_item_mdm" a115 
	on (a12.mdm_key = a115.row_key)  
 union
select 'ldb."d_internal_contact_mdm" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_internal_contact" a13 
 on (a11.employee_key = a13.row_key) 
	join "ldb"."d_internal_contact_mdm" a116 
	on (a13.employee_mdm_key = a116.row_key)  
 union
select 'ldb."d_location" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_location" a117 
	on (a11.location_key = a117.row_key)  
 union
select 'ldb."d_sc_task_priority" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_sc_task_priority" a118 
	on (a11.priority_src_key = a118.row_key)  
 union
select 'ldb."d_request_task_resolved_by_c" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_task_resolved_by_c" a119 
	on (a11.request_task_resolved_by_c_key = a119.row_key)  
 union
select 'ldb."d_sc_task_state" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_sc_task_state" a120 
	on (a11.state_src_key = a120.row_key)  
 union
select 'ldb."d_calendar_week" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_week" a121 
	on (a16.week_start_date_key = a121.row_key)  
 union
select 'ldb."d_master_item_c" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_item" a110 
 on (a11.request_item_key = a110.row_key) 
	join "ldb"."d_master_item_c" a122 
	on (a110.catalog_item_c_key = a122.row_key)  
 union
select 'ldb."d_req_item_open_by_dept" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_item" a110 
 on (a11.request_item_key = a110.row_key) join "ldb"."d_req_item_opened_by" a111 
 on (a110.opened_by_key = a111.row_key) 
	join "ldb"."d_req_item_open_by_dept" a123 
	on (a111.department_key = a123.row_key)  
 union
select 'ldb."d_req_item_open_by_loc" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request_item" a110 
 on (a11.request_item_key = a110.row_key) join "ldb"."d_req_item_opened_by" a111 
 on (a110.opened_by_key = a111.row_key) 
	join "ldb"."d_req_item_open_by_loc" a124 
	on (a111.location_key = a124.row_key)  
 union
select 'ldb."d_request_opened_by_dept" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) join "ldb"."d_request_opened_by" a113 
 on (a112.opened_by_key = a113.row_key) 
	join "ldb"."d_request_opened_by_dept" a125 
	on (a113.department_key = a125.row_key)  
 union
select 'ldb."d_request_opened_by_loc" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) join "ldb"."d_request_opened_by" a113 
 on (a112.opened_by_key = a113.row_key) 
	join "ldb"."d_request_opened_by_loc" a126 
	on (a113.location_key = a126.row_key)  
 union
select 'ldb."d_request_req_for_depart" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) join "ldb"."d_request_requested_for" a114 
 on (a112.requested_for_key = a114.row_key) 
	join "ldb"."d_request_req_for_depart" a127 
	on (a114.department_key = a127.row_key)  
 union
select 'ldb."d_request_req_for_loc" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_request" a112 
 on (a11.request_key = a112.row_key) join "ldb"."d_request_requested_for" a114 
 on (a112.requested_for_key = a114.row_key) 
	join "ldb"."d_request_req_for_loc" a128 
	on (a114.location_key = a128.row_key)  
 union
select 'ldb."d_calendar_year" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a17 
 on (a16.month_start_date_key = a17.row_key) join "ldb"."d_calendar_quarter" a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join "ldb"."d_calendar_year" a129 
	on (a18.year_start_date_key = a129.row_key) 

