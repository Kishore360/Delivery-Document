select 'ldb."f_problem_task_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_week" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_week" a110
on (a17.week_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_calendar_year" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY) join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
join "ldb"."d_calendar_year" a111
on (a19.year_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_PROBLEM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."D_PROBLEM" a112
on (a11.PROBLEM_KEY = a112.ROW_KEY)
union
select 'ldb."d_problem_task" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task" a113
on (a11.problem_task_key = a113.ROW_KEY)
union
select 'ldb."d_problem_task_application_c" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task" a113
on (a11.problem_task_key = a113.ROW_KEY)
join "ldb"."d_problem_task_application_c" a114
on (a113.APPLICATION_C_KEY = a114.ROW_KEY)
union
select 'ldb."d_problem_task_assignment_group_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task" a113
on (a11.problem_task_key = a113.ROW_KEY)
join "ldb"."d_problem_task_assignment_group_c" a115
on (a113.ASSIGNMENT_GROUP_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_problem_task_configuration_item_c" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task" a113
on (a11.problem_task_key = a113.ROW_KEY)
join "ldb"."d_problem_task_configuration_item_c" a116
on (a113.CONFIGURATION_ITEM_C_KEY = a116.ROW_KEY)
union
select 'ldb."d_application_mdm" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a117
on (a12.mdm_key = a117.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a118
on (a13.mdm_key = a118.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a119
on (a14.employee_mdm_key = a119.ROW_KEY)
union
select 'ldb."d_location" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_location" a120
on (a11.LOCATION_KEY = a120.ROW_KEY)
union
select 'ldb."d_problem_priority" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_priority" a121
on (a11.problem_priority_src_key = a121.ROW_KEY)
union
select 'ldb."d_problem_task_approval" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_approval" a122
on (a11.approval_src_key = a122.ROW_KEY)
union
select 'ldb."d_problem_task_reported_type" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_reported_type" a123
on (a11.REPORTED_TYPE_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."d_problem_task_impact" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_impact" a124
on (a11.IMPACT_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_problem_task_priority" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_priority" a125
on (a11.PRIORITY_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_problem_task_state" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_state" a126
on (a11.STATE_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_problem_task_urgency" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_task_urgency" a127
on (a11.URGENCY_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."d_assignment_group_manager" a128
on (a16.assignment_group_manager_key = a128.ROW_KEY)
union
select 'ldb."d_problem_assignment_group" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_assignment_group" a129
on (a11.problem_assignment_group_key = a129.ROW_KEY)
union
select 'ldb."d_problem_state" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_task_closed" a11
join "ldb"."d_problem_state" a130
on (a11.problem_state_src_key = a130.ROW_KEY)
