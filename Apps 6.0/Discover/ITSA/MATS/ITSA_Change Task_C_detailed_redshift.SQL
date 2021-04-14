/* 
Tables Accessed:
d_application
d_application_mdm
d_business_service
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_change_request
d_change_request_assignment_group
d_change_request_close_code
d_change_request_phase
d_change_request_phase_state
d_change_request_priority
d_change_request_state
d_change_request_type
d_change_task
d_change_task_approval
d_change_task_impact
d_change_task_priority
d_change_task_reported_type
d_change_task_state
d_change_task_task_type
d_change_task_urgency
d_configuration_item
d_configuration_item_mdm
d_internal_contact
d_internal_contact_assigned_to
d_internal_contact_mdm
d_internal_organization_group
d_location
d_lov_change_task_category_c
d_lov_change_task_completion_code_c
f_change_task */


select 'ldb."f_change_task" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_application" a12 
	on (a11.application_key = a12.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
	on (a11.assigned_to_key = a13.row_key)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_internal_organization_group" a14 
	on (a11.assignment_group_key = a14.row_key)  
 union
select 'ldb."d_calendar_date" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_calendar_date" a15 
	on (a11.date_key = a15.row_key)  
 union
select 'ldb."d_change_request" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request" a16 
	on (a11.change_request_key = a16.row_key)  
 union
select 'ldb."d_change_task" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
	on (a11.change_task_key = a17.row_key)  
 union
select 'ldb."d_configuration_item" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_configuration_item" a18 
	on (a11.configuration_item_key = a18.row_key)  
 union
select 'ldb."d_internal_contact" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_internal_contact" a19 
	on (a11.employee_key = a19.row_key)  
 union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_calendar_date" a15 
 on (a11.date_key = a15.row_key) 
	join "ldb"."d_calendar_month" a110 
	on (a15.month_start_date_key = a110.row_key)  
 union
select 'ldb."d_calendar_week" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_calendar_date" a15 
 on (a11.date_key = a15.row_key) 
	join "ldb"."d_calendar_week" a111 
	on (a15.week_start_date_key = a111.row_key)  
 union
select 'ldb."d_calendar_quarter" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_calendar_date" a15 
 on (a11.date_key = a15.row_key) join "ldb"."d_calendar_month" a110 
 on (a15.month_start_date_key = a110.row_key) 
	join "ldb"."d_calendar_quarter" a112 
	on (a110.quarter_start_date_key = a112.row_key)  
 union
select 'ldb."d_calendar_year" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_calendar_date" a15 
 on (a11.date_key = a15.row_key) join "ldb"."d_calendar_month" a110 
 on (a15.month_start_date_key = a110.row_key) join "ldb"."d_calendar_quarter" a112 
 on (a110.quarter_start_date_key = a112.row_key) 
	join "ldb"."d_calendar_year" a113 
	on (a112.year_start_date_key = a113.row_key)  
 union
select 'ldb."d_business_service" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_business_service" a114 
	on (a11.business_service_key = a114.row_key)  
 union
select 'ldb."d_change_request_assignment_group" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request_assignment_group" a115 
	on (a11.parent_assignment_group_key = a115.row_key)  
 union
select 'ldb."d_change_request_priority" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request_priority" a116 
	on (a11.parent_priority_src_key = a116.row_key)  
 union
select 'ldb."d_change_request_state" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request_state" a117 
	on (a11.parent_state_src_key = a117.row_key)  
 union
select 'ldb."d_change_request_type" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request_type" a118 
	on (a11.parent_type_src_key = a118.row_key)  
 union
select 'ldb."d_location" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_location" a119 
	on (a11.location_key = a119.row_key)  
 union
select 'ldb."d_application_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_application" a12 
 on (a11.application_key = a12.row_key) 
	join "ldb"."d_application_mdm" a120 
	on (a12.mdm_key = a120.row_key)  
 union
select 'ldb."d_change_request_close_code" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request" a16 
 on (a11.change_request_key = a16.row_key) 
	join "ldb"."d_change_request_close_code" a121 
	on (a16.close_code_src_key = a121.row_key)  
 union
select 'ldb."d_change_request_phase" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request" a16 
 on (a11.change_request_key = a16.row_key) 
	join "ldb"."d_change_request_phase" a122 
	on (a16.phase_src_key = a122.row_key)  
 union
select 'ldb."d_change_request_phase_state" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_request" a16 
 on (a11.change_request_key = a16.row_key) 
	join "ldb"."d_change_request_phase_state" a123 
	on (a16.phase_state_src_key = a123.row_key)  
 union
select 'ldb."d_change_task_approval" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_approval" a124 
	on (a17.approval_src_key = a124.row_key)  
 union
select 'ldb."d_lov_change_task_category_c" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_lov_change_task_category_c" a125 
	on (a17.change_task_category_c_key = a125.row_key)  
 union
select 'ldb."d_lov_change_task_completion_code_c" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_lov_change_task_completion_code_c" a126 
	on (a17.completion_code_c = a126.row_key)  
 union
select 'ldb."d_change_task_reported_type" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_reported_type" a127 
	on (a17.reported_type_src_key = a127.row_key)  
 union
select 'ldb."d_change_task_impact" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_impact" a128 
	on (a17.impact_src_key = a128.row_key)  
 union
select 'ldb."d_change_task_priority" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_priority" a129 
	on (a17.priority_src_key = a129.row_key)  
 union
select 'ldb."d_change_task_state" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_state" a130 
	on (a17.state_src_key = a130.row_key)  
 union
select 'ldb."d_change_task_task_type" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_task_type" a131 
	on (a17.task_type_src_key = a131.row_key)  
 union
select 'ldb."d_change_task_urgency" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_change_task" a17 
 on (a11.change_task_key = a17.row_key) 
	join "ldb"."d_change_task_urgency" a132 
	on (a17.urgency_src_key = a132.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_configuration_item" a18 
 on (a11.configuration_item_key = a18.row_key) 
	join "ldb"."d_configuration_item_mdm" a133 
	on (a18.mdm_key = a133.row_key)  
 union
select 'ldb."d_internal_contact_mdm" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task" a11 
 join "ldb"."d_internal_contact" a19 
 on (a11.employee_key = a19.row_key) 
	join "ldb"."d_internal_contact_mdm" a134 
	on (a19.employee_mdm_key = a134.row_key) 

