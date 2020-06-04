select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_customer" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_customer" a14
on (a11.CUSTOMER_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact" a15
on (a11.EMPLOYEE_KEY = a15.ROW_KEY)
union
select 'ldb."d_calendar_time" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_time" a16
on (a11.TIME_KEY = a16.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact_assigned_to" a17
on (a11.ASSIGNED_TO_KEY = a17.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_organization_group" a18
on (a11.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)
union
select 'ldb."d_business_service" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_business_service" a19
on (a11.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
union
select 'ldb."d_calendar_date" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_date" a110
on (a11.DATE_KEY = a110.ROW_KEY)
union
select 'ldb."d_calendar_month" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_date" a110
on (a11.DATE_KEY = a110.ROW_KEY)
join "ldb"."d_calendar_month" a111
on (a110.month_start_date_key = a111.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_date" a110
on (a11.DATE_KEY = a110.ROW_KEY) join "ldb"."d_calendar_month" a111
on (a110.month_start_date_key = a111.ROW_KEY)
join "ldb"."d_calendar_quarter" a112
on (a111.quarter_start_date_key = a112.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_CHANGE_REQUEST" a113
on (a11.CHANGE_REQUEST_KEY = a113.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a114
on (a13.mdm_key = a114.ROW_KEY)
union
select 'ldb."D_INCIDENT" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
union
select 'ldb."d_parent_incident" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_parent_incident" a116
on (a115.PARENT_INCIDENT_KEY = a116.ROW_KEY)
union
select 'ldb."d_application_mdm" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a117
on (a12.mdm_key = a117.ROW_KEY)
union
select 'ldb."d_change_request_caused_by" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_change_request_caused_by" a118
on (a11.CAUSED_BY_CHANGE_KEY = a118.ROW_KEY)
union
select 'ldb."d_internal_organization_legalentity" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_organization_legalentity" a119
on (a11.COMPANY_KEY = a119.ROW_KEY)
union
select 'ldb."d_customer_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_customer" a14
on (a11.CUSTOMER_KEY = a14.ROW_KEY)
join "ldb"."d_customer_mdm" a120
on (a14.customer_mdm_key = a120.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact" a15
on (a11.EMPLOYEE_KEY = a15.ROW_KEY)
join "ldb"."d_internal_organization_department" a121
on (a15.DEPARTMENT_KEY = a121.ROW_KEY)
union
select 'ldb."d_domain" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_domain" a122
on (a11.DOMAIN_KEY = a122.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_internal_contact" a15
on (a11.EMPLOYEE_KEY = a15.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a123
on (a15.employee_mdm_key = a123.ROW_KEY)
union
select 'ldb."d_calendar_time_hour" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_time" a16
on (a11.TIME_KEY = a16.ROW_KEY)
join "ldb"."d_calendar_time_hour" a124
on (a16.hour_key = a124.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_contacttype" a125
on (a11.REPORTED_TYPE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_incident_impact" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_impact" a126
on (a11.IMPACT_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_incident_urgency" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_incident_urgency" a127
on (a11.URGENCY_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_location" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_location" a128
on (a11.LOCATION_KEY = a128.ROW_KEY)
union
select 'ldb."D_REGION_C" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_REGION_C" a129
on (a11.SUPPORT_REGION_C_KEY = a129.ROW_KEY)
union
select 'ldb."d_business_service_criticality" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_business_service" a19
on (a11.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
join "ldb"."d_business_service_criticality" a130
on (a19.criticality_key = a130.ROW_KEY)
union
select 'ldb."d_business_service_used_for" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_business_service" a19
on (a11.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
join "ldb"."d_business_service_used_for" a131
on (a19.used_for_src_key = a131.ROW_KEY)
union
select 'ldb."d_calendar_week" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_date" a110
on (a11.DATE_KEY = a110.ROW_KEY)
join "ldb"."d_calendar_week" a132
on (a110.week_start_date_key = a132.ROW_KEY)
union
select 'ldb."d_incident_category" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_category" a133
on (a115.CATEGORY_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."d_incident_close_code" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_close_code" a134
on (a115.CLOSE_CODE_SRC_KEY = a134.ROW_KEY)
union
select 'ldb."d_incident_priority" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_priority" a135
on (a115.PRIORITY_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."d_task_sla_resolution_flag" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_task_sla_resolution_flag" a136
on (a115.MET_RESOLUTION_SLA_FLAG_KEY = a136.ROW_KEY)
union
select 'ldb."d_task_sla_response_flag" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_task_sla_response_flag" a137
on (a115.MET_RESPONSE_SLA_FLAG_KEY = a137.ROW_KEY)
union
select 'ldb."d_incident_severity" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_severity" a138
on (a115.SEVERITY_SRC_KEY = a138.ROW_KEY)
union
select 'ldb."d_incident_state" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_state" a139
on (a115.STATE_SRC_KEY = a139.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a115
on (a11.INCIDENT_KEY = a115.ROW_KEY)
join "ldb"."d_incident_subcategory" a140
on (a115.SUB_CATEGORY_SRC_KEY = a140.ROW_KEY)
union
select 'ldb."d_calendar_year" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."d_calendar_date" a110
on (a11.DATE_KEY = a110.ROW_KEY) join "ldb"."d_calendar_month" a111
on (a110.month_start_date_key = a111.ROW_KEY) join "ldb"."d_calendar_quarter" a112
on (a111.quarter_start_date_key = a112.ROW_KEY)
join "ldb"."d_calendar_year" a141
on (a112.year_start_date_key = a141.ROW_KEY)


