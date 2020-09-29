select 'ldb."f_change_failure_opened" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_configuration_item" a13
on (a11.ci_key = a13.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
join "ldb"."d_assignment_group_manager" a15
on (a14.assignment_group_manager_key = a15.ROW_KEY)
union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
union
select 'ldb."d_change_failure" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_failure" a18
on (a11.change_failure_key = a18.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_configuration_item" a13
on (a11.ci_key = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a19
on (a13.mdm_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
join "ldb"."d_calendar_month" a110
on (a16.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a110
on (a16.month_start_date_key = a110.ROW_KEY)
join "ldb"."d_calendar_quarter" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."d_calendar_year" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a110
on (a16.month_start_date_key = a110.ROW_KEY) join "ldb"."d_calendar_quarter" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."d_calendar_year" a112
on (a111.year_start_date_key = a112.ROW_KEY)
union
select 'ldb."d_application_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a113
on (a12.mdm_key = a113.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_internal_contact_assigned_to" a114
on (a11.ASSIGNED_TO_KEY = a114.ROW_KEY)
union
select 'ldb."d_change_request_approval" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_request_approval" a115
on (a11.change_approval_state_src_key = a115.ROW_KEY)
union
select 'ldb."d_change_request_state" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_request_state" a116
on (a11.change_state_src_key = a116.ROW_KEY)
union
select 'ldb."d_change_request_type" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_change_request_type" a117
on (a11.change_type_src_key = a117.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_internal_organization_department" a118
on (a11.REQUESTED_BY_DEPARTMENT_KEY = a118.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_change_request_close_code" a119
on (a17.CLOSE_CODE_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."d_internal_contact_change_closed_by" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_internal_contact_change_closed_by" a120
on (a17.CLOSED_BY_KEY = a120.ROW_KEY)
union
select 'ldb."d_ci_location" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_opened" a11
join "ldb"."d_configuration_item" a13
on (a11.ci_key = a13.ROW_KEY)
join "ldb"."d_ci_location" a121
on (a13.LOCATION_KEY = a121.ROW_KEY)