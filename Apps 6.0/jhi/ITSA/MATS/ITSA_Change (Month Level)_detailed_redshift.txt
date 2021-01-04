select 'ldb."F_CHANGE_REQUEST" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a15
on (a12.month_start_date_key = a15.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY) join "ldb"."d_calendar_month" a15
on (a12.month_start_date_key = a15.ROW_KEY)
join "ldb"."d_calendar_quarter" a16
on (a15.quarter_start_date_key = a16.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a17
on (a11.CHANGE_REQUEST_KEY = a17.ROW_KEY)
union
select 'ldb."d_change_request_priority" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_priority" a18
on (a11.PRIORITY_SRC_KEY = a18.ROW_KEY)
union
select 'ldb."d_change_request_risk" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_risk" a19
on (a11.RISK_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a110
on (a13.mdm_key = a110.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_contact_assigned_to" a111
on (a11.ASSIGNED_TO_KEY = a111.ROW_KEY)
union
select 'ldb."d_calendar_week" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_week" a112
on (a12.week_start_date_key = a112.ROW_KEY)
union
select 'ldb."d_change_request_category" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_category" a113
on (a11.CATEGORY_SRC_KEY = a113.ROW_KEY)
union
select 'ldb."d_change_request_scope" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_scope" a114
on (a11.SCOPE_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_change_request_state" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_state" a115
on (a11.STATE_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_request_type" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_type" a116
on (a11.TYPE_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_organization_department" a117
on (a11.REQUESTED_BY_DEPARTMENT_KEY = a117.ROW_KEY)
union
select 'ldb."d_calendar_year" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY) join "ldb"."d_calendar_month" a15
on (a12.month_start_date_key = a15.ROW_KEY) join "ldb"."d_calendar_quarter" a16
on (a15.quarter_start_date_key = a16.ROW_KEY)
join "ldb"."d_calendar_year" a118
on (a16.year_start_date_key = a118.ROW_KEY)