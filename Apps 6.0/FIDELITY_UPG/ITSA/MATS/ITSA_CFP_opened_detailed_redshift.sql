select 'ldb."f_change_failure_opened" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
union
select 'ldb."d_change_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_date" a12
on (a11.CHANGE_DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_change_failure" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_failure" a13
on (a11.change_failure_key = a13.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
union
select 'ldb."d_change_configuration_item" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_configuration_item" a15
on (a14.CONFIGURATION_ITEM_KEY = a15.ROW_KEY)
union
select 'ldb."d_change_configuration_item_mdm" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY) join "ldb"."d_change_configuration_item" a15
on (a14.CONFIGURATION_ITEM_KEY = a15.ROW_KEY)
join "ldb"."d_change_configuration_item_mdm" a16
on (a15.mdm_key = a16.ROW_KEY)
union
select 'ldb."d_change_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_date" a12
on (a11.CHANGE_DATE_KEY = a12.ROW_KEY)
join "ldb"."d_change_calendar_month" a17
on (a12.month_start_date_key = a17.ROW_KEY)
union
select 'ldb."d_change_request_state" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_request_state" a18
on (a11.change_state_src_key = a18.ROW_KEY)
union
select 'ldb."d_change_internal_contact_assigned_to" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_internal_contact_assigned_to" a19
on (a14.ASSIGNED_TO_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_request_assignment_group" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_request_assignment_group" a110
on (a14.ASSIGNMENT_GROUP_KEY = a110.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a14
on (a11.CHANGE_REQUEST_KEY = a14.ROW_KEY)
join "ldb"."d_change_request_close_code" a111
on (a14.CLOSE_CODE_SRC_KEY = a111.ROW_KEY)