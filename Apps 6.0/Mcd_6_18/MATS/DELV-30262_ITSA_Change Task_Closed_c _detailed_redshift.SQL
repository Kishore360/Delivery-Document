/* Tables Accessed:
D_CHANGE_TASK_ASSIGNMENT_GROUP
D_CHANGE_TASK_BUSINESS_SERVICE
D_CHANGE_TASK_OWNED_BY_C
D_INTERNAL_ORGANIZATION_CHANGE_TASK_VENDOR_C
d_change_request
d_change_request_assignment_group
d_change_request_close_code
d_change_request_phase
d_change_request_phase_state
d_change_request_priority
d_change_request_state
d_change_request_type
d_change_task
d_change_task_application
d_change_task_application_mdm
d_change_task_approval
d_change_task_assigned_to
d_change_task_assignment_group_manager
d_change_task_calendar_month
d_change_task_calendar_quarter
d_change_task_calendar_year
d_change_task_configuration_item
d_change_task_configuration_item_mdm
d_change_task_date
d_change_task_employee
d_change_task_employee_mdm
d_change_task_impact
d_change_task_location
d_change_task_priority
d_change_task_reported_type
d_change_task_state
d_change_task_task_type
d_change_task_urgency
f_change_task_closed */


select 'ldb."f_change_task_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 union
select 'ldb."d_change_task_employee" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_employee" a12 
	on (a11.change_task_employee_key = a12.row_key)  
 union
select 'ldb."d_change_request" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request" a13 
	on (a11.change_request_key = a13.row_key)  
 union
select 'ldb."d_change_task" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
	on (a11.change_task_key = a14.row_key)  
 union
select 'ldb."d_change_task_application" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_application" a15 
	on (a14.application_key = a15.row_key)  
 union
select 'ldb."d_change_task_assigned_to" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_assigned_to" a16 
	on (a14.assigned_to_key = a16.row_key)  
 union
select 'ldb."D_CHANGE_TASK_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a17 
	on (a14.assignment_group_key = a17.row_key)  
 union
select 'ldb."D_CHANGE_TASK_BUSINESS_SERVICE" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."D_CHANGE_TASK_BUSINESS_SERVICE" a18 
	on (a14.business_service_key = a18.row_key)  
 union
select 'ldb."d_change_task_date" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_date" a19 
	on (a11.change_task_date_key = a19.row_key)  
 union
select 'ldb."d_change_task_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_date" a19 
 on (a11.change_task_date_key = a19.row_key) 
	join "ldb"."d_change_task_calendar_month" a110 
	on (a19.month_start_date_key = a110.row_key)  
 union
select 'ldb."d_change_task_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_date" a19 
 on (a11.change_task_date_key = a19.row_key) join "ldb"."d_change_task_calendar_month" a110 
 on (a19.month_start_date_key = a110.row_key) 
	join "ldb"."d_change_task_calendar_quarter" a111 
	on (a110.quarter_start_date_key = a111.row_key)  
 union
select 'ldb."d_change_task_configuration_item" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_configuration_item" a112 
	on (a14.configuration_item_key = a112.row_key)  
 union
select 'ldb."d_change_task_state" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_state" a113 
	on (a14.state_src_key = a113.row_key)  
 union
select 'ldb."d_change_request_priority" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request_priority" a114 
	on (a11.parent_priority_src_key = a114.row_key)  
 union
select 'ldb."d_change_task_employee_mdm" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_employee" a12 
 on (a11.change_task_employee_key = a12.row_key) 
	join "ldb"."d_change_task_employee_mdm" a115 
	on (a12.employee_mdm_key = a115.row_key)  
 union
select 'ldb."d_change_request_assignment_group" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request_assignment_group" a116 
	on (a11.parent_assignment_group_key = a116.row_key)  
 union
select 'ldb."d_change_request_close_code" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request" a13 
 on (a11.change_request_key = a13.row_key) 
	join "ldb"."d_change_request_close_code" a117 
	on (a13.close_code_src_key = a117.row_key)  
 union
select 'ldb."d_change_request_phase" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request" a13 
 on (a11.change_request_key = a13.row_key) 
	join "ldb"."d_change_request_phase" a118 
	on (a13.phase_src_key = a118.row_key)  
 union
select 'ldb."d_change_request_phase_state" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request" a13 
 on (a11.change_request_key = a13.row_key) 
	join "ldb"."d_change_request_phase_state" a119 
	on (a13.phase_state_src_key = a119.row_key)  
 union
select 'ldb."d_change_request_state" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request_state" a120 
	on (a11.parent_state_src_key = a120.row_key)  
 union
select 'ldb."d_change_task_application_mdm" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) join "ldb"."d_change_task_application" a15 
 on (a14.application_key = a15.row_key) 
	join "ldb"."d_change_task_application_mdm" a121 
	on (a15.MDM_KEY = a121.row_key)  
 union
select 'ldb."d_change_task_approval" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_approval" a122 
	on (a14.APPROVAL_SRC_KEY = a122.row_key)  
 union
select 'ldb."d_change_task_calendar_year" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task_date" a19 
 on (a11.change_task_date_key = a19.row_key) join "ldb"."d_change_task_calendar_month" a110 
 on (a19.month_start_date_key = a110.row_key) join "ldb"."d_change_task_calendar_quarter" a111 
 on (a110.quarter_start_date_key = a111.row_key) 
	join "ldb"."d_change_task_calendar_year" a123 
	on (a111.year_start_date_key = a123.row_key)  
 union
select 'ldb."d_change_task_configuration_item_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) join "ldb"."d_change_task_configuration_item" a112 
 on (a14.configuration_item_key = a112.row_key) 
	join "ldb"."d_change_task_configuration_item_mdm" a124 
	on (a112.MDM_KEY = a124.row_key)  
 union
select 'ldb."d_change_task_reported_type" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_reported_type" a125 
	on (a14.reported_type_src_key = a125.row_key)  
 union
select 'ldb."d_change_task_impact" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_impact" a126 
	on (a14.impact_src_key = a126.row_key)  
 union
select 'ldb."d_change_task_location" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_location" a127 
	on (a14.location_key = a127.row_key)  
 union
select 'ldb."d_change_task_priority" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_priority" a128 
	on (a14.priority_src_key = a128.row_key)  
 union
select 'ldb."d_change_task_task_type" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_task_type" a129 
	on (a14.task_type_src_key = a129.row_key)  
 union
select 'ldb."d_change_task_urgency" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) 
	join "ldb"."d_change_task_urgency" a130 
	on (a14.urgency_src_key = a130.row_key)  
 union
select 'ldb."d_change_request_type" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_request_type" a131 
	on (a11.parent_type_src_key = a131.row_key)  
 union
select 'ldb."d_change_task_assignment_group_manager" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a17 
 on (a14.assignment_group_key = a17.row_key) 
	join "ldb"."d_change_task_assignment_group_manager" a132 
	on (a17.manager_key = a132.row_key)  
 union
select 'ldb."D_CHANGE_TASK_OWNED_BY_C" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) join "ldb"."D_CHANGE_TASK_BUSINESS_SERVICE" a18 
 on (a14.business_service_key = a18.row_key) 
	join "ldb"."D_CHANGE_TASK_OWNED_BY_C" a133 
	on (a18.CHANGE_TASK_BUSINESS_SERVICE_OWNNED_BY_C_KEY = a133.row_key)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CHANGE_TASK_VENDOR_C" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_closed" a11 
 join "ldb"."d_change_task" a14 
 on (a11.change_task_key = a14.row_key) join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a17 
 on (a14.assignment_group_key = a17.row_key) 
	join "ldb"."D_INTERNAL_ORGANIZATION_CHANGE_TASK_VENDOR_C" a134 
	on (a17.CHANGE_TASK_VENDOR_C_KEY = a134.row_key) 

