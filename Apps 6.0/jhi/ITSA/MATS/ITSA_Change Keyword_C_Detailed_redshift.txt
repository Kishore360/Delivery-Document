select 'ldb."f_change_request_keyword" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_internal_contact" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_internal_contact" a13
on (a11.EMPLOYEE_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
join "ldb"."d_calendar_month" a17
on (a16.month_start_date_key = a17.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a17
on (a16.month_start_date_key = a17.ROW_KEY)
join "ldb"."d_calendar_quarter" a18
on (a17.quarter_start_date_key = a18.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."D_CHANGE_REQUEST" a19
on (a11.CHANGE_REQUEST_KEY = a19.ROW_KEY)
union
select 'ldb."d_change_request_category" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_category" a110
on (a11.change_category_src_key = a110.ROW_KEY)
union
select 'ldb."d_change_request_reported_type" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_reported_type" a111
on (a11.change_reported_type_src_key = a111.ROW_KEY)
union
select 'ldb."d_change_request_impact" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_impact" a112
on (a11.change_impact_src_key = a112.ROW_KEY)
union
select 'ldb."d_change_request_priority" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_priority" a113
on (a11.change_priority_src_key = a113.ROW_KEY)
union
select 'ldb."d_change_request_reason" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_reason" a114
on (a11.change_reason_src_key = a114.ROW_KEY)
union
select 'ldb."d_change_request_review_status" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_review_status" a115
on (a11.change_review_status_src_key = a115.ROW_KEY)
union
select 'ldb."d_change_request_risk" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_risk" a116
on (a11.change_risk_src_key = a116.ROW_KEY)
union
select 'ldb."d_change_request_scope" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_scope" a117
on (a11.change_scope_src_key = a117.ROW_KEY)
union
select 'ldb."d_change_request_state" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_state" a118
on (a11.change_state_src_key = a118.ROW_KEY)
union
select 'ldb."d_change_request_type" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_type" a119
on (a11.change_type_src_key = a119.ROW_KEY)
union
select 'ldb."d_change_request_urgency" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_change_request_urgency" a120
on (a11.change_urgency_src_key = a120.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a121
on (a12.mdm_key = a121.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_internal_organization_department" a122
on (a11.REQUESTED_BY_DEPARTMENT_KEY = a122.ROW_KEY)
union
select 'ldb."d_domain" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_domain" a123
on (a11.DOMAIN_KEY = a123.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_internal_contact" a13
on (a11.EMPLOYEE_KEY = a13.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a124
on (a13.employee_mdm_key = a124.ROW_KEY)
union
select 'ldb."d_location" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_location" a125
on (a11.LOCATION_KEY = a125.ROW_KEY)
union
select 'ldb."d_calendar_week" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY)
join "ldb"."d_calendar_week" a126
on (a16.week_start_date_key = a126.ROW_KEY)
union
select 'ldb."d_calendar_year" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_request_keyword" a11
join "ldb"."d_calendar_date" a16
on (a11.DATE_KEY = a16.ROW_KEY) join "ldb"."d_calendar_month" a17
on (a16.month_start_date_key = a17.ROW_KEY) join "ldb"."d_calendar_quarter" a18
on (a17.quarter_start_date_key = a18.ROW_KEY)
join "ldb"."d_calendar_year" a127
on (a18.year_start_date_key = a127.ROW_KEY)