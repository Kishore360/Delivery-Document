select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
union
select 'ldb."D_INCIDENT_TIME" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_TIME" a12
on (a11.incident_time_key = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT_EMPLOYEE" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_EMPLOYEE" a13
on (a11.incident_employee_key = a13.ROW_KEY)
union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
union
select 'ldb."D_INCIDENT_APPLICATION" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
union
select 'ldb."D_INCIDENT_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
union
select 'ldb."D_INCIDENT_DATE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_DATE" a19
on (a11.incident_date_key = a19.ROW_KEY)
union
select 'ldb."D_INCIDENT_CALENDAR_MONTH" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_DATE" a19
on (a11.incident_date_key = a19.ROW_KEY)
join "ldb"."D_INCIDENT_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_INCIDENT_CALENDAR_QUARTER" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_DATE" a19
on (a11.incident_date_key = a19.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_INCIDENT_RFC" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_RFC" a112
on (a14.change_request_key = a112.ROW_KEY)
union
select 'ldb."D_INCIDENT_CLOSED_BY" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_CLOSED_BY" a113
on (a14.CLOSED_BY_KEY = a113.ROW_KEY)
union
select 'ldb."D_CONFIGURATION_ITEM_INCIDENT" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a114
on (a14.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
union
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a114
on (a14.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
join "ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM" a115
on (a114.MDM_KEY = a115.ROW_KEY)
union
select 'ldb."D_INCIDENT_CUSTOMER" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_CUSTOMER" a116
on (a14.CUSTOMER_KEY = a116.ROW_KEY)
union
select 'ldb."D_INCIDENT_OPENED_BY" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_OPENED_BY" a117
on (a14.opened_by_key = a117.ROW_KEY)
union
select 'ldb."D_INCIDENT_RESOLVED_BY" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_RESOLVED_BY" a118
on (a14.resolved_by_key = a118.ROW_KEY)
union
select 'ldb."D_PARENT_INCIDENT" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_PARENT_INCIDENT" a119
on (a14.parent_incident_key = a119.ROW_KEY)
union
select 'ldb."D_INCIDENT_CALENDAR_HOUR" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_TIME" a12
on (a11.incident_time_key = a12.ROW_KEY)
join "ldb"."D_INCIDENT_CALENDAR_HOUR" a120
on (a12.hour_key = a120.ROW_KEY)
union
select 'ldb."D_INCIDENT_CAUSED_BY_CHANGE" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_CAUSED_BY_CHANGE" a121
on (a11.incident_caused_by_change_key = a121.ROW_KEY)
union
select 'ldb."D_INCIDENT_CONTACTTYPE" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_CONTACTTYPE" a122
on (a11.reported_type_src_key = a122.ROW_KEY)
union
select 'ldb."D_INCIDENT_DEPARTMENT" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_EMPLOYEE" a13
on (a11.incident_employee_key = a13.ROW_KEY)
join "ldb"."D_INCIDENT_DEPARTMENT" a123
on (a13.DEPARTMENT_KEY = a123.ROW_KEY)
union
select 'ldb."d_incident_employee_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_EMPLOYEE" a13
on (a11.incident_employee_key = a13.ROW_KEY)
join "ldb"."d_incident_employee_mdm" a124
on (a13.employee_mdm_key = a124.ROW_KEY)
union
select 'ldb."D_INCIDENT_IMPACT" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_IMPACT" a125
on (a11.IMPACT_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."D_INCIDENT_URGENCY" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_URGENCY" a126
on (a11.urgency_src_key = a126.ROW_KEY)
union
select 'ldb."D_INCIDENT_APPLICATION_MDM" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
join "ldb"."D_INCIDENT_APPLICATION_MDM" a127
on (a15.MDM_KEY = a127.ROW_KEY)
union
select 'ldb."D_INCIDENT_CALENDAR_WEEK" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_DATE" a19
on (a11.incident_date_key = a19.ROW_KEY)
join "ldb"."D_INCIDENT_CALENDAR_WEEK" a128
on (a19.week_start_date_key = a128.ROW_KEY)
union
select 'ldb."D_INCIDENT_CATEGORY" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_CATEGORY" a129
on (a14.CATEGORY_SRC_KEY = a129.ROW_KEY)
union
select 'ldb."D_INCIDENT_CLOSE_CODE" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_CLOSE_CODE" a130
on (a14.CLOSE_CODE_SRC_KEY = a130.ROW_KEY)
union
select 'ldb."d_incident_company" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."d_incident_company" a131
on (a14.COMPANY_KEY = a131.ROW_KEY)
union
select 'ldb."D_INCIDENT_CUSTOMER_MDM" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_CUSTOMER" a116
on (a14.CUSTOMER_KEY = a116.ROW_KEY)
join "ldb"."D_INCIDENT_CUSTOMER_MDM" a132
on (a116.customer_mdm_key = a132.ROW_KEY)
union
select 'ldb."D_INCIDENT_DOMAIN" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_DOMAIN" a133
on (a14.DOMAIN_KEY = a133.ROW_KEY)
union
select 'ldb."D_INCIDENT_LOCATION" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_LOCATION" a134
on (a14.LOCATION_KEY = a134.ROW_KEY)
union
select 'ldb."D_INCIDENT_PRIORITY" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_PRIORITY" a135
on (a14.PRIORITY_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."D_TASK_SLA_RESOLUTION_FLAG" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_TASK_SLA_RESOLUTION_FLAG" a136
on (a14.met_resolution_sla_flag_key = a136.ROW_KEY)
union
select 'ldb."D_TASK_SLA_RESPONSE_FLAG" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_TASK_SLA_RESPONSE_FLAG" a137
on (a14.met_response_sla_flag_key = a137.ROW_KEY)
union
select 'ldb."D_INCIDENT_SEVERITY" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_SEVERITY" a138
on (a14.severity_src_key = a138.ROW_KEY)
union
select 'ldb."D_INCIDENT_STATE" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_STATE" a139
on (a14.STATE_SRC_KEY = a139.ROW_KEY)
union
select 'ldb."D_INCIDENT_SUBCATEGORY" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY)
join "ldb"."D_INCIDENT_SUBCATEGORY" a140
on (a14.sub_category_src_key = a140.ROW_KEY)
union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a141
on (a17.manager_key = a141.ROW_KEY)
union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a142
on (a18.CRITICALITY_KEY = a142.ROW_KEY)
union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a143
on (a18.used_for_src_key = a143.ROW_KEY)
union
select 'ldb."D_INCIDENT_CLOSED_BY_DEPARTMENT_C" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_CLOSED_BY" a113
on (a14.CLOSED_BY_KEY = a113.ROW_KEY)
join "ldb"."D_INCIDENT_CLOSED_BY_DEPARTMENT_C" a144
on (a113.INCIDENT_CLOSED_BY_DEPARTMENT_C_KEY = a144.ROW_KEY)
union
select 'ldb."D_INCIDENT_OPENED_BY_DEPARTMENT_C" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_OPENED_BY" a117
on (a14.opened_by_key = a117.ROW_KEY)
join "ldb"."D_INCIDENT_OPENED_BY_DEPARTMENT_C" a145
on (a117.INCIDENT_OPENED_BY_DEPARTMENT_C_KEY = a145.ROW_KEY)
union
select 'ldb."D_INCIDENT_OPENED_BY_LOCATION_C" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_OPENED_BY" a117
on (a14.opened_by_key = a117.ROW_KEY)
join "ldb"."D_INCIDENT_OPENED_BY_LOCATION_C" a146
on (a117.INCIDENT_OPENED_BY_LOCATION_C_KEY = a146.ROW_KEY)
union
select 'ldb."D_INCIDENT_RESOLVED_BY_DEPARTMENT_C" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT" a14
on (a11.incident_key = a14.ROW_KEY) join "ldb"."D_INCIDENT_RESOLVED_BY" a118
on (a14.resolved_by_key = a118.ROW_KEY)
join "ldb"."D_INCIDENT_RESOLVED_BY_DEPARTMENT_C" a147
on (a118.INCIDENT_RESOLVED_BY_DEPARTMENT_C_KEY = a147.ROW_KEY)
union
select 'ldb."D_INCIDENT_CALENDAR_YEAR" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT" a11
join "ldb"."D_INCIDENT_DATE" a19
on (a11.incident_date_key = a19.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."D_INCIDENT_CALENDAR_YEAR" a148
on (a111.year_start_date_key = a148.ROW_KEY)