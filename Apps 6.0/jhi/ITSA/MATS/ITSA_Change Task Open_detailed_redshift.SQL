select 'ldb."f_change_task" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
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
select 'ldb."d_change_task" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
union
select 'ldb."d_application_mdm" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a110
on (a12.mdm_key = a110.ROW_KEY)
union
select 'ldb."d_business_service" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_business_service" a111
on (a11.BUSINESS_SERVICE_KEY = a111.ROW_KEY)
union
select 'ldb."d_change_request_assignment_group" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_assignment_group" a112
on (a11.parent_assignment_group_key = a112.ROW_KEY)
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
select 'ldb."d_change_request_type" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_request_type" a115
on (a11.parent_type_src_key = a115.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a116
on (a13.mdm_key = a116.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a117
on (a14.employee_mdm_key = a117.ROW_KEY)
union
select 'ldb."d_location" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_location" a118
on (a11.LOCATION_KEY = a118.ROW_KEY)
union
select 'ldb."d_calendar_month" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a119
on (a17.month_start_date_key = a119.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_close_code" a120
on (a18.CLOSE_CODE_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."d_change_request_phase" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_phase" a121
on (a18.PHASE_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."d_change_request_phase_state" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."D_CHANGE_REQUEST" a18
on (a11.CHANGE_REQUEST_KEY = a18.ROW_KEY)
join "ldb"."d_change_request_phase_state" a122
on (a18.PHASE_STATE_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_change_task_approval" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_approval" a123
on (a19.approval_src_key = a123.ROW_KEY)
union
select 'ldb."d_change_task_reported_type" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_reported_type" a124
on (a19.REPORTED_TYPE_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_change_task_impact" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_impact" a125
on (a19.IMPACT_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_task_priority" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_priority" a126
on (a19.PRIORITY_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_task_state" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_state" a127
on (a19.STATE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_task_task_type" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_task_type" a128
on (a19.task_type_src_key = a128.ROW_KEY)
union
select 'ldb."d_change_task_urgency" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task" a11
join "ldb"."d_change_task" a19
on (a11.change_task_key = a19.ROW_KEY)
join "ldb"."d_change_task_urgency" a129
on (a19.URGENCY_SRC_KEY = a129.ROW_KEY)