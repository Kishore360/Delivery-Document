/* 
Tables Accessed:
D_PROBLEM
F_PROBLEM_TASK
d_problem_assignment_group
d_problem_priority
d_problem_state
d_problem_task
d_problem_task_application
d_problem_task_application_mdm
d_problem_task_approval
d_problem_task_assigned_to
d_problem_task_assignment_group
d_problem_task_assignment_group_manager
d_problem_task_business_service
d_problem_task_calendar_month
d_problem_task_calendar_quarter
d_problem_task_calendar_year
d_problem_task_configuration_item
d_problem_task_configuration_item_mdm
d_problem_task_date
d_problem_task_employee
d_problem_task_employee_mdm
d_problem_task_impact
d_problem_task_location
d_problem_task_priority
d_problem_task_reported_type
d_problem_task_state
d_problem_task_urgency */

select 'ldb."F_PROBLEM_TASK" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 union
select 'ldb."d_problem_task_employee" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_employee" a12 
	on (a11.PROBLEM_TASK_EMPLOYEE_KEY = a12.row_key)  
 union
select 'ldb."D_PROBLEM" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."D_PROBLEM" a13 
	on (a11.problem_key = a13.row_key)  
 union
select 'ldb."d_problem_task" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
	on (a11.problem_task_key = a14.row_key)  
 union
select 'ldb."d_problem_task_application" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_application" a15 
	on (a14.application_key = a15.row_key)  
 union
select 'ldb."d_problem_task_assigned_to" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_assigned_to" a16 
	on (a14.assigned_to_key = a16.row_key)  
 union
select 'ldb."d_problem_task_assignment_group" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_assignment_group" a17 
	on (a14.assignment_group_key = a17.row_key)  
 union
select 'ldb."d_problem_task_date" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_date" a18 
	on (a11.PROBLEM_TASK_DATE_KEY = a18.row_key)  
 union
select 'ldb."d_problem_task_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_date" a18 
 on (a11.PROBLEM_TASK_DATE_KEY = a18.row_key) 
	join "ldb"."d_problem_task_calendar_month" a19 
	on (a18.month_start_date_key = a19.row_key)  
 union
select 'ldb."d_problem_task_calendar_quarter" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_date" a18 
 on (a11.PROBLEM_TASK_DATE_KEY = a18.row_key) join "ldb"."d_problem_task_calendar_month" a19 
 on (a18.month_start_date_key = a19.row_key) 
	join "ldb"."d_problem_task_calendar_quarter" a110 
	on (a19.quarter_start_date_key = a110.row_key)  
 union
select 'ldb."d_problem_task_configuration_item" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_configuration_item" a111 
	on (a14.configuration_item_key = a111.row_key)  
 union
select 'ldb."d_problem_priority" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_priority" a112 
	on (a11.PROBLEM_PRIORITY_SRC_KEY = a112.row_key)  
 union
select 'ldb."d_problem_task_approval" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_approval" a113 
	on (a11.APPROVAL_SRC_KEY = a113.row_key)  
 union
select 'ldb."d_problem_task_reported_type" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_reported_type" a114 
	on (a11.reported_type_src_key = a114.row_key)  
 union
select 'ldb."d_problem_task_employee_mdm" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_employee" a12 
 on (a11.PROBLEM_TASK_EMPLOYEE_KEY = a12.row_key) 
	join "ldb"."d_problem_task_employee_mdm" a115 
	on (a12.employee_mdm_key = a115.row_key)  
 union
select 'ldb."d_problem_task_impact" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_impact" a116 
	on (a11.impact_src_key = a116.row_key)  
 union
select 'ldb."d_problem_task_priority" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_priority" a117 
	on (a11.priority_src_key = a117.row_key)  
 union
select 'ldb."d_problem_task_state" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_state" a118 
	on (a11.state_src_key = a118.row_key)  
 union
select 'ldb."d_problem_task_urgency" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_urgency" a119 
	on (a11.urgency_src_key = a119.row_key)  
 union
select 'ldb."d_problem_assignment_group" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_assignment_group" a120 
	on (a11.PROBLEM_ASSIGNMENT_GROUP_KEY = a120.row_key)  
 union
select 'ldb."d_problem_state" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_state" a121 
	on (a11.PROBLEM_STATE_SRC_KEY = a121.row_key)  
 union
select 'ldb."d_problem_task_application_mdm" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) join "ldb"."d_problem_task_application" a15 
 on (a14.application_key = a15.row_key) 
	join "ldb"."d_problem_task_application_mdm" a122 
	on (a15.MDM_KEY = a122.row_key)  
 union
select 'ldb."d_problem_task_business_service" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_business_service" a123 
	on (a14.business_service_key = a123.row_key)  
 union
select 'ldb."d_problem_task_calendar_year" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task_date" a18 
 on (a11.PROBLEM_TASK_DATE_KEY = a18.row_key) join "ldb"."d_problem_task_calendar_month" a19 
 on (a18.month_start_date_key = a19.row_key) join "ldb"."d_problem_task_calendar_quarter" a110 
 on (a19.quarter_start_date_key = a110.row_key) 
	join "ldb"."d_problem_task_calendar_year" a124 
	on (a110.year_start_date_key = a124.row_key)  
 union
select 'ldb."d_problem_task_configuration_item_mdm" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) join "ldb"."d_problem_task_configuration_item" a111 
 on (a14.configuration_item_key = a111.row_key) 
	join "ldb"."d_problem_task_configuration_item_mdm" a125 
	on (a111.MDM_KEY = a125.row_key)  
 union
select 'ldb."d_problem_task_location" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) 
	join "ldb"."d_problem_task_location" a126 
	on (a14.location_key = a126.row_key)  
 union
select 'ldb."d_problem_task_assignment_group_manager" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_TASK" a11 
 join "ldb"."d_problem_task" a14 
 on (a11.problem_task_key = a14.row_key) join "ldb"."d_problem_task_assignment_group" a17 
 on (a14.assignment_group_key = a17.row_key) 
	join "ldb"."d_problem_task_assignment_group_manager" a127 
	on (a17.manager_key = a127.row_key) 

