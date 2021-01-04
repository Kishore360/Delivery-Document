select 'ldb."f_change_task_state_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a16
on (a11.CHANGE_REQUEST_KEY = a16.ROW_KEY)
union
select 'ldb."d_change_task" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a12.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_change_request_state" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_request_state" a19
on (a11.parent_state_key = a19.ROW_KEY)
union
select 'ldb."d_change_task_from_state" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task_from_state" a110
on (a11.from_state_key = a110.ROW_KEY)
union
select 'ldb."d_change_task_to_state" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task_to_state" a111
on (a11.to_state_key = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."d_change_task_approval" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_approval" a113
on (a17.approval_src_key = a113.ROW_KEY)
union
select 'ldb."d_change_task_impact" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_impact" a114
on (a17.IMPACT_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_change_task_priority" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_priority" a115
on (a17.PRIORITY_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_task_state" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_state" a116
on (a17.STATE_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."d_change_task_task_type" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_task_type" a117
on (a17.task_type_src_key = a117.ROW_KEY)
union
select 'ldb."d_change_task_upon_approval" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_upon_approval" a118
on (a17.upon_approval_src_key = a118.ROW_KEY)
union
select 'ldb."d_change_task_upon_reject" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a17
on (a11.change_task_key = a17.ROW_KEY)
join "ldb"."d_change_task_upon_reject" a119
on (a17.upon_reject_src_key = a119.ROW_KEY)