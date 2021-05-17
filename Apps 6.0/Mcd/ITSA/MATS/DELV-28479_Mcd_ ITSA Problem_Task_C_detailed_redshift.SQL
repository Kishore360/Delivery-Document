select 'ldb."F_PROBLEM_TASK" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
union
select 'ldb."D_PROBLEM_TASK_EMPLOYEE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_EMPLOYEE" a12
on (a11.PROBLEM_TASK_EMPLOYEE_KEY = a12.ROW_KEY)
union
select 'ldb."D_PROBLEM" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM" a13
on (a11.PROBLEM_KEY = a13.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_APPLICATION" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_ASSIGNED_TO" a16
on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_DATE" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_DATE" a18
on (a11.PROBLEM_TASK_DATE_KEY = a18.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_CONFIGURATION_ITEM" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_CONFIGURATION_ITEM" a19
on (a14.CONFIGURATION_ITEM_KEY = a19.ROW_KEY)
union
select 'ldb."D_PROBLEM_PRIORITY" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_PRIORITY" a110
on (a11.PROBLEM_PRIORITY_SRC_KEY = a110.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_APPROVAL" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_APPROVAL" a111
on (a11.APPROVAL_SRC_KEY = a111.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_REPORTED_TYPE" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_REPORTED_TYPE" a112
on (a11.REPORTED_TYPE_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_EMPLOYEE_MDM" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_EMPLOYEE" a12
on (a11.PROBLEM_TASK_EMPLOYEE_KEY = a12.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_EMPLOYEE_MDM" a113
on (a12.EMPLOYEE_MDM_KEY = a113.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_IMPACT" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_IMPACT" a114
on (a11.IMPACT_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_PRIORITY" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_PRIORITY" a115
on (a11.PRIORITY_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_STATE" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_STATE" a116
on (a11.STATE_SRC_KEY = a116.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_URGENCY" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_URGENCY" a117
on (a11.URGENCY_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."D_PROBLEM_ASSIGNMENT_GROUP" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_ASSIGNMENT_GROUP" a118
on (a11.PROBLEM_ASSIGNMENT_GROUP_KEY = a118.ROW_KEY)
union
select 'ldb."D_PROBLEM_STATE" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_STATE" a119
on (a11.PROBLEM_STATE_SRC_KEY = a119.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_APPLICATION_MDM" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_TASK_APPLICATION" a15
on (a14.APPLICATION_KEY = a15.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_APPLICATION_MDM" a120
on (a15.MDM_KEY = a120.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_BUSINESS_SERVICE" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_BUSINESS_SERVICE" a121
on (a14.BUSINESS_SERVICE_KEY = a121.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_CALENDAR_MONTH" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK_DATE" a18
on (a11.PROBLEM_TASK_DATE_KEY = a18.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_CALENDAR_MONTH" a122
on (a18.month_start_date_key = a122.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_CONFIGURATION_ITEM_MDM" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_TASK_CONFIGURATION_ITEM" a19
on (a14.CONFIGURATION_ITEM_KEY = a19.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_CONFIGURATION_ITEM_MDM" a123
on (a19.MDM_KEY = a123.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_LOCATION" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_LOCATION" a124
on (a14.LOCATION_KEY = a124.ROW_KEY)
union
select 'ldb."D_PROBLEM_TASK_ASSIGNMENT_GROUP_MANAGER" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_PROBLEM_TASK" a11
join "ldb"."D_PROBLEM_TASK" a14
on (a11.PROBLEM_TASK_KEY = a14.ROW_KEY) join "ldb"."D_PROBLEM_TASK_ASSIGNMENT_GROUP" a17
on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_PROBLEM_TASK_ASSIGNMENT_GROUP_MANAGER" a125
on (a17.MANAGER_KEY = a125.ROW_KEY)