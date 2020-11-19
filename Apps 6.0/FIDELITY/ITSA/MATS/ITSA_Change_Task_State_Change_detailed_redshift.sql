select 'ldb."f_change_task_state_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
union
select 'ldb."d_change_task_activity_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task_activity_calendar_date" a12
on (a11.change_task_activity_date_key = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
union
select 'ldb."d_change_task" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
union
select 'ldb."d_change_task_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_assigned_to" a15
on (a14.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_change_task_assignment_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_assignment_group" a16
on (a14.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_change_task_configuration_item" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_configuration_item" a17
on (a14.CONFIGURATION_ITEM_KEY = a17.ROW_KEY)
union
select 'ldb."d_change_request_state" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_request_state" a18
on (a11.parent_state_key = a18.ROW_KEY)
union
select 'ldb."d_change_task_activity_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task_activity_calendar_date" a12
on (a11.change_task_activity_date_key = a12.ROW_KEY)
join "ldb"."d_change_task_activity_calendar_month" a19
on (a12.month_start_date_key = a19.ROW_KEY)
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
select 'ldb."d_change_task_approval" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_approval" a112
on (a14.approval_src_key = a112.ROW_KEY)
union
select 'ldb."d_change_task_configuration_item_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY) join "ldb"."d_change_task_configuration_item" a17
on (a14.CONFIGURATION_ITEM_KEY = a17.ROW_KEY)
join "ldb"."d_change_task_configuration_item_mdm" a113
on (a17.mdm_key = a113.ROW_KEY)
union
select 'ldb."d_change_task_impact" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_impact" a114
on (a14.IMPACT_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_change_task_priority" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_priority" a115
on (a14.PRIORITY_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_task_state" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_state" a116
on (a14.STATE_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."d_change_task_task_type" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_task_type" a117
on (a14.task_type_src_key = a117.ROW_KEY)
union
select 'ldb."d_change_task_upon_approval" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_upon_approval" a118
on (a14.upon_approval_src_key = a118.ROW_KEY)
union
select 'ldb."d_change_task_upon_reject" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY)
join "ldb"."d_change_task_upon_reject" a119
on (a14.upon_reject_src_key = a119.ROW_KEY)
union
select 'ldb."d_change_task_assignment_group_manager" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_task_state_activity" a11
join "ldb"."d_change_task" a14
on (a11.change_task_key = a14.ROW_KEY) join "ldb"."d_change_task_assignment_group" a16
on (a14.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."d_change_task_assignment_group_manager" a120
on (a16.manager_key = a120.ROW_KEY)