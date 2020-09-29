select 'ldb."f_change_request_state_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
union
select 'ldb."d_change_activity_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_activity_calendar_date" a12
on (a11.change_activity_date_key = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
union
select 'ldb."d_change_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_change_internal_contact_assigned_to" a14
on (a13.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_change_request_assignment_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_change_request_assignment_group" a15
on (a13.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_change_configuration_item" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_change_configuration_item" a16
on (a13.CONFIGURATION_ITEM_KEY = a16.ROW_KEY)
union
select 'ldb."d_change_activity_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_activity_calendar_date" a12
on (a11.change_activity_date_key = a12.ROW_KEY)
join "ldb"."d_change_activity_calendar_month" a17
on (a12.month_start_date_key = a17.ROW_KEY)
union
select 'ldb."d_change_request_from_state" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_from_state" a18
on (a11.from_state_key = a18.ROW_KEY)
union
select 'ldb."d_change_request_priority" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_priority" a19
on (a11.PRIORITY_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_request_state" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_state" a110
on (a11.current_state_key = a110.ROW_KEY)
union
select 'ldb."d_change_request_to_state" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_to_state" a111
on (a11.to_state_key = a111.ROW_KEY)
union
select 'ldb."d_change_request_type" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_type" a112
on (a11.change_type_key = a112.ROW_KEY)
union
select 'ldb."d_change_configuration_item_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_configuration_item" a16
on (a13.CONFIGURATION_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_change_configuration_item_mdm" a113
on (a16.mdm_key = a113.ROW_KEY)
union
select 'ldb."d_change_request_risk" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."d_change_request_risk" a114
on (a11.change_risk_key = a114.ROW_KEY)
union
select 'ldb."d_change_assignment_group_manager" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_state_activity" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_request_assignment_group" a15
on (a13.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
join "ldb"."d_change_assignment_group_manager" a115
on (a15.manager_key = a115.ROW_KEY)