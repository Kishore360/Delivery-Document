/* Tables Accessed:
d_application
d_application_mdm
d_business_service
d_business_service_business_channel_c
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
d_lov_employee_type_c
d_lov_problem_task_category
d_lov_problem_task_completion_code
d_lov_problem_task_status
d_problem
d_problem_assignment_group
d_problem_priority
d_problem_state
d_problem_task
d_problem_task_approval
d_problem_task_impact
d_problem_task_priority
d_problem_task_reported_type
d_problem_task_state
d_problem_task_subcategory_c
d_problem_task_urgency
f_problem_task */

select 'ldb."f_problem_task" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_application" a12 
	on (a11.application_key = a12.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
	on (a11.assigned_to_key = a13.row_key)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_internal_organization_group" a14 
	on (a11.assignment_group_key = a14.row_key)  
 union
select 'ldb."d_business_service" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_business_service" a15 
	on (a11.business_service_key = a15.row_key)  
 union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_calendar_date" a16 
	on (a11.date_key = a16.row_key)  
 union
select 'ldb."d_configuration_item" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_configuration_item" a17 
	on (a11.configuration_item_key = a17.row_key)  
 union
select 'ldb."d_internal_contact" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_internal_contact" a18 
	on (a11.employee_key = a18.row_key)  
 union
select 'ldb."d_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_month" a19 
	on (a16.month_start_date_key = a19.row_key)  
 union
select 'ldb."d_calendar_week" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_week" a110 
	on (a16.week_start_date_key = a110.row_key)  
 union
select 'ldb."d_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a19 
 on (a16.month_start_date_key = a19.row_key) 
	join "ldb"."d_calendar_quarter" a111 
	on (a19.quarter_start_date_key = a111.row_key)  
 union
select 'ldb."d_calendar_year" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a19 
 on (a16.month_start_date_key = a19.row_key) join "ldb"."d_calendar_quarter" a111 
 on (a19.quarter_start_date_key = a111.row_key) 
	join "ldb"."d_calendar_year" a112 
	on (a111.year_start_date_key = a112.row_key)  
 union
select 'ldb."d_problem" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem" a113 
	on (a11.problem_key = a113.row_key)  
 union
select 'ldb."d_problem_task" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task" a114 
	on (a11.problem_task_key = a114.row_key)  
 union
select 'ldb."d_location" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_location" a115 
	on (a11.location_key = a115.row_key)  
 union
select 'ldb."d_problem_assignment_group" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_assignment_group" a116 
	on (a11.problem_assignment_group_key = a116.row_key)  
 union
select 'ldb."d_problem_priority" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_priority" a117 
	on (a11.problem_priority_src_key = a117.row_key)  
 union
select 'ldb."d_problem_task_approval" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_approval" a118 
	on (a11.approval_src_key = a118.row_key)  
 union
select 'ldb."d_problem_task_reported_type" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_reported_type" a119 
	on (a11.reported_type_src_key = a119.row_key)  
 union
select 'ldb."d_problem_task_impact" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_impact" a120 
	on (a11.impact_src_key = a120.row_key)  
 union
select 'ldb."d_problem_task_priority" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_priority" a121 
	on (a11.priority_src_key = a121.row_key)  
 union
select 'ldb."d_problem_task_state" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_state" a122 
	on (a11.state_src_key = a122.row_key)  
 union
select 'ldb."d_problem_task_urgency" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task_urgency" a123 
	on (a11.urgency_src_key = a123.row_key)  
 union
select 'ldb."d_application_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_application" a12 
 on (a11.application_key = a12.row_key) 
	join "ldb"."d_application_mdm" a124 
	on (a12.mdm_key = a124.row_key)  
 union
select 'ldb."d_business_service_business_channel_c" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_business_service" a15 
 on (a11.business_service_key = a15.row_key) 
	join "ldb"."d_business_service_business_channel_c" a125 
	on (a15.service_business_channel_src_c = a125.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_configuration_item" a17 
 on (a11.configuration_item_key = a17.row_key) 
	join "ldb"."d_configuration_item_mdm" a126 
	on (a17.mdm_key = a126.row_key)  
 union
select 'ldb."d_internal_contact_mdm" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_internal_contact" a18 
 on (a11.employee_key = a18.row_key) 
	join "ldb"."d_internal_contact_mdm" a127 
	on (a18.employee_mdm_key = a127.row_key)  
 union
select 'ldb."d_lov_employee_type_c" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
 on (a11.assigned_to_key = a13.row_key) 
	join "ldb"."d_lov_employee_type_c" a128 
	on (a13.employee_type_c_key = a128.row_key)  
 union
select 'ldb."d_problem_state" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_state" a129 
	on (a11.problem_state_src_key = a129.row_key)  
 union
select 'ldb."d_lov_problem_task_category" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task" a114 
 on (a11.problem_task_key = a114.row_key) 
	join "ldb"."d_lov_problem_task_category" a130 
	on (a114.problem_task_category_c_key = a130.row_key)  
 union
select 'ldb."d_lov_problem_task_completion_code" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task" a114 
 on (a11.problem_task_key = a114.row_key) 
	join "ldb"."d_lov_problem_task_completion_code" a131 
	on (a114.problem_task_completion_code_c_key = a131.row_key)  
 union
select 'ldb."d_lov_problem_task_status" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task" a114 
 on (a11.problem_task_key = a114.row_key) 
	join "ldb"."d_lov_problem_task_status" a132 
	on (a114.problem_task_status_c_key = a132.row_key)  
 union
select 'ldb."d_problem_task_subcategory_c" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task" a11 
 join "ldb"."d_problem_task" a114 
 on (a11.problem_task_key = a114.row_key) 
	join "ldb"."d_problem_task_subcategory_c" a133 
	on (a114.problem_task_subcategory_c_key = a133.row_key) 

