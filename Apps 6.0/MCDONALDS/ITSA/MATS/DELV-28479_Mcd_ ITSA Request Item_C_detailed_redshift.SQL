select 'ldb."F_REQUEST_ITEM" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
union
select 'ldb."D_CALENDAR_DATE" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_CALENDAR_DATE" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."D_INTERNAL_ORGANIZATION_GROUP" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a13
on (a11.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_EMPLOYEE" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_EMPLOYEE" a14
on (a11.request_item_employee_key = a14.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_ASSIGNED_TO" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_ASSIGNED_TO" a16
on (a15.ASSIGNED_TO_KEY = a16.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_ASSIGNMENT_GROUP" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_ASSIGNMENT_GROUP" a17
on (a15.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a18
on (a15.REQUEST_ITEM_BUSINESS_SERVICE_C_KEY = a18.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_DATE" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_DATE" a19
on (a11.request_item_date_key = a19.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CALENDAR_MONTH" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_DATE" a19
on (a11.request_item_date_key = a19.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CALENDAR_QUARTER" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_DATE" a19
on (a11.request_item_date_key = a19.ROW_KEY) join "ldb"."D_REQUEST_ITEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_MASTER_ITEM" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_MASTER_ITEM" a112
on (a15.CATALOG_ITEM_KEY = a112.ROW_KEY)
union
select 'ldb."D_REQ_ITEM_OPENED_BY" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQ_ITEM_OPENED_BY" a113
on (a15.OPENED_BY_KEY = a113.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_REQUESTED_FOR" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_REQUESTED_FOR" a114
on (a15.REQUESTED_FOR_KEY = a114.ROW_KEY)
union
select 'ldb."D_REQUEST" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST" a115
on (a11.REQUEST_KEY = a115.ROW_KEY)
union
select 'ldb."D_CALENDAR_MONTH" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_CALENDAR_DATE" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."D_CALENDAR_MONTH" a116
on (a12.month_start_date_key = a116.ROW_KEY)
union
select 'ldb."D_SC_REQ_ITEM_APPROVAL" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_SC_REQ_ITEM_APPROVAL" a117
on (a11.APPROVAL_STATE_SRC_KEY = a117.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CONTACTTYPE" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_CONTACTTYPE" a118
on (a11.REPORTED_TYPE_SRC_KEY = a118.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_VENDOR_C" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_INTERNAL_ORGANIZATION_GROUP" a13
on (a11.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_VENDOR_C" a119
on (a13.REQUEST_ITEM_VENDOR_C_KEY = a119.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_DEPARTMENT" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_EMPLOYEE" a14
on (a11.request_item_employee_key = a14.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_DEPARTMENT" a120
on (a14.DEPARTMENT_KEY = a120.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_EMPLOYEE_MDM" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_EMPLOYEE" a14
on (a11.request_item_employee_key = a14.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_EMPLOYEE_MDM" a121
on (a14.EMPLOYEE_MDM_KEY = a121.ROW_KEY)
union
select 'ldb."D_SC_REQ_ITEM_IMPACT" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_SC_REQ_ITEM_IMPACT" a122
on (a11.IMPACT_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."D_SC_REQ_ITEM_PRIORITY" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_SC_REQ_ITEM_PRIORITY" a123
on (a11.PRIORITY_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_STAGE" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_STAGE" a124
on (a11.stage_src_key = a124.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_STATE" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_STATE" a125
on (a11.STATE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."D_SC_REQ_ITEM_URGENCY" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_SC_REQ_ITEM_URGENCY" a126
on (a11.URGENCY_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."D_LOV_REQUEST_ITEM_AFFECTED_ENVIRONMENT_C" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_LOV_REQUEST_ITEM_AFFECTED_ENVIRONMENT_C" a127
on (a15.REQUEST_ITEM_AFFECTED_ENVIRONMENT_SRC_C_KEY = a127.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C" a128
on (a15.REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C_KEY = a128.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CALENDAR_WEEK" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_DATE" a19
on (a11.request_item_date_key = a19.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_CALENDAR_WEEK" a129
on (a19.week_start_date_key = a129.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CLOSED_BY" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_CLOSED_BY" a130
on (a15.CLOSED_BY_KEY = a130.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_HR_CHANGE_CATEGORY" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_HR_CHANGE_CATEGORY" a131
on (a15.HR_CATEGORY_SRC_KEY = a131.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_HR_CHANGE" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_HR_CHANGE" a132
on (a15.HR_CHANGE_KEY = a132.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_LOCATION" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_LOCATION" a133
on (a15.LOCATION_KEY = a133.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_REQUESTER_C" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_REQUESTER_C" a134
on (a15.REQUEST_ITEM_REQUESTER_C_KEY = a134.ROW_KEY)
union
select 'ldb."D_LOV_REQUEST_ITEM_RESOLUTION_CODE_SRC_C" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_LOV_REQUEST_ITEM_RESOLUTION_CODE_SRC_C" a135
on (a15.REQUEST_ITEM_RESOLUTION_CODE_SRC_C_KEY = a135.ROW_KEY)
union
select 'ldb."D_INTERNAL_CONTACT_REQUEST_ITEM_RESOLVED_BY_C" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_INTERNAL_CONTACT_REQUEST_ITEM_RESOLVED_BY_C" a136
on (a15.REQUEST_ITEM_RESOLVED_BY_C_KEY = a136.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_SCAFE_CORE_REALM_C" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_SCAFE_CORE_REALM_C" a137
on (a15.REQUEST_ITEM_SCAFE_CORE_REALM_C_KEY = a137.ROW_KEY)
union
select 'ldb."D_LOV_REQUEST_ITEM_SERVICE_CATEGORY_SRC_C" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_LOV_REQUEST_ITEM_SERVICE_CATEGORY_SRC_C" a138
on (a15.REQUEST_ITEM_SERVICE_CATEGORY_SRC_C_KEY = a138.ROW_KEY)
union
select 'ldb."D_LOV_REQUEST_ITEM_SITUATION_SRC_C" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_LOV_REQUEST_ITEM_SITUATION_SRC_C" a139
on (a15.REQUEST_ITEM_SITUATION_SRC_C_KEY = a139.ROW_KEY)
union
select 'ldb."D_REQUEST_LOCATION" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST" a115
on (a11.REQUEST_KEY = a115.ROW_KEY)
join "ldb"."D_REQUEST_LOCATION" a140
on (a115.LOCATION_KEY = a140.ROW_KEY)
union
select 'ldb."D_LOV_REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY)
join "ldb"."D_LOV_REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C" a141
on (a15.REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C_KEY = a141.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_ASSIGNMENT_GROUP_MANAGER" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQUEST_ITEM_ASSIGNMENT_GROUP" a17
on (a15.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_ASSIGNMENT_GROUP_MANAGER" a142
on (a17.MANAGER_KEY = a142.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_SERVICE_OWNED_BY_C" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a18
on (a15.REQUEST_ITEM_BUSINESS_SERVICE_C_KEY = a18.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_SERVICE_OWNED_BY_C" a143
on (a18.REQ_ITEM_SERVICE_OWNED_BY_C_KEY = a143.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_ITEM_CATEGORY" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQUEST_ITEM_MASTER_ITEM" a112
on (a15.CATALOG_ITEM_KEY = a112.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_ITEM_CATEGORY" a144
on (a112.ITEM_CATEGORY_KEY = a144.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_ITEM_TYPE" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQUEST_ITEM_MASTER_ITEM" a112
on (a15.CATALOG_ITEM_KEY = a112.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_ITEM_TYPE" a145
on (a112.ITEM_TYPE_CODE_KEY = a145.ROW_KEY)
union
select 'ldb."D_REQ_ITEM_OPEN_BY_DEPT" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQ_ITEM_OPENED_BY" a113
on (a15.OPENED_BY_KEY = a113.ROW_KEY)
join "ldb"."D_REQ_ITEM_OPEN_BY_DEPT" a146
on (a113.DEPARTMENT_KEY = a146.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_GBL_C" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQ_ITEM_OPENED_BY" a113
on (a15.OPENED_BY_KEY = a113.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_GBL_C" a147
on (a113.REQUEST_ITEM_GBL_C_KEY = a147.ROW_KEY)
union
select 'ldb."D_REQ_ITEM_OPEN_BY_LOC" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQ_ITEM_OPENED_BY" a113
on (a15.OPENED_BY_KEY = a113.ROW_KEY)
join "ldb"."D_REQ_ITEM_OPEN_BY_LOC" a148
on (a113.LOCATION_KEY = a148.ROW_KEY)
union
select 'ldb."D_REQ_ITEM_REQ_FOR_LOC" a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM" a15
on (a11.request_item_key = a15.ROW_KEY) join "ldb"."D_REQUEST_ITEM_REQUESTED_FOR" a114
on (a15.REQUESTED_FOR_KEY = a114.ROW_KEY)
join "ldb"."D_REQ_ITEM_REQ_FOR_LOC" a149
on (a114.LOCATION_KEY = a149.ROW_KEY)
union
select 'ldb."D_REQUEST_ITEM_CALENDAR_YEAR" a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_REQUEST_ITEM" a11
join "ldb"."D_REQUEST_ITEM_DATE" a19
on (a11.request_item_date_key = a19.ROW_KEY) join "ldb"."D_REQUEST_ITEM_CALENDAR_MONTH" a110
on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."D_REQUEST_ITEM_CALENDAR_QUARTER" a111
on (a110.quarter_start_date_key = a111.ROW_KEY)
join "ldb"."D_REQUEST_ITEM_CALENDAR_YEAR" a150
on (a111.year_start_date_key = a150.ROW_KEY)