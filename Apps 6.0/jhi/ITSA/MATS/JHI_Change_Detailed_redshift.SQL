select 'ldb."F_CHANGE_REQUEST" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_business_service" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_date" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
union
select 'ldb."d_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY) join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY)
join "ldb"."d_calendar_quarter" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a111
on (a11.CHANGE_REQUEST_KEY = a111.ROW_KEY)
union
select 'ldb."d_change_request_risk" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_risk" a112
on (a11.RISK_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a113
on (a13.mdm_key = a113.ROW_KEY)
union
select 'ldb."d_application_mdm" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a114
on (a12.mdm_key = a114.ROW_KEY)
union
select 'ldb."d_change_request_approval" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_approval" a115
on (a11.APPROVAL_STATE_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_request_category" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_category" a116
on (a11.CATEGORY_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."d_change_request_reported_type" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_reported_type" a117
on (a11.REPORTED_TYPE_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."d_change_request_impact" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_impact" a118
on (a11.IMPACT_SRC_KEY = a118.ROW_KEY)
union
select 'ldb."d_change_request_priority" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_priority" a119
on (a11.PRIORITY_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."d_change_request_reason" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_reason" a120
on (a11.REASON_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_COPIED_FROM_C" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_COPIED_FROM_C" a121
on (a11.CHANGE_REQUEST_COPIED_FROM_C_KEY = a121.ROW_KEY)
union
select 'ldb."d_change_request_review_status" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_review_status" a122
on (a11.REVIEW_STATUS_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_change_request_scope" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_scope" a123
on (a11.SCOPE_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."d_change_request_state" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_state" a124
on (a11.STATE_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_change_request_type" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_type" a125
on (a11.TYPE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_urgency" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_change_request_urgency" a126
on (a11.URGENCY_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_organization_department" a127
on (a11.REQUESTED_BY_DEPARTMENT_KEY = a127.ROW_KEY)
union
select 'ldb."d_domain" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_domain" a128
on (a11.DOMAIN_KEY = a128.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_internal_contact" a14
on (a11.EMPLOYEE_KEY = a14.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a129
on (a14.employee_mdm_key = a129.ROW_KEY)
union
select 'ldb."d_location" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_location" a130
on (a11.LOCATION_KEY = a130.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REVIEWER_C" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REVIEWER_C" a131
on (a11.CHANGE_REQUEST_REVIEWER_C_KEY = a131.ROW_KEY)
union
select 'ldb."d_business_service_criticality" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."d_business_service_criticality" a132
on (a17.criticality_key = a132.ROW_KEY)
union
select 'ldb."d_business_service_used_for" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."d_business_service_used_for" a133
on (a17.used_for_src_key = a133.ROW_KEY)
union
select 'ldb."d_calendar_week" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
join "ldb"."d_calendar_week" a134
on (a18.week_start_date_key = a134.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_EMERGENCY_REASON_C" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a111
on (a11.CHANGE_REQUEST_KEY = a111.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_EMERGENCY_REASON_C" a135
on (a111.CHANGE_REQUEST_EMERGENCY_REASON_C_KEY = a135.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_SCHEDULING_REQUESTED_C" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a111
on (a11.CHANGE_REQUEST_KEY = a111.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_SCHEDULING_REQUESTED_C" a136
on (a111.CHANGE_REQUEST_SCHEDULING_REQUESTED_C_KEY = a136.ROW_KEY)
union
select 'ldb."d_calendar_year" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY) join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY) join "ldb"."d_calendar_quarter" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
join "ldb"."d_calendar_year" a137
on (a110.year_start_date_key = a137.ROW_KEY)


