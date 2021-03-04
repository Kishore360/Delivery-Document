select 'ldb."F_CHANGE_REQUEST" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
union
select 'ldb."D_CHANGE_EMPLOYEE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_EMPLOYEE" a12
on (a11.change_employee_key = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
union
select 'ldb."D_CHANGE_APPLICATION" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_APPLICATION" a14
on (a13.APPLICATION_KEY = a14.ROW_KEY)
union
select 'ldb."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."D_H_CHANGE_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."D_H_CHANGE_ASSIGNMENT_GROUP" a17
on (a16.group_hierarchy_key = a17.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE" a18
on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
union
select 'ldb."D_CHANGE_DATE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a19
on (a11.change_date_key = a19.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_MONTH" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a19
on (a11.change_date_key = a19.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_QUARTER" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a19
on (a11.change_date_key = a19.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_CHANGE_CONFIGURATION_ITEM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_CONFIGURATION_ITEM" a112
on (a13.CONFIGURATION_ITEM_KEY = a112.ROW_KEY)
union
select 'ldb."D_CHANGE_CONFIGURATION_ITEM_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_CONFIGURATION_ITEM" a112
on (a13.CONFIGURATION_ITEM_KEY = a112.ROW_KEY)
join "ldb"."D_CHANGE_CONFIGURATION_ITEM_MDM" a113
on (a112.MDM_KEY = a113.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_OPENED_BY_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_OPENED_BY_C" a114
on (a13.CHANGE_OPENED_BY_C_KEY = a114.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_CHANGE_CLOSED_BY" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_CHANGE_CLOSED_BY" a115
on (a13.CLOSED_BY_KEY = a115.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_RISK" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_RISK" a116
on (a11.RISK_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_CATEGORY" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_CATEGORY" a117
on (a11.CATEGORY_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REPORTED_TYPE" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REPORTED_TYPE" a118
on (a11.reported_type_src_key = a118.ROW_KEY)
union
select 'ldb."D_CHANGE_EMPLOYEE_MDM" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_EMPLOYEE" a12
on (a11.change_employee_key = a12.ROW_KEY)
join "ldb"."D_CHANGE_EMPLOYEE_MDM" a119
on (a12.employee_mdm_key = a119.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_IMPACT" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_IMPACT" a120
on (a11.IMPACT_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_PRIORITY" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_PRIORITY" a121
on (a11.PRIORITY_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REASON" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REASON" a122
on (a11.reason_src_key = a122.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REVIEW_STATUS" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REVIEW_STATUS" a123
on (a11.review_status_src_key = a123.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_SCOPE" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_SCOPE" a124
on (a11.SCOPE_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_URGENCY" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_URGENCY" a125
on (a11.urgency_src_key = a125.ROW_KEY)
union
select 'ldb."D_CHANGE_APPLICATION_MDM" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_APPLICATION" a14
on (a13.APPLICATION_KEY = a14.ROW_KEY)
join "ldb"."D_CHANGE_APPLICATION_MDM" a126
on (a14.MDM_KEY = a126.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_APPROVAL" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_APPROVAL" a127
on (a11.APPROVAL_STATE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_WEEK" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a19
on (a11.change_date_key = a19.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_WEEK" a128
on (a19.week_start_date_key = a128.ROW_KEY)
union
select 'ldb."D_CHANGE_DEPARTMENT" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DEPARTMENT" a129
on (a11.change_department_key = a129.ROW_KEY)
union
select 'ldb."D_CHANGE_DOMAIN" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_DOMAIN" a130
on (a13.DOMAIN_KEY = a130.ROW_KEY)
union
select 'ldb."D_CHANGE_LOCATION" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY)
join "ldb"."D_CHANGE_LOCATION" a131
on (a13.LOCATION_KEY = a131.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_STATE" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_STATE" a132
on (a11.STATE_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_TYPE" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_TYPE" a133
on (a11.TYPE_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."D_CHANGE_ASSIGNMENT_GROUP_LEVEL_1" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) join "ldb"."D_H_CHANGE_ASSIGNMENT_GROUP" a17
on (a16.group_hierarchy_key = a17.ROW_KEY)
join "ldb"."D_CHANGE_ASSIGNMENT_GROUP_LEVEL_1" a134
on (a17.group_level_1_key = a134.ROW_KEY)
union
select 'ldb."D_CHANGE_ASSIGNMENT_GROUP_LEVEL_2" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) join "ldb"."D_H_CHANGE_ASSIGNMENT_GROUP" a17
on (a16.group_hierarchy_key = a17.ROW_KEY)
join "ldb"."D_CHANGE_ASSIGNMENT_GROUP_LEVEL_2" a135
on (a17.group_level_2_key = a135.ROW_KEY)
union
select 'ldb."D_CHANGE_ASSIGNMENT_GROUP_MANAGER" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."D_CHANGE_ASSIGNMENT_GROUP_MANAGER" a136
on (a16.manager_key = a136.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE_CRITICALITY" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_BUSINESS_SERVICE" a18
on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE_CRITICALITY" a137
on (a18.CRITICALITY_KEY = a137.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE_USED_FOR" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_BUSINESS_SERVICE" a18
on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE_USED_FOR" a138
on (a18.used_for_src_key = a138.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_OPENED_BY_DEPARTMENT_C" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_OPENED_BY_C" a114
on (a13.CHANGE_OPENED_BY_C_KEY = a114.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_OPENED_BY_DEPARTMENT_C" a139
on (a114.CHANGE_OPENED_BY_DEPARTMENT_C = a139.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_CLOSED_BY_DEPARTMENT_C" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.change_request_key = a13.ROW_KEY) join "ldb"."D_INTERNAL_CONTACT_CHANGE_CLOSED_BY" a115
on (a13.CLOSED_BY_KEY = a115.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_CLOSED_BY_DEPARTMENT_C" a140
on (a115.CHANGE_REQUEST_CLOSED_BY_DEPARTMENT_C_KEY = a140.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_YEAR" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a19
on (a11.change_date_key = a19.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_YEAR" a141
on (a111.year_start_date_key = a141.ROW_KEY)