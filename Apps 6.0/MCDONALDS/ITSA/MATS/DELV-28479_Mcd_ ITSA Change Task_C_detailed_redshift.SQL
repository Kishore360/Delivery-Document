select 'ldb."f_change_task" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_change_task_employee" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task_employee" a13
on (a11.change_task_employee_key = a13.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
union
select 'ldb."d_change_task" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
union
select 'ldb."d_change_task_application" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_application" a16
on (a15.APPLICATION_KEY = a16.ROW_KEY)
union
select 'ldb."d_change_task_assigned_to" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_assigned_to" a17
on (a15.ASSIGNED_TO_KEY = a17.ROW_KEY)
union
select 'ldb."D_CHANGE_TASK_ASSIGNMENT_GROUP" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a18
on (a15.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
union
select 'ldb."D_CHANGE_TASK_BUSINESS_SERVICE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."D_CHANGE_TASK_BUSINESS_SERVICE" a19
on (a15.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_task_date" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task_date" a110
on (a11.change_task_date_key = a110.ROW_KEY)
union
select 'ldb."d_change_task_configuration_item" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_configuration_item" a111
on (a15.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
union
select 'ldb."d_calendar_month" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a112
on (a12.month_start_date_key = a112.ROW_KEY)
union
select 'ldb."d_change_request_priority" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_priority" a113
on (a11.parent_priority_src_key = a113.ROW_KEY)
union
select 'ldb."d_change_request_state" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_state" a114
on (a11.parent_state_src_key = a114.ROW_KEY)
union
select 'ldb."d_change_task_employee_mdm" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task_employee" a13
on (a11.change_task_employee_key = a13.ROW_KEY)
join "ldb"."d_change_task_employee_mdm" a115
on (a13.EMPLOYEE_MDM_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_request_type" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_type" a116
on (a11.parent_type_src_key = a116.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a117
on (a11.parent_assignment_group_key = a117.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_request_close_code" a118
on (a14.CLOSE_CODE_SRC_KEY = a118.ROW_KEY)
union
select 'ldb."d_change_request_phase" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_request_phase" a119
on (a14.PHASE_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."d_change_request_phase_state" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_request_phase_state" a120
on (a14.PHASE_STATE_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."d_change_task_application_mdm" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY) join "ldb"."d_change_task_application" a16
on (a15.APPLICATION_KEY = a16.ROW_KEY)
join "ldb"."d_change_task_application_mdm" a121
on (a16.MDM_KEY = a121.ROW_KEY)
union
select 'ldb."d_change_task_approval" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_approval" a122
on (a15.APPROVAL_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_change_task_configuration_item_mdm" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY) join "ldb"."d_change_task_configuration_item" a111
on (a15.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."d_change_task_configuration_item_mdm" a123
on (a111.MDM_KEY = a123.ROW_KEY)
union
select 'ldb."d_change_task_reported_type" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_reported_type" a124
on (a15.REPORTED_TYPE_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_change_task_impact" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_impact" a125
on (a15.IMPACT_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_task_location" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_location" a126
on (a15.LOCATION_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_task_priority" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_priority" a127
on (a15.PRIORITY_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_task_state" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_state" a128
on (a15.STATE_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."d_change_task_task_type" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_task_type" a129
on (a15.task_type_src_key = a129.ROW_KEY)
union
select 'ldb."d_change_task_urgency" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY)
join "ldb"."d_change_task_urgency" a130
on (a15.URGENCY_SRC_KEY = a130.ROW_KEY)
union
select 'ldb."d_change_task_assignment_group_manager" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY) join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a18
on (a15.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
join "ldb"."d_change_task_assignment_group_manager" a131
on (a18.MANAGER_KEY = a131.ROW_KEY)
union
select 'ldb."D_CHANGE_TASK_OWNED_BY_C" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY) join "ldb"."D_CHANGE_TASK_BUSINESS_SERVICE" a19
on (a15.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
join "ldb"."D_CHANGE_TASK_OWNED_BY_C" a132
on (a19.CHANGE_TASK_BUSINESS_SERVICE_OWNNED_BY_C_KEY = a132.ROW_KEY)
union
select 'ldb."D_INTERNAL_ORGANIZATION_CHANGE_TASK_VENDOR_C" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a15
on (a11.change_task_key = a15.ROW_KEY) join "ldb"."D_CHANGE_TASK_ASSIGNMENT_GROUP" a18
on (a15.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
join "ldb"."D_INTERNAL_ORGANIZATION_CHANGE_TASK_VENDOR_C" a133
on (a18.CHANGE_TASK_VENDOR_C_KEY = a133.ROW_KEY)