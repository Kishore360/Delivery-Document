select 'ldb."f_change_failure_implemented" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_configuration_item" a13
on (a11.ci_key = a13.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
join "ldb"."d_assignment_group_manager" a15
on (a14.assignment_group_manager_key = a15.ROW_KEY)
union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
union
select 'ldb."d_change_application_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_change_application_c" a18
on (a17.APPLICATION_C_KEY = a18.ROW_KEY)
union
select 'ldb."d_change_configuration_item_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_change_configuration_item_c" a19
on (a17.CONFIGURATION_ITEM_C_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_failure" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_change_failure" a110
on (a11.change_failure_key = a110.ROW_KEY)
union
select 'ldb."d_change_assignment_group_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_change_assignment_group_c" a111
on (a17.ASSIGNMENT_GROUP_KEY = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_configuration_item" a13
on (a11.ci_key = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."d_calendar_month" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
join "ldb"."d_calendar_month" a113
on (a16.month_start_date_key = a113.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a113
on (a16.month_start_date_key = a113.ROW_KEY)
join "ldb"."d_calendar_quarter" a114
on (a113.quarter_start_date_key = a114.ROW_KEY)
union
select 'ldb."d_calendar_year" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a113
on (a16.month_start_date_key = a113.ROW_KEY) join "ldb"."d_calendar_quarter" a114
on (a113.quarter_start_date_key = a114.ROW_KEY)
join "ldb"."d_calendar_year" a115
on (a114.year_start_date_key = a115.ROW_KEY)
union
select 'ldb."d_application_mdm" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a116
on (a12.mdm_key = a116.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_internal_contact_assigned_to" a117
on (a11.ASSIGNED_TO_KEY = a117.ROW_KEY)
union
select 'ldb."d_change_request_approval" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_change_request_approval" a118
on (a11.change_approval_state_src_key = a118.ROW_KEY)
union
select 'ldb."d_change_request_state" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_change_request_state" a119
on (a11.change_state_src_key = a119.ROW_KEY)
union
select 'ldb."d_change_request_type" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_change_request_type" a120
on (a11.change_type_src_key = a120.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."d_internal_organization_department" a121
on (a11.REQUESTED_BY_DEPARTMENT_KEY = a121.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_failure_implemented" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a122
on (a17.CHANGE_ENVIRONMENT_SRC_C_KEY = a122.ROW_KEY)