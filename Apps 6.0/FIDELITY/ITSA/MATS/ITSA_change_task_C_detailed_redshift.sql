select 'ldb."f_change_task" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_internal_contact" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact" a13
on (a11.EMPLOYEE_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_change_task" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
union
select 'ldb."d_change_task_application_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_application_c" a19
on (a16.APPLICATION_C_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_task_assignment_group_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_assignment_group_c" a110
on (a16.ASSIGNMENT_GROUP_C_KEY = a110.ROW_KEY)
union
select 'ldb."d_change_task_configuration_item_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_configuration_item_c" a111
on (a16.CONFIGURATION_ITEM_C_KEY = a111.ROW_KEY)
union
select 'ldb."d_calendar_month" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a112
on (a17.month_start_date_key = a112.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a112
on (a17.month_start_date_key = a112.ROW_KEY)
join "ldb"."d_calendar_quarter" a113
on (a112.quarter_start_date_key = a113.ROW_KEY)
union
select 'ldb."d_calendar_week" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_week" a114
on (a17.week_start_date_key = a114.ROW_KEY)
union
select 'ldb."d_calendar_year" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a112
on (a17.month_start_date_key = a112.ROW_KEY) join "ldb"."d_calendar_quarter" a113
on (a112.quarter_start_date_key = a113.ROW_KEY)
join "ldb"."d_calendar_year" a115
on (a113.year_start_date_key = a115.ROW_KEY)
union
select 'ldb."d_change_request_priority" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_priority" a116
on (a11.parent_priority_src_key = a116.ROW_KEY)
union
select 'ldb."d_change_request_state" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_state" a117
on (a11.parent_state_src_key = a117.ROW_KEY)
union
select 'ldb."d_change_request_type" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_type" a118
on (a11.parent_type_src_key = a118.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a119
on (a12.mdm_key = a119.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact" a13
on (a11.EMPLOYEE_KEY = a13.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a120
on (a13.employee_mdm_key = a120.ROW_KEY)
union
select 'ldb."d_location" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_location" a121
on (a11.LOCATION_KEY = a121.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
join "ldb"."d_assignment_group_manager" a122
on (a15.assignment_group_manager_key = a122.ROW_KEY)
union
select 'ldb."d_lov_change_task_backout_during_implementation_c" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_lov_change_task_backout_during_implementation_c" a123
on (a16.backout_during_implementation_src_c_key = a123.ROW_KEY)
union
select 'ldb."d_change_request_assignment_group" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_assignment_group" a124
on (a11.parent_assignment_group_key = a124.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_close_code" a125
on (a18.CLOSE_CODE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_phase" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_phase" a126
on (a18.PHASE_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_request_phase_state" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_phase_state" a127
on (a18.PHASE_STATE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_task_approval" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_approval" a128
on (a16.approval_src_key = a128.ROW_KEY)
union
select 'ldb."d_u_backout_method_change_task_c" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_u_backout_method_change_task_c" a129
on (a16.u_backout_method_c_key = a129.ROW_KEY)
union
select 'ldb."d_u_backout_strategy_change_task_c" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_u_backout_strategy_change_task_c" a130
on (a16.u_backout_strategy_c_key = a130.ROW_KEY)
union
select 'ldb."d_change_task_reported_type" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_reported_type" a131
on (a16.REPORTED_TYPE_SRC_KEY = a131.ROW_KEY)
union
select 'ldb."d_change_task_impact" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_impact" a132
on (a16.IMPACT_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."d_change_task_priority" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_priority" a133
on (a16.PRIORITY_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."d_u_service_type_change_task_c" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_u_service_type_change_task_c" a134
on (a16.u_service_type_c_key = a134.ROW_KEY)
union
select 'ldb."d_change_task_state" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_state" a135
on (a16.STATE_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."d_u_testing_method_change_task_c" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_u_testing_method_change_task_c" a136
on (a16.u_testing_method_c_key = a136.ROW_KEY)
union
select 'ldb."d_change_task_urgency" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_change_task_urgency" a137
on (a16.URGENCY_SRC_KEY = a137.ROW_KEY)
union
select 'ldb."d_validation_method_change_task_c" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_validation_method_change_task_c" a138
on (a16.validation_method_c_key = a138.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a139
on (a18.CHANGE_ENVIRONMENT_SRC_C_KEY = a139.ROW_KEY)
union
select 'ldb."d_lov_change_task_implementation_method_c" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_lov_change_task_implementation_method_c" a140
on (a16.implementation_method_src_c_key = a140.ROW_KEY)
union
select 'ldb."d_lov_change_task_source_c" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_lov_change_task_source_c" a141
on (a16.task_source_src_c_key = a141.ROW_KEY)
union
select 'ldb."d_lov_change_task_type_c" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a16
on (a11.change_task_key = a16.ROW_KEY)
join "ldb"."d_lov_change_task_type_c" a142
on (a16.type_src_c_key = a142.ROW_KEY)