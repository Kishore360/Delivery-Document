select 'ldb."F_PROBLEM" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
union
select 'ldb."D_PROBLEM_TIME" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_TIME" a12
on (a11.PROBLEM_TIME_KEY = a12.ROW_KEY)
union
select 'ldb."D_PROBLEM_EMPLOYEE" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.PROBLEM_EMPLOYEE_KEY = a13.ROW_KEY)
union
select 'ldb."D_PROBLEM" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
union
select 'ldb."D_PROBLEM_APPLICATION" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
union
select 'ldb."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
union
select 'ldb."D_PROBLEM_DATE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a19
on (a11.PROBLEM_DATE_KEY = a19.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_MONTH" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a19
on (a11.PROBLEM_DATE_KEY = a19.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_QUARTER" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a19
on (a11.PROBLEM_DATE_KEY = a19.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_PROBLEM_CONFIGURATION_ITEM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CONFIGURATION_ITEM" a112
on (a14.CONFIGURATION_ITEM_KEY = a112.ROW_KEY)
union
select 'ldb."D_PROBLEM_CONFIGURATION_ITEM_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_CONFIGURATION_ITEM" a112
on (a14.CONFIGURATION_ITEM_KEY = a112.ROW_KEY)
join "ldb"."D_PROBLEM_CONFIGURATION_ITEM_MDM" a113
on (a112.MDM_KEY = a113.ROW_KEY)
union
select 'ldb."D_PROBLEM_GBL_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
join "ldb"."D_PROBLEM_GBL_C" a114
on (a16.PROBLEM_GBL_C_KEY = a114.ROW_KEY)
union
select 'ldb."D_PROBLEM_STATE" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_STATE" a115
on (a14.STATE_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_HOUR" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_TIME" a12
on (a11.PROBLEM_TIME_KEY = a12.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_HOUR" a116
on (a12.hour_key = a116.ROW_KEY)
union
select 'ldb."D_PROBLEM_REPORTED_TYPE" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_REPORTED_TYPE" a117
on (a11.REPORTED_TYPE_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."D_PROBLEM_DEPARTMENT" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.PROBLEM_EMPLOYEE_KEY = a13.ROW_KEY)
join "ldb"."D_PROBLEM_DEPARTMENT" a118
on (a13.DEPARTMENT_KEY = a118.ROW_KEY)
union
select 'ldb."D_PROBLEM_EMPLOYEE_MDM" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.PROBLEM_EMPLOYEE_KEY = a13.ROW_KEY)
join "ldb"."D_PROBLEM_EMPLOYEE_MDM" a119
on (a13.EMPLOYEE_MDM_KEY = a119.ROW_KEY)
union
select 'ldb."D_PROBLEM_IMPACT" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_IMPACT" a120
on (a11.IMPACT_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."D_PROBLEM_PRIORITY" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_PRIORITY" a121
on (a11.PRIORITY_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."D_PROBLEM_URGENCY" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_URGENCY" a122
on (a11.URGENCY_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."D_PROBLEM_CATEGORY_C" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CATEGORY_C" a123
on (a14.PROBLEM_CATEGORY_C_KEY = a123.ROW_KEY)
union
select 'ldb."D_PROBLEM_APPLICATION_MDM" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
join "ldb"."D_PROBLEM_APPLICATION_MDM" a124
on (a15.MDM_KEY = a124.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESSUNIT_CUSTOM_C" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESSUNIT_CUSTOM_C" a125
on (a14.PROBLEM_BUSINESSUNIT_CUSTOM_C_KEY = a125.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_WEEK" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a19
on (a11.PROBLEM_DATE_KEY = a19.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_WEEK" a126
on (a19.week_start_date_key = a126.ROW_KEY)
union
select 'ldb."D_PROBLEM_CHANGE" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CHANGE" a127
on (a14.CHANGE_KEY = a127.ROW_KEY)
union
select 'ldb."D_PROBLEM_LOCATION" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_LOCATION" a128
on (a14.LOCATION_KEY = a128.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_PROBLEM_MANAGER_C" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_PROBLEM_MANAGER_C" a129
on (a14.PROBLEM_MANAGER_C_KEY = a129.ROW_KEY)
union
select 'ldb."D_LOV_PROBLEM_RCA_STATUS_C" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_LOV_PROBLEM_RCA_STATUS_C" a130
on (a14.PROBLEM_RCA_STATUS_SRC_C_KEY = a130.ROW_KEY)
union
select 'ldb."D_PROBLEM_SCAFE_CORE_REALM_C" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_SCAFE_CORE_REALM_C" a131
on (a14.PROBLEM_SCAFE_CORE_REALM_C_KEY = a131.ROW_KEY)
union
select 'ldb."D_LOV_PROBLEM_SERVICE_CATEGORY_C" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_LOV_PROBLEM_SERVICE_CATEGORY_C" a132
on (a14.PROBLEM_SERVICE_CATEGORY_SRC_C_KEY = a132.ROW_KEY)
union
select 'ldb."D_PROBLEM_SUB_CATEGORY_C" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_SUB_CATEGORY_C" a133
on (a14.PROBLEM_SUBCATEGORY_SRC_C_KEY = a133.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNED_TO_LOCATION" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNED_TO_LOCATION" a134
on (a16.LOCATION_KEY = a134.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_MANAGER" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_MANAGER" a135
on (a17.MANAGER_KEY = a135.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE_CRITICALITY" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESS_SERVICE_CRITICALITY" a136
on (a18.CRITICALITY_KEY = a136.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_PROBLEM_SERVICE_OWNED_BY_C" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_PROBLEM_SERVICE_OWNED_BY_C" a137
on (a18.PROBLEM_SERVICE_OWNED_BY_C_KEY = a137.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE_USED_FOR" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a18
on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESS_SERVICE_USED_FOR" a138
on (a18.USED_FOR_SRC_KEY = a138.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_YEAR" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a19
on (a11.PROBLEM_DATE_KEY = a19.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_YEAR" a139
on (a111.year_start_date_key = a139.ROW_KEY)
union
select 'ldb."D_GBL_PROBLEM_DIRECTOR_NAME_C" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY) join "ldb"."D_PROBLEM_GBL_C" a114
on (a16.PROBLEM_GBL_C_KEY = a114.ROW_KEY)
join "ldb"."D_GBL_PROBLEM_DIRECTOR_NAME_C" a140
on (a114.PROBLEM_DIRECTOR_NAME_C_KEY = a140.ROW_KEY)
union
select 'ldb."D_GBL_PROBLEM_SR_VICE_PRESIDENT_NAME_C" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY) join "ldb"."D_PROBLEM_GBL_C" a114
on (a16.PROBLEM_GBL_C_KEY = a114.ROW_KEY)
join "ldb"."D_GBL_PROBLEM_SR_VICE_PRESIDENT_NAME_C" a141
on (a114.PROBLEM_SR_VICE_PRESIDENT_NAME_C_KEY = a141.ROW_KEY)
union
select 'ldb."D_GBL_PROBLEM_SR_DIRECTOR_NAME_C" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY) join "ldb"."D_PROBLEM_GBL_C" a114
on (a16.PROBLEM_GBL_C_KEY = a114.ROW_KEY)
join "ldb"."D_GBL_PROBLEM_SR_DIRECTOR_NAME_C" a142
on (a114.PROBLEM_SR_DIRECTOR_NAME_C_KEY = a142.ROW_KEY)
union
select 'ldb."D_GBL_PROBLEM_VICE_PRESIDENT_NAME_C" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.PROBLEM_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY) join "ldb"."D_PROBLEM_GBL_C" a114
on (a16.PROBLEM_GBL_C_KEY = a114.ROW_KEY)
join "ldb"."D_GBL_PROBLEM_VICE_PRESIDENT_NAME_C" a143
on (a114.PROBLEM_VICE_PRESIDENT_NAME_C_KEY = a143.ROW_KEY)