select 'ldb."F_CHANGE_REQUEST" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
union
select 'ldb."D_CHANGE_EMPLOYEE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_EMPLOYEE" a12
on (a11.CHANGE_EMPLOYEE_KEY = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
union
select 'ldb."D_CHANGE_APPLICATION" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_APPLICATION" a14
on (a13.APPLICATION_KEY = a14.ROW_KEY)
union
select 'ldb."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE" a17
on (a13.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
union
select 'ldb."D_CHANGE_DATE" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a18
on (a11.CHANGE_DATE_KEY = a18.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_MONTH" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a18
on (a11.CHANGE_DATE_KEY = a18.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_MONTH" a19
on (a18.month_start_date_key = a19.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_QUARTER" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a18
on (a11.CHANGE_DATE_KEY = a18.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_MONTH" a19
on (a18.month_start_date_key = a19.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_QUARTER" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_CHANGE_CONFIGURATION_ITEM" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_CONFIGURATION_ITEM" a111
on (a13.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
union
select 'ldb."D_CHANGE_CONFIGURATION_ITEM_MDM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_CONFIGURATION_ITEM" a111
on (a13.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."D_CHANGE_CONFIGURATION_ITEM_MDM" a112
on (a111.MDM_KEY = a112.ROW_KEY)
union
select 'ldb."D_CHANGE_GBL_C" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY)
join "ldb"."D_CHANGE_GBL_C" a113
on (a15.CHANGE_GBL_C_KEY = a113.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_RISK" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_RISK" a114
on (a11.RISK_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_STATE" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_STATE" a115
on (a11.STATE_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."D_CALENDAR_DATE" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CALENDAR_DATE" a116
on (a11.DATE_KEY = a116.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_APPROVAL" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_APPROVAL" a117
on (a11.APPROVAL_STATE_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_CATEGORY" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_CATEGORY" a118
on (a11.CATEGORY_SRC_KEY = a118.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REPORTED_TYPE" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REPORTED_TYPE" a119
on (a11.REPORTED_TYPE_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."D_CHANGE_DEPARTMENT" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DEPARTMENT" a120
on (a11.CHANGE_DEPARTMENT_KEY = a120.ROW_KEY)
union
select 'ldb."D_CHANGE_EMPLOYEE_MDM" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_EMPLOYEE" a12
on (a11.CHANGE_EMPLOYEE_KEY = a12.ROW_KEY)
join "ldb"."D_CHANGE_EMPLOYEE_MDM" a121
on (a12.EMPLOYEE_MDM_KEY = a121.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_IMPACT" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_IMPACT" a122
on (a11.IMPACT_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_PRIORITY" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_PRIORITY" a123
on (a11.PRIORITY_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REASON" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REASON" a124
on (a11.REASON_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_REVIEW_STATUS" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_REVIEW_STATUS" a125
on (a11.REVIEW_STATUS_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_SCOPE" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_SCOPE" a126
on (a11.SCOPE_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_TYPE" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_TYPE" a127
on (a11.TYPE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_URGENCY" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST_URGENCY" a128
on (a11.URGENCY_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."O_DATA_FRESHNESS" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."O_DATA_FRESHNESS" a129
on (a11.SOURCE_ID = a129.SOURCE_ID)
union
select 'ldb."D_LOV_CHANGE_REQUEST_AFFECTED_ENVIRONMENT_C" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_CHANGE_REQUEST_AFFECTED_ENVIRONMENT_C" a130
on (a13.CHANGE_AFFECTED_ENVIRONMENT_SRC_C_KEY = a130.ROW_KEY)
union
select 'ldb."D_CHANGE_APPLICATION_MDM" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_APPLICATION" a14
on (a13.APPLICATION_KEY = a14.ROW_KEY)
join "ldb"."D_CHANGE_APPLICATION_MDM" a131
on (a14.MDM_KEY = a131.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_CHANGE_APPROVER_C" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_CHANGE_APPROVER_C" a132
on (a13.CHANGE_APPROVER_C_KEY = a132.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_WEEK" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a18
on (a11.CHANGE_DATE_KEY = a18.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_WEEK" a133
on (a18.week_start_date_key = a133.ROW_KEY)
union
select 'ldb."D_LOV_CHANGE_REQUEST_CLOSURE_CODE_C" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_CHANGE_REQUEST_CLOSURE_CODE_C" a134
on (a13.CHANGE_CLOSURE_CODE_SRC_C_KEY = a134.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_DATA_CENTER_C" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_DATA_CENTER_C" a135
on (a13.CHANGE_DATA_CENTER_C_KEY = a135.ROW_KEY)
union
select 'ldb."D_LOV_CHANGE_REQUEST_DATABASE_TYPE_C" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_LOV_CHANGE_REQUEST_DATABASE_TYPE_C" a136
on (a13.CHANGE_DATABASE_TYPE_SRC_C_KEY = a136.ROW_KEY)
union
select 'ldb."D_CHANGE_DOMAIN" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_DOMAIN" a137
on (a13.DOMAIN_KEY = a137.ROW_KEY)
union
select 'ldb."D_CHANGE_LOCATION" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_LOCATION" a138
on (a13.LOCATION_KEY = a138.ROW_KEY)
union
select 'ldb."D_CHANGE_SCAFE_CORE_REALM_C" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_SCAFE_CORE_REALM_C" a139
on (a13.CHANGE_SCAFE_CORE_REALM_C_KEY = a139.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_THIRD_PARTY_C" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_THIRD_PARTY_C" a140
on (a13.CHANGE_THIRD_PARTY_C_KEY = a140.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_CMDB_LOCATION_C" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_CONFIGURATION_ITEM" a111
on (a13.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_CMDB_LOCATION_C" a141
on (a111.CHANGE_CMDB_LOCATION_C_KEY = a141.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST_STANDARD_CHANGE_C" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."D_CHANGE_REQUEST_STANDARD_CHANGE_C" a142
on (a13.STANDARD_CHANGE_C_KEY = a142.ROW_KEY)
union
select 'ldb."D_CHANGE_ASSIGNMENT_GROUP_MANAGER" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."D_CHANGE_ASSIGNMENT_GROUP_MANAGER" a143
on (a16.MANAGER_KEY = a143.ROW_KEY)
union
select 'ldb."D_INTERNAL_ORGANIZATION_CHANGE_VENDOR_C" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_REQUEST_ASSIGNMENT_GROUP" a16
on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."D_INTERNAL_ORGANIZATION_CHANGE_VENDOR_C" a144
on (a16.CHANGE_VENDOR_C_KEY = a144.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE_CRITICALITY" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_BUSINESS_SERVICE" a17
on (a13.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE_CRITICALITY" a145
on (a17.CRITICALITY_KEY = a145.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_CHANGE_SERVICE_OWNED_BY_C" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_BUSINESS_SERVICE" a17
on (a13.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_CHANGE_SERVICE_OWNED_BY_C" a146
on (a17.CHANGE_SERVICE_OWNED_BY_C_KEY = a146.ROW_KEY)
union
select 'ldb."D_CHANGE_BUSINESS_SERVICE_USED_FOR" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_BUSINESS_SERVICE" a17
on (a13.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."D_CHANGE_BUSINESS_SERVICE_USED_FOR" a147
on (a17.USED_FOR_SRC_KEY = a147.ROW_KEY)
union
select 'ldb."D_CHANGE_CALENDAR_YEAR" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_DATE" a18
on (a11.CHANGE_DATE_KEY = a18.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_MONTH" a19
on (a18.month_start_date_key = a19.ROW_KEY) join "ldb"."D_CHANGE_CALENDAR_QUARTER" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
join "ldb"."D_CHANGE_CALENDAR_YEAR" a148
on (a110.year_start_date_key = a148.ROW_KEY)
union
select 'ldb."D_GBL_CHANGE_DIRECTOR_NAME_C" a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY) join "ldb"."D_CHANGE_GBL_C" a113
on (a15.CHANGE_GBL_C_KEY = a113.ROW_KEY)
join "ldb"."D_GBL_CHANGE_DIRECTOR_NAME_C" a149
on (a113.CHANGE_DIRECTOR_NAME_C_KEY = a149.ROW_KEY)
union
select 'ldb."D_GBL_CHANGE_SR_VICE_PRESIDENT_NAME_C" a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY) join "ldb"."D_CHANGE_GBL_C" a113
on (a15.CHANGE_GBL_C_KEY = a113.ROW_KEY)
join "ldb"."D_GBL_CHANGE_SR_VICE_PRESIDENT_NAME_C" a150
on (a113.CHANGE_SR_VICE_PRESIDENT_NAME_C_KEY = a150.ROW_KEY)
union
select 'ldb."D_GBL_CHANGE_SR_DIRECTOR_NAME_C" a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY) join "ldb"."D_CHANGE_GBL_C" a113
on (a15.CHANGE_GBL_C_KEY = a113.ROW_KEY)
join "ldb"."D_GBL_CHANGE_SR_DIRECTOR_NAME_C" a151
on (a113.CHANGE_SR_DIRECTOR_NAME_C_KEY = a151.ROW_KEY)
union
select 'ldb."D_GBL_CHANGE_VICE_PRESIDENT_NAME_C" a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" a15
on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY) join "ldb"."D_CHANGE_GBL_C" a113
on (a15.CHANGE_GBL_C_KEY = a113.ROW_KEY)
join "ldb"."D_GBL_CHANGE_VICE_PRESIDENT_NAME_C" a152
on (a113.CHANGE_VICE_PRESIDENT_NAME_C_KEY = a152.ROW_KEY)