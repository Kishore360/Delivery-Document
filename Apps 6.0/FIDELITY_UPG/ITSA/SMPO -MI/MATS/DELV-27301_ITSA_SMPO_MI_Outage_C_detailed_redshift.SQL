select 'ldb."f_incident_outage" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
union
select 'ldb."D_CONFIGURATION_ITEM" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_application" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY)
join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a112
on (a12.MDM_KEY = a112.ROW_KEY)
union
select 'ldb."D_INCIDENT" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a113
on (a11.INCIDENT_KEY = a113.ROW_KEY)
union
select 'ldb."D_OUTAGE" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
union
select 'ldb."d_outage_application" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
join "ldb"."d_outage_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
union
select 'ldb."d_outage_application_mdm" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY) join "ldb"."d_outage_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
join "ldb"."d_outage_application_mdm" a116
on (a115.MDM_KEY = a116.ROW_KEY)
union
select 'ldb."d_outage_business_service" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
join "ldb"."d_outage_business_service" a117
on (a114.BUSINESS_SERVICE_KEY = a117.ROW_KEY)
union
select 'ldb."d_outage_calendar_date" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage_calendar_date" a118
on (a11.incident_outage_date_key = a118.ROW_KEY)
union
select 'ldb."d_outage_calendar_month" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage_calendar_date" a118
on (a11.incident_outage_date_key = a118.ROW_KEY)
join "ldb"."d_outage_calendar_month" a119
on (a118.MONTH_START_DATE_KEY = a119.ROW_KEY)
union
select 'ldb."d_outage_calendar_quarter" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage_calendar_date" a118
on (a11.incident_outage_date_key = a118.ROW_KEY) join "ldb"."d_outage_calendar_month" a119
on (a118.MONTH_START_DATE_KEY = a119.ROW_KEY)
join "ldb"."d_outage_calendar_quarter" a120
on (a119.quarter_start_date_key = a120.ROW_KEY)
union
select 'ldb."d_outage_type" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY)
join "ldb"."d_outage_type" a121
on (a114.OUTAGE_TYPE_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_organization_group" a122
on (a11.ASSIGNMENT_GROUP_KEY = a122.ROW_KEY)
union
select 'ldb."d_internal_contact_assignment_group_manager_snapshot" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_assignment_group_manager_snapshot" a123
on (a11.ASSIGNMENT_GROUP_MANAGER_KEY = a123.ROW_KEY)
union
select 'ldb."d_internal_contact_executive_leader_snapshot" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_executive_leader_snapshot" a124
on (a11.EXECUTIVE_LEADER_KEY = a124.ROW_KEY)
union
select 'ldb."d_internal_contact_assignment_group_leader_snapshot" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_assignment_group_leader_snapshot" a125
on (a11.LEADER_KEY = a125.ROW_KEY)
union
select 'ldb."d_internal_contact_senior_leader_snapshot" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_senior_leader_snapshot" a126
on (a11.SENIOR_LEADER_KEY = a126.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a15
on (a14.FMR_PRODUCT_C_KEY = a15.ROW_KEY) join "ldb"."d_fmr_product_line_c" a16
on (a15.fmr_product_line_c_key = a16.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a17
on (a16.COST_CENTER_C_KEY = a17.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a18
on (a17.fmr_business_unit_c_key = a18.ROW_KEY) join "ldb"."d_fmr_business_group_c" a19
on (a18.fmr_business_group_c_key = a19.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a110
on (a19.fmr_operating_committee_c_key = a110.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a111
on (a110.fmr_cio_group_c_key = a111.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a127
on (a111.CIO_USER_C_KEY = a127.ROW_KEY)
union
select 'ldb."d_ci_criticality" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_criticality" a128
on (a12.CRITICALITY_KEY = a128.ROW_KEY)
union
select 'ldb."d_ci_department" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_department" a129
on (a12.DEPARTMENT_KEY = a129.ROW_KEY)
union
select 'ldb."d_ci_location" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_location" a130
on (a12.LOCATION_KEY = a130.ROW_KEY)
union
select 'ldb."d_ci_managed_by" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_managed_by" a131
on (a12.MANAGED_BY_KEY = a131.ROW_KEY)
union
select 'ldb."d_ci_manufacturer" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_manufacturer" a132
on (a12.MANUFACTURER_KEY = a132.ROW_KEY)
union
select 'ldb."d_outage_application_tier" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY) join "ldb"."d_outage_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
join "ldb"."d_outage_application_tier" a133
on (a115.TIER_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."d_outage_application_used_for" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY) join "ldb"."d_outage_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
join "ldb"."d_outage_application_used_for" a134
on (a115.USED_FOR_SRC_KEY = a134.ROW_KEY)
union
select 'ldb."d_outage_calendar_week" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage_calendar_date" a118
on (a11.incident_outage_date_key = a118.ROW_KEY)
join "ldb"."d_outage_calendar_week" a135
on (a118.WEEK_START_DATE_KEY = a135.ROW_KEY)
union
select 'ldb."d_outage_business_service_criticality" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY) join "ldb"."d_outage_business_service" a117
on (a114.BUSINESS_SERVICE_KEY = a117.ROW_KEY)
join "ldb"."d_outage_business_service_criticality" a136
on (a117.CRITICALITY_KEY = a136.ROW_KEY)
union
select 'ldb."d_outage_business_service_used_for" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a114
on (a11.OUTAGE_KEY = a114.ROW_KEY) join "ldb"."d_outage_business_service" a117
on (a114.BUSINESS_SERVICE_KEY = a117.ROW_KEY)
join "ldb"."d_outage_business_service_used_for" a137
on (a117.USED_FOR_SRC_KEY = a137.ROW_KEY)
union
select 'ldb."d_outage_calendar_year" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage_calendar_date" a118
on (a11.incident_outage_date_key = a118.ROW_KEY) join "ldb"."d_outage_calendar_month" a119
on (a118.MONTH_START_DATE_KEY = a119.ROW_KEY) join "ldb"."d_outage_calendar_quarter" a120
on (a119.quarter_start_date_key = a120.ROW_KEY)
join "ldb"."d_outage_calendar_year" a138
on (a120.year_start_date_key = a138.ROW_KEY)