select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
union
select 'ldb."D_CONFIGURATION_ITEM" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_application" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY)
union
select 'ldb."d_incident_employee" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_employee" a15
on (a11.INCIDENT_EMPLOYEE_KEY = a15.ROW_KEY)
union
select 'ldb."d_fmr_product_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY)
join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY)
union
select 'ldb."d_fmr_product_line_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY)
join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
union
select 'ldb."d_fmr_cost_center_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY)
join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY)
union
select 'ldb."d_fmr_business_unit_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY)
join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
union
select 'ldb."d_fmr_business_group_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY)
join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
union
select 'ldb."d_fmr_operating_committee_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY)
join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
union
select 'ldb."d_fmr_cio_group_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY)
join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_MDM" a113
on (a12.MDM_KEY = a113.ROW_KEY)
union
select 'ldb."D_INCIDENT" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_application" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
union
select 'ldb."d_incident_date" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_date" a116
on (a11.INCIDENT_DATE_KEY = a116.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_organization_group" a117
on (a11.ASSIGNMENT_GROUP_KEY = a117.ROW_KEY)
union
select 'ldb."d_internal_contact_assignment_group_manager_snapshot" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact_assignment_group_manager_snapshot" a118
on (a11.ASSIGNMENT_GROUP_MANAGER_KEY = a118.ROW_KEY)
union
select 'ldb."d_internal_contact_executive_leader_snapshot" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact_executive_leader_snapshot" a119
on (a11.EXECUTIVE_LEADER_KEY = a119.ROW_KEY)
union
select 'ldb."d_incident_employee_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_employee" a15
on (a11.INCIDENT_EMPLOYEE_KEY = a15.ROW_KEY)
join "ldb"."d_incident_employee_mdm" a120
on (a15.employee_mdm_key = a120.ROW_KEY)
union
select 'ldb."d_incident_urgency" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_urgency" a121
on (a11.URGENCY_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."d_internal_contact_assignment_group_leader_snapshot" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact_assignment_group_leader_snapshot" a122
on (a11.LEADER_KEY = a122.ROW_KEY)
union
select 'ldb."d_internal_contact_senior_leader_snapshot" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact_senior_leader_snapshot" a123
on (a11.SENIOR_LEADER_KEY = a123.ROW_KEY)
union
select 'ldb."d_ci_location" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CONFIGURATION_ITEM" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
join "ldb"."d_ci_location" a124
on (a12.LOCATION_KEY = a124.ROW_KEY)
union
select 'ldb."d_incident_application_mdm" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY) join "ldb"."d_incident_application" a115
on (a114.APPLICATION_KEY = a115.ROW_KEY)
join "ldb"."d_incident_application_mdm" a125
on (a115.MDM_KEY = a125.ROW_KEY)
union
select 'ldb."d_incident_assigned_to" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_assigned_to" a126
on (a114.ASSIGNED_TO_KEY = a126.ROW_KEY)
union
select 'ldb."d_incident_calendar_month" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_date" a116
on (a11.INCIDENT_DATE_KEY = a116.ROW_KEY)
join "ldb"."d_incident_calendar_month" a127
on (a116.MONTH_START_DATE_KEY = a127.ROW_KEY)
union
select 'ldb."d_incident_close_code" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_close_code" a128
on (a114.CLOSE_CODE_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."d_incident_closed_by" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_closed_by" a129
on (a114.CLOSED_BY_KEY = a129.ROW_KEY)
union
select 'ldb."d_incident_location" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_location" a130
on (a114.LOCATION_KEY = a130.ROW_KEY)
union
select 'ldb."d_incident_opened_by" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_opened_by" a131
on (a114.OPENED_BY_KEY = a131.ROW_KEY)
union
select 'ldb."d_incident_priority" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_priority" a132
on (a114.PRIORITY_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."d_task_sla_resolution_flag" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_task_sla_resolution_flag" a133
on (a114.MET_RESOLUTION_SLA_FLAG_KEY = a133.ROW_KEY)
union
select 'ldb."d_incident_resolved_by" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_resolved_by" a134
on (a114.RESOLVED_BY_KEY = a134.ROW_KEY)
union
select 'ldb."d_task_sla_response_flag" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_task_sla_response_flag" a135
on (a114.MET_RESPONSE_SLA_FLAG_KEY = a135.ROW_KEY)
union
select 'ldb."d_incident_severity" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_severity" a136
on (a114.SEVERITY_SRC_KEY = a136.ROW_KEY)
union
select 'ldb."d_incident_state" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_state" a137
on (a114.STATE_SRC_KEY = a137.ROW_KEY)
union
select 'ldb."d_internal_contact_cio_user_c" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY) join "ldb"."d_application_mdm" a14
on (a13.MDM_KEY = a14.ROW_KEY) join "ldb"."d_fmr_product_c" a16
on (a14.FMR_PRODUCT_C_KEY = a16.ROW_KEY) join "ldb"."d_fmr_product_line_c" a17
on (a16.fmr_product_line_c_key = a17.ROW_KEY) join "ldb"."d_fmr_cost_center_c" a18
on (a17.COST_CENTER_C_KEY = a18.ROW_KEY) join "ldb"."d_fmr_business_unit_c" a19
on (a18.fmr_business_unit_c_key = a19.ROW_KEY) join "ldb"."d_fmr_business_group_c" a110
on (a19.fmr_business_group_c_key = a110.ROW_KEY) join "ldb"."d_fmr_operating_committee_c" a111
on (a110.fmr_operating_committee_c_key = a111.ROW_KEY) join "ldb"."d_fmr_cio_group_c" a112
on (a111.fmr_cio_group_c_key = a112.ROW_KEY)
join "ldb"."d_internal_contact_cio_user_c" a138
on (a112.CIO_USER_C_KEY = a138.ROW_KEY)