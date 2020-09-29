select 'ldb."f_problem_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.employee_key = a14.ROW_KEY)
union
select 'ldb."d_calendar_time" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_time" a15
on (a11.time_key = a15.ROW_KEY)
union
select 'ldb."D_PROBLEM" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_contact_assigned_to" a17
on (a11.ASSIGNED_TO_KEY = a17.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_organization_group" a18
on (a11.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
union
select 'ldb."d_calendar_date" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_date" a19
on (a11.date_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_date" a19
on (a11.date_key = a19.ROW_KEY)
join "ldb"."d_calendar_month" a110
on (a19.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_date" a19
on (a11.date_key = a19.ROW_KEY) join "ldb"."d_calendar_month" a110
on (a19.month_start_date_key = a110.ROW_KEY)
join "ldb"."d_calendar_quarter" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."d_calendar_week" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_date" a19
on (a11.date_key = a19.ROW_KEY)
join "ldb"."d_calendar_week" a113
on (a19.week_start_date_key = a113.ROW_KEY)
union
select 'ldb."d_calendar_year" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_date" a19
on (a11.date_key = a19.ROW_KEY) join "ldb"."d_calendar_month" a110
on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."d_calendar_quarter" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."d_calendar_year" a114
on (a111.year_start_date_key = a114.ROW_KEY)
union
select 'ldb."d_problem_application_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_application_c" a115
on (a16.APPLICATION_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_problem_assignment_group_c" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_assignment_group_c" a116
on (a16.ASSIGNMENT_GROUP_C_KEY = a116.ROW_KEY)
union
select 'ldb."d_problem_configuration_item_c" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_configuration_item_c" a117
on (a16.CONFIGURATION_ITEM_C_KEY = a117.ROW_KEY)
union
select 'ldb."d_application_mdm" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a118
on (a12.mdm_key = a118.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_CHANGE_REQUEST" a119
on (a11.CHANGE_REQUEST_KEY = a119.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.employee_key = a14.ROW_KEY)
join "ldb"."d_internal_organization_department" a120
on (a14.department_key = a120.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_contact" a14
on (a11.employee_key = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a121
on (a14.employee_mdm_key = a121.ROW_KEY)
union
select 'ldb."d_calendar_time_hour" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_calendar_time" a15
on (a11.time_key = a15.ROW_KEY)
join "ldb"."d_calendar_time_hour" a122
on (a15.hour_key = a122.ROW_KEY)
union
select 'ldb."d_location" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_location" a123
on (a11.LOCATION_KEY = a123.ROW_KEY)
union
select 'ldb."d_problem_reported_type" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_problem_reported_type" a124
on (a11.reported_type_src_key = a124.ROW_KEY)
union
select 'ldb."d_problem_impact" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_problem_impact" a125
on (a11.impact_src_key = a125.ROW_KEY)
union
select 'ldb."d_problem_priority" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_problem_priority" a126
on (a11.PRIORITY_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_problem_urgency" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_problem_urgency" a127
on (a11.urgency_src_key = a127.ROW_KEY)
union
select 'ldb."d_lov_problem_activity_flag_c" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_activity_flag_c" a128
on (a16.PROBLEM_ACTIVITY_FLAG_C_KEY = a128.ROW_KEY)
union
select 'ldb."d_location_assigned_to" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_contact_assigned_to" a17
on (a11.ASSIGNED_TO_KEY = a17.ROW_KEY)
join "ldb"."d_location_assigned_to" a129
on (a17.LOCATION_KEY = a129.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."d_internal_organization_group" a18
on (a11.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
join "ldb"."d_assignment_group_manager" a130
on (a18.assignment_group_manager_key = a130.ROW_KEY)
union
select 'ldb."d_lov_problem_meeting_status_c" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_meeting_status_c" a131
on (a16.PROBLEM_MEETING_STATUS_C_KEY = a131.ROW_KEY)
union
select 'ldb."d_lov_problem_oversight_action_c" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_oversight_action_c" a132
on (a16.PROBLEM_OVERSIGHT_ACTION_C_KEY = a132.ROW_KEY)
union
select 'ldb."d_lov_problem_phase_c" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_phase_c" a133
on (a16.PROBLEM_PHASE_C_KEY = a133.ROW_KEY)
union
select 'ldb."d_problem_oversight_contact_c" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_oversight_contact_c" a134
on (a16.PROBLEM_OVERSIGHT_CONTACT_C_KEY = a134.ROW_KEY)
union
select 'ldb."d_problem_oversight_group_c" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_oversight_group_c" a135
on (a16.PROBLEM_OVERSIGHT_GROUP_C_KEY = a135.ROW_KEY)
union
select 'ldb."d_problem_state" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_problem_state" a136
on (a16.STATE_SRC_KEY = a136.ROW_KEY)
union
select 'ldb."d_lov_problem_root_cause_c" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_root_cause_c" a137
on (a16.PROBLEM_ROOT_CAUSE_CODE_C_KEY = a137.ROW_KEY)
union
select 'ldb."d_lov_problem_secondary_root_cause_c" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_problem_closed" a11
join "ldb"."D_PROBLEM" a16
on (a11.PROBLEM_KEY = a16.ROW_KEY)
join "ldb"."d_lov_problem_secondary_root_cause_c" a138
on (a16.PROBLEM_SECONDARY_ROOT_CAUSE_C_KEY = a138.ROW_KEY)