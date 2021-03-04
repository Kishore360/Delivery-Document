select 'ldb."F_PROBLEM" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
union
select 'ldb."D_PROBLEM_TIME" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_TIME" a12
on (a11.problem_time_key = a12.ROW_KEY)
union
select 'ldb."D_PROBLEM_EMPLOYEE" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.problem_employee_key = a13.ROW_KEY)
union
select 'ldb."D_PROBLEM" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
union
select 'ldb."D_PROBLEM_APPLICATION" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
union
select 'ldb."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."D_H_PROBLEM_ASSIGNMENT_GROUP" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_H_PROBLEM_ASSIGNMENT_GROUP" a18
on (a17.group_hierarchy_key = a18.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a19
on (a14.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
union
select 'ldb."D_PROBLEM_DATE" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a110
on (a11.problem_date_key = a110.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_MONTH" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a110
on (a11.problem_date_key = a110.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_MONTH" a111
on (a110.month_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_QUARTER" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a110
on (a11.problem_date_key = a110.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_MONTH" a111
on (a110.month_start_date_key = a111.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_QUARTER" a112
on (a111.quarter_start_date_key = a112.ROW_KEY)
union
select 'ldb."D_PROBLEM_CLOSED_BY" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CLOSED_BY" a113
on (a14.CLOSED_BY_KEY = a113.ROW_KEY)
union
select 'ldb."D_PROBLEM_CONFIGURATION_ITEM" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CONFIGURATION_ITEM" a114
on (a14.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
union
select 'ldb."D_PROBLEM_CONFIGURATION_ITEM_MDM" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_CONFIGURATION_ITEM" a114
on (a14.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
join "ldb"."D_PROBLEM_CONFIGURATION_ITEM_MDM" a115
on (a114.MDM_KEY = a115.ROW_KEY)
union
select 'ldb."D_PROBLEM_OPENED_BY_C" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_OPENED_BY_C" a116
on (a14.PROBLEM_OPENED_BY_C_KEY = a116.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_HOUR" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_TIME" a12
on (a11.problem_time_key = a12.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_HOUR" a117
on (a12.hour_key = a117.ROW_KEY)
union
select 'ldb."D_PROBLEM_REPORTED_TYPE" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_REPORTED_TYPE" a118
on (a11.reported_type_src_key = a118.ROW_KEY)
union
select 'ldb."D_PROBLEM_DEPARTMENT" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.problem_employee_key = a13.ROW_KEY)
join "ldb"."D_PROBLEM_DEPARTMENT" a119
on (a13.DEPARTMENT_KEY = a119.ROW_KEY)
union
select 'ldb."D_PROBLEM_EMPLOYEE_MDM" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_EMPLOYEE" a13
on (a11.problem_employee_key = a13.ROW_KEY)
join "ldb"."D_PROBLEM_EMPLOYEE_MDM" a120
on (a13.employee_mdm_key = a120.ROW_KEY)
union
select 'ldb."D_PROBLEM_IMPACT" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_IMPACT" a121
on (a11.IMPACT_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."D_PROBLEM_PRIORITY" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_PRIORITY" a122
on (a11.PRIORITY_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."D_PROBLEM_URGENCY" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_URGENCY" a123
on (a11.urgency_src_key = a123.ROW_KEY)
union
select 'ldb."D_PROBLEM_APPLICATION_MDM" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
join "ldb"."D_PROBLEM_APPLICATION_MDM" a124
on (a15.MDM_KEY = a124.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_WEEK" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a110
on (a11.problem_date_key = a110.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_WEEK" a125
on (a110.week_start_date_key = a125.ROW_KEY)
union
select 'ldb."D_PROBLEM_CHANGE" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_CHANGE" a126
on (a14.CHANGE_KEY = a126.ROW_KEY)
union
select 'ldb."D_PROBLEM_LOCATION" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_LOCATION" a127
on (a14.LOCATION_KEY = a127.ROW_KEY)
union
select 'ldb."D_PROBLEM_STATE" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY)
join "ldb"."D_PROBLEM_STATE" a128
on (a14.STATE_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNED_TO_LOCATION" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNED_TO_LOCATION" a129
on (a16.LOCATION_KEY = a129.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_1" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY) join "ldb"."D_H_PROBLEM_ASSIGNMENT_GROUP" a18
on (a17.group_hierarchy_key = a18.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_1" a130
on (a18.group_level_1_key = a130.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_2" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY) join "ldb"."D_H_PROBLEM_ASSIGNMENT_GROUP" a18
on (a17.group_hierarchy_key = a18.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_2" a131
on (a18.group_level_2_key = a131.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_3" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY) join "ldb"."D_H_PROBLEM_ASSIGNMENT_GROUP" a18
on (a17.group_hierarchy_key = a18.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_3" a132
on (a18.group_level_3_key = a132.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_4" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY) join "ldb"."D_H_PROBLEM_ASSIGNMENT_GROUP" a18
on (a17.group_hierarchy_key = a18.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_LEVEL_4" a133
on (a18.group_level_4_key = a133.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP_MANAGER" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP_MANAGER" a134
on (a17.manager_key = a134.ROW_KEY)
union
select 'ldb."d_problem_business_service_criticality" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a19
on (a14.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
join "ldb"."d_problem_business_service_criticality" a135
on (a19.CRITICALITY_KEY = a135.ROW_KEY)
union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE_USED_FOR" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_BUSINESS_SERVICE" a19
on (a14.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
join "ldb"."D_PROBLEM_BUSINESS_SERVICE_USED_FOR" a136
on (a19.used_for_src_key = a136.ROW_KEY)
union
select 'ldb."D_PROBLEM_CLOSED_BY_DEPARTMENT_C" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_CLOSED_BY" a113
on (a14.CLOSED_BY_KEY = a113.ROW_KEY)
join "ldb"."D_PROBLEM_CLOSED_BY_DEPARTMENT_C" a137
on (a113.PROBLEM_CLOSED_BY_DEPARTMENT_C_KEY = a137.ROW_KEY)
union
select 'ldb."D_PROBLEM_OPENED_BY_DEPARTMENT_C" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM" a14
on (a11.problem_key = a14.ROW_KEY) join "ldb"."D_PROBLEM_OPENED_BY_C" a116
on (a14.PROBLEM_OPENED_BY_C_KEY = a116.ROW_KEY)
join "ldb"."D_PROBLEM_OPENED_BY_DEPARTMENT_C" a138
on (a116.PROBLEM_OPENED_BY_DEPARTMENT_C_KEY = a138.ROW_KEY)
union
select 'ldb."D_PROBLEM_CALENDAR_YEAR" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM" a11
join "ldb"."D_PROBLEM_DATE" a110
on (a11.problem_date_key = a110.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_MONTH" a111
on (a110.month_start_date_key = a111.ROW_KEY) join "ldb"."D_PROBLEM_CALENDAR_QUARTER" a112
on (a111.quarter_start_date_key = a112.ROW_KEY)
join "ldb"."D_PROBLEM_CALENDAR_YEAR" a139
on (a112.year_start_date_key = a139.ROW_KEY)