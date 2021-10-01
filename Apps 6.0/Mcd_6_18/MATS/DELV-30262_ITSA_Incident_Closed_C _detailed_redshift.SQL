select 'ldb."f_incident_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
union
select 'ldb."D_BUSINESS_SERVICE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."D_BUSINESS_SERVICE" a12
on (a11.business_service_key = a12.row_key)
union
select 'ldb."d_incident_time" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_time" a13
on (a11.incident_time_key = a13.row_key)
union
select 'ldb."d_incident_employee" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_employee" a14
on (a11.incident_employee_key = a14.row_key)
union
select 'ldb."d_calendar_date" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_calendar_date" a15
on (a11.date_key = a15.row_key)
union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_calendar_date" a15
on (a11.date_key = a15.row_key)
join "ldb"."d_calendar_month" a16
on (a15.month_start_date_key = a16.row_key)
union
select 'ldb."d_calendar_quarter" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_calendar_date" a15
on (a11.date_key = a15.row_key) join "ldb"."d_calendar_month" a16
on (a15.month_start_date_key = a16.row_key)
join "ldb"."d_calendar_quarter" a17
on (a16.quarter_start_date_key = a17.row_key)
union
select 'ldb."d_incident" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
union
select 'ldb."D_INCIDENT_APPLICATION" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_APPLICATION" a19
on (a18.application_key = a19.row_key)
union
select 'ldb."D_INCIDENT_ASSIGNED_TO" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key)
union
select 'ldb."d_incident_assignment_group" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_assignment_group" a111
on (a18.assignment_group_key = a111.row_key)
union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112
on (a18.business_service_key = a112.row_key)
union
select 'ldb."d_incident_date" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_date" a113
on (a11.incident_date_key = a113.row_key)
union
select 'ldb."d_incident_calendar_month" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_date" a113
on (a11.incident_date_key = a113.row_key)
join "ldb"."d_incident_calendar_month" a114
on (a113.month_start_date_key = a114.row_key)
union
select 'ldb."d_incident_calendar_quarter" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_date" a113
on (a11.incident_date_key = a113.row_key) join "ldb"."d_incident_calendar_month" a114
on (a113.month_start_date_key = a114.row_key)
join "ldb"."d_incident_calendar_quarter" a115
on (a114.quarter_start_date_key = a115.row_key)
union
select 'ldb."d_incident_rfc" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_rfc" a116
on (a18.change_request_key = a116.row_key)
union
select 'ldb."d_configuration_item_incident" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_configuration_item_incident" a117
on (a18.configuration_item_key = a117.row_key)
union
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."d_configuration_item_incident" a117
on (a18.configuration_item_key = a117.row_key)
join "ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM" a118
on (a117.MDM_KEY = a118.row_key)
union
select 'ldb."d_incident_customer" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_customer" a119
on (a18.customer_key = a119.row_key)
union
select 'ldb."D_GBL_C" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key)
join "ldb"."D_GBL_C" a120
on (a110.GBL_C_KEY = a120.row_key)
union
select 'ldb."d_incident_calendar_week" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_date" a113
on (a11.incident_date_key = a113.row_key)
join "ldb"."d_incident_calendar_week" a121
on (a113.week_start_date_key = a121.row_key)
union
select 'ldb."d_incident_calendar_year" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_date" a113
on (a11.incident_date_key = a113.row_key) join "ldb"."d_incident_calendar_month" a114
on (a113.month_start_date_key = a114.row_key) join "ldb"."d_incident_calendar_quarter" a115
on (a114.quarter_start_date_key = a115.row_key)
join "ldb"."d_incident_calendar_year" a122
on (a115.year_start_date_key = a122.row_key)
union
select 'ldb."d_incident_priority" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_priority" a123
on (a18.priority_src_key = a123.row_key)
union
select 'ldb."D_INCIDENT_PROBLEM" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_PROBLEM" a124
on (a18.problem_key = a124.row_key)
union
select 'ldb."D_INCIDENT_OPENED_BY" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_OPENED_BY" a125
on (a18.opened_by_key = a125.row_key)
union
select 'ldb."D_PARENT_INCIDENT" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_PARENT_INCIDENT" a126
on (a18.parent_incident_key = a126.row_key)
union
select 'ldb."D_LOV_SERVICE_ACCESS_C" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."D_BUSINESS_SERVICE" a12
on (a11.business_service_key = a12.row_key)
join "ldb"."D_LOV_SERVICE_ACCESS_C" a127
on (a12.SERVICE_ACCESS_C_KEY = a127.row_key)
union
select 'ldb."d_incident_calendar_hour" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_time" a13
on (a11.incident_time_key = a13.row_key)
join "ldb"."d_incident_calendar_hour" a128
on (a13.hour_key = a128.row_key)
union
select 'ldb."d_incident_caused_by_change" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_caused_by_change" a129
on (a11.incident_caused_by_change_key = a129.row_key)
union
select 'ldb."d_incident_contacttype" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_contacttype" a130
on (a11.reported_type_src_key = a130.row_key)
union
select 'ldb."d_incident_department" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_employee" a14
on (a11.incident_employee_key = a14.row_key)
join "ldb"."d_incident_department" a131
on (a14.department_key = a131.row_key)
union
select 'ldb."d_incident_employee_mdm" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_employee" a14
on (a11.incident_employee_key = a14.row_key)
join "ldb"."d_incident_employee_mdm" a132
on (a14.employee_mdm_key = a132.row_key)
union
select 'ldb."d_incident_impact" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_impact" a133
on (a11.impact_src_key = a133.row_key)
union
select 'ldb."d_incident_urgency" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident_urgency" a134
on (a11.urgency_src_key = a134.row_key)
union
select 'ldb."d_calendar_year" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_calendar_date" a15
on (a11.date_key = a15.row_key) join "ldb"."d_calendar_month" a16
on (a15.month_start_date_key = a16.row_key) join "ldb"."d_calendar_quarter" a17
on (a16.quarter_start_date_key = a17.row_key)
join "ldb"."d_calendar_year" a135
on (a17.year_start_date_key = a135.row_key)
union
select 'ldb."D_INCIDENT_APPLICATION_MDM" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_APPLICATION" a19
on (a18.application_key = a19.row_key)
join "ldb"."D_INCIDENT_APPLICATION_MDM" a136
on (a19.MDM_KEY = a136.row_key)
union
select 'ldb."D_BUSINESSUNIT_CUSTOM_C" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_BUSINESSUNIT_CUSTOM_C" a137
on (a18.BUSINESSUNIT_CUSTOM_C_KEY = a137.row_key)
union
select 'ldb."d_incident_category" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_category" a138
on (a18.category_src_key = a138.row_key)
union
select 'ldb."d_incident_close_code" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_close_code" a139
on (a18.close_code_src_key = a139.row_key)
union
select 'ldb."D_INCIDENT_CLOSED_BY" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_CLOSED_BY" a140
on (a18.closed_by_key = a140.row_key)
union
select 'ldb."D_INCIDENT_COMPANY" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_COMPANY" a141
on (a18.company_key = a141.row_key)
union
select 'ldb."d_incident_customer_mdm" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."d_incident_customer" a119
on (a18.customer_key = a119.row_key)
join "ldb"."d_incident_customer_mdm" a142
on (a119.customer_mdm_key = a142.row_key)
union
select 'ldb."d_incident_domain" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_domain" a143
on (a18.domain_key = a143.row_key)
union
select 'ldb."D_INCIDENT_LEGACY_CI_NAME_C" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_LEGACY_CI_NAME_C" a144
on (a18.INCIDENT_LEGACY_CONFIGURATION_ITEM_C_KEY = a144.row_key)
union
select 'ldb."d_incident_location" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_location" a145
on (a18.location_key = a145.row_key)
union
select 'ldb."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a146
on (a18.INCIDENT_NEVA_SUBCATEGORY_C_KEY = a146.row_key)
union
select 'ldb."D_INTERNAL_CONTACT_OPENED_BY_C" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INTERNAL_CONTACT_OPENED_BY_C" a147
on (a18.INCIDENT_OPENED_BY_C_KEY = a147.row_key)
union
select 'ldb."D_REQUEST_ITEM_ORIGINAL_C" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_REQUEST_ITEM_ORIGINAL_C" a148
on (a18.INCIDENT_ORIGINAL_REQUEST_ITEM_C_KEY = a148.row_key)
union
select 'ldb."D_LOV_INCIDENT_PENDING_REASON_C" a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_LOV_INCIDENT_PENDING_REASON_C" a149
on (a18.INCIDENT_PENDING_REASON_C_KEY = a149.row_key)
union
select 'ldb."D_SCAFE_CORE_REALM_C" a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_SCAFE_CORE_REALM_C" a150
on (a18.SCAFE_CORE_REALM_C_KEY = a150.row_key)
union
select 'ldb."d_task_sla_resolution_flag" a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_task_sla_resolution_flag" a151
on (a18.met_resolution_sla_flag_key = a151.row_key)
union
select 'ldb."D_INCIDENT_RESOLVED_BY" a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_RESOLVED_BY" a152
on (a18.resolved_by_key = a152.row_key)
union
select 'ldb."d_task_sla_response_flag" a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_task_sla_response_flag" a153
on (a18.met_response_sla_flag_key = a153.row_key)
union
select 'ldb."d_incident_severity" a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_severity" a154
on (a18.severity_src_key = a154.row_key)
union
select 'ldb."D_LOV_INCIDENT_SITUATION_C" a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_LOV_INCIDENT_SITUATION_C" a155
on (a18.INCIDENT_SITUATION_C_KEY = a155.row_key)
union
select 'ldb."d_incident_state" a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_state" a156
on (a18.state_src_key = a156.row_key)
union
select 'ldb."d_incident_subcategory" a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."d_incident_subcategory" a157
on (a18.sub_category_src_key = a157.row_key)
union
select 'ldb."D_LOV_INCIDENT_TYPE_C" a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_LOV_INCIDENT_TYPE_C" a158
on (a18.INCIDENT_TYPE_C_KEY = a158.row_key)
union
select 'ldb."D_INCIDENT_WORKPLACE_LOCATION_C" a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_WORKPLACE_LOCATION_C" a159
on (a18.INCIDENT_INTEGRATION_SRMS_LOCATION_C_KEY = a159.row_key)
union
select 'ldb."D_INCIDENT_U_SUBCATEGORY_C" a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key)
join "ldb"."D_INCIDENT_U_SUBCATEGORY_C" a160
on (a18.INCIDENT_SUBCATEGORY_DIM_C_KEY = a160.row_key)
union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."d_incident_assignment_group" a111
on (a18.assignment_group_key = a111.row_key)
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a161
on (a111.manager_key = a161.row_key)
union
select 'ldb."d_incident_business_service_criticality" a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112
on (a18.business_service_key = a112.row_key)
join "ldb"."d_incident_business_service_criticality" a162
on (a112.CRITICALITY_KEY = a162.row_key)
union
select 'ldb."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112
on (a18.business_service_key = a112.row_key)
join "ldb"."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a163
on (a112.SERVICE_OWNED_BY_C_KEY = a163.row_key)
union
select 'ldb."d_incident_business_service_used_for" a164 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112
on (a18.business_service_key = a112.row_key)
join "ldb"."d_incident_business_service_used_for" a164
on (a112.USED_FOR_SRC_KEY = a164.row_key)
union
select 'ldb."D_INTERNAL_ORGANIZATION_VENDOR_C" a165 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."d_incident_assignment_group" a111
on (a18.assignment_group_key = a111.row_key)
join "ldb"."D_INTERNAL_ORGANIZATION_VENDOR_C" a165
on (a111.VENDOR_C_KEY = a165.row_key)
union
select 'ldb."D_GBL_DIRECTOR_NAME_C" a166 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key) join "ldb"."D_GBL_C" a120
on (a110.GBL_C_KEY = a120.row_key)
join "ldb"."D_GBL_DIRECTOR_NAME_C" a166
on (a120.DIRECTOR_NAME_C_KEY = a166.row_key)
union
select 'ldb."D_GBL_SR_VICE_PRESIDENT_NAME_C" a167 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key) join "ldb"."D_GBL_C" a120
on (a110.GBL_C_KEY = a120.row_key)
join "ldb"."D_GBL_SR_VICE_PRESIDENT_NAME_C" a167
on (a120.SR_VICE_PRESIDENT_NAME_C_KEY = a167.row_key)
union
select 'ldb."D_GBL_SR_DIRECTOR_NAME_C" a168 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key) join "ldb"."D_GBL_C" a120
on (a110.GBL_C_KEY = a120.row_key)
join "ldb"."D_GBL_SR_DIRECTOR_NAME_C" a168
on (a120.SR_DIRECTOR_NAME_C_KEY = a168.row_key)
union
select 'ldb."D_GBL_VICE_PRESIDENT_NAME_C" a169 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_closed" a11
join "ldb"."d_incident" a18
on (a11.incident_key = a18.row_key) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110
on (a18.assigned_to_key = a110.row_key) join "ldb"."D_GBL_C" a120
on (a110.GBL_C_KEY = a120.row_key)
join "ldb"."D_GBL_VICE_PRESIDENT_NAME_C" a169
on (a120.VICE_PRESIDENT_NAME_C_KEY = a169.row_key)