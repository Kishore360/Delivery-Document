select 'ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
union
select 'ldb."d_change_employee" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_employee" a12
on (a11.CHANGE_EMPLOYEE_KEY = a12.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CONFIGURATION_ITEM" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a14
on (a13.MDM_KEY = a14.ROW_KEY)
union
select 'ldb."d_application" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY)
union
select 'ldb."d_application_mdm" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY)
join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY)
join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a110
on (a19.fmr_business_unit_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a110
on (a19.fmr_business_unit_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a111
on (a110.fmr_business_group_c_key = a111.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a110
on (a19.fmr_business_unit_c_key = a110.ROW_KEY) join "ldb"."d_fmr_business_group_c" a111
on (a110.fmr_business_group_c_key = a111.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a112
on (a111.fmr_operating_committee_c_key = a112.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a110
on (a19.fmr_business_unit_c_key = a110.ROW_KEY) join "ldb"."d_fmr_business_group_c" a111
on (a110.fmr_business_group_c_key = a111.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a112
on (a111.fmr_operating_committee_c_key = a112.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a113
on (a112.fmr_cio_group_c_key = a113.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
union
select 'ldb."d_change_application" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
union
select 'ldb."d_change_internal_contact_assigned_to" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_internal_contact_assigned_to" a116
on (a114.ASSIGNED_TO_KEY = a116.ROW_KEY)
union
select 'ldb."d_change_request_assignment_group" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_request_assignment_group" a117
on (a114.ASSIGNMENT_GROUP_KEY = a117.ROW_KEY)
union
select 'ldb."d_change_business_service" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_business_service" a118
on (a114.BUSINESS_SERVICE_KEY = a118.ROW_KEY)
union
select 'ldb."D_CHANGE_DATE" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_DATE" a119
on (a11.CHANGE_DATE_KEY = a119.ROW_KEY)
union
select 'ldb."d_change_calendar_month" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_DATE" a119
on (a11.CHANGE_DATE_KEY = a119.ROW_KEY)
join "ldb"."d_change_calendar_month" a120
on (a119.MONTH_START_DATE_KEY = a120.ROW_KEY)
union
select 'ldb."d_change_calendar_quarter" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_DATE" a119
on (a11.CHANGE_DATE_KEY = a119.ROW_KEY) join "ldb"."d_change_calendar_month" a120
on (a119.MONTH_START_DATE_KEY = a120.ROW_KEY)
join "ldb"."d_change_calendar_quarter" a121
on (a120.quarter_start_date_key = a121.ROW_KEY)
union
select 'ldb."d_change_configuration_item" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_configuration_item" a122
on (a114.CONFIGURATION_ITEM_KEY = a122.ROW_KEY)
union
select 'ldb."d_change_configuration_item_mdm" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY) join "ldb"."d_change_configuration_item" a122
on (a114.CONFIGURATION_ITEM_KEY = a122.ROW_KEY)
join "ldb"."d_change_configuration_item_mdm" a123
on (a122.MDM_KEY = a123.ROW_KEY)
union
select 'ldb."d_change_request_risk" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_risk" a124
on (a11.RISK_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_change_request_state" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_state" a125
on (a11.STATE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_approval" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_approval" a126
on (a11.APPROVAL_STATE_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_request_reported_type" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_reported_type" a127
on (a11.REPORTED_TYPE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_department" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_department" a128
on (a11.CHANGE_DEPARTMENT_KEY = a128.ROW_KEY)
union
select 'ldb."d_change_employee_mdm" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_employee" a12
on (a11.CHANGE_EMPLOYEE_KEY = a12.ROW_KEY)
join "ldb"."d_change_employee_mdm" a129
on (a12.employee_mdm_key = a129.ROW_KEY)
union
select 'ldb."d_change_request_impact" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_impact" a130
on (a11.IMPACT_SRC_KEY = a130.ROW_KEY)
union
select 'ldb."d_change_request_priority" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_priority" a131
on (a11.PRIORITY_SRC_KEY = a131.ROW_KEY)
union
select 'ldb."d_change_request_reason" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_reason" a132
on (a11.REASON_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."d_change_request_review_status" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_review_status" a133
on (a11.REVIEW_STATUS_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."d_change_request_scope" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_scope" a134
on (a11.SCOPE_SRC_KEY = a134.ROW_KEY)
union
select 'ldb."d_change_request_type" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_type" a135
on (a11.TYPE_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."d_change_request_urgency" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_urgency" a136
on (a11.URGENCY_SRC_KEY = a136.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_application" a15
on (a11.APPLICATION_KEY = a15.ROW_KEY) join "ldb"."d_application_mdm" a16
on (a15.MDM_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_c" a17
on (a16.FMR_PRODUCT_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_product_line_c" a18
on (a17.fmr_product_line_c_key = a18.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a19
on (a18.COST_CENTER_C_KEY = a19.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a110
on (a19.fmr_business_unit_c_key = a110.ROW_KEY) join "ldb"."d_fmr_business_group_c" a111
on (a110.fmr_business_group_c_key = a111.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a112
on (a111.fmr_operating_committee_c_key = a112.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a113
on (a112.fmr_cio_group_c_key = a113.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a137
on (a113.CIO_USER_C_KEY = a137.ROW_KEY)
union
select 'ldb."D_CHANGE_APPLICATION_MDM" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY) join "ldb"."d_change_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
join "ldb"."D_CHANGE_APPLICATION_MDM" a138
on (a115.MDM_KEY = a138.ROW_KEY)
union
select 'ldb."d_change_calendar_week" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_DATE" a119
on (a11.CHANGE_DATE_KEY = a119.ROW_KEY)
join "ldb"."d_change_calendar_week" a139
on (a119.WEEK_START_DATE_KEY = a139.ROW_KEY)
union
select 'ldb."d_change_request_category" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."d_change_request_category" a140
on (a11.CATEGORY_SRC_KEY = a140.ROW_KEY)
union
select 'ldb."d_change_domain" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_domain" a141
on (a114.DOMAIN_KEY = a141.ROW_KEY)
union
select 'ldb."d_change_location" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY)
join "ldb"."d_change_location" a142
on (a114.LOCATION_KEY = a142.ROW_KEY)
union
select 'ldb."d_change_assignment_group_manager" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY) join "ldb"."d_change_request_assignment_group" a117
on (a114.ASSIGNMENT_GROUP_KEY = a117.ROW_KEY)
join "ldb"."d_change_assignment_group_manager" a143
on (a117.manager_key = a143.ROW_KEY)
union
select 'ldb."d_change_business_service_criticality" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY) join "ldb"."d_change_business_service" a118
on (a114.BUSINESS_SERVICE_KEY = a118.ROW_KEY)
join "ldb"."d_change_business_service_criticality" a144
on (a118.CRITICALITY_KEY = a144.ROW_KEY)
union
select 'ldb."d_change_business_service_used_for" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_REQUEST" a114
on (a11.CHANGE_REQUEST_KEY = a114.ROW_KEY) join "ldb"."d_change_business_service" a118
on (a114.BUSINESS_SERVICE_KEY = a118.ROW_KEY)
join "ldb"."d_change_business_service_used_for" a145
on (a118.USED_FOR_SRC_KEY = a145.ROW_KEY)
union
select 'ldb."d_change_calendar_year" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_PLANNED_START_DATE" a11
join "ldb"."D_CHANGE_DATE" a119
on (a11.CHANGE_DATE_KEY = a119.ROW_KEY) join "ldb"."d_change_calendar_month" a120
on (a119.MONTH_START_DATE_KEY = a120.ROW_KEY) join "ldb"."d_change_calendar_quarter" a121
on (a120.quarter_start_date_key = a121.ROW_KEY)
join "ldb"."d_change_calendar_year" a146
on (a121.year_start_date_key = a146.ROW_KEY)