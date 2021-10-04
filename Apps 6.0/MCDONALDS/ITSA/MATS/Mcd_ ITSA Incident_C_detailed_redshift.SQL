select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 union
select 'ldb."D_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
	on (a11.INCIDENT_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_DATE" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_CALENDAR_DATE" a13 
	on (a11.DATE_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_MONTH" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_CALENDAR_DATE" a13 
 on (a11.DATE_KEY = a13.ROW_KEY) 
	join "ldb"."D_CALENDAR_MONTH" a14 
	on (a13.month_start_date_key = a14.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_QUARTER" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_CALENDAR_DATE" a13 
 on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."D_CALENDAR_MONTH" a14 
 on (a13.month_start_date_key = a14.ROW_KEY) 
	join "ldb"."D_CALENDAR_QUARTER" a15 
	on (a14.quarter_start_date_key = a15.ROW_KEY)  
 union
select 'ldb."D_BUSINESS_SERVICE" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_BUSINESS_SERVICE" a16 
	on (a11.BUSINESS_SERVICE_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_TIME" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_TIME" a17 
	on (a11.INCIDENT_TIME_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_EMPLOYEE" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a18 
	on (a11.INCIDENT_EMPLOYEE_KEY = a18.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_APPLICATION" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_APPLICATION" a19 
	on (a12.APPLICATION_KEY = a19.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNED_TO" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
	on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a111 
	on (a12.ASSIGNMENT_GROUP_KEY = a111.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112 
	on (a12.BUSINESS_SERVICE_KEY = a112.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DATE" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a113 
	on (a11.INCIDENT_DATE_KEY = a113.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_MONTH" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a113 
 on (a11.INCIDENT_DATE_KEY = a113.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_MONTH" a114 
	on (a113.month_start_date_key = a114.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_QUARTER" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a113 
 on (a11.INCIDENT_DATE_KEY = a113.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a114 
 on (a113.month_start_date_key = a114.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a115 
	on (a114.quarter_start_date_key = a115.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_RFC" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_RFC" a116 
	on (a12.CHANGE_REQUEST_KEY = a116.ROW_KEY)  
 union
select 'ldb."D_CONFIGURATION_ITEM_INCIDENT" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a117 
	on (a12.CONFIGURATION_ITEM_KEY = a117.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a117 
 on (a12.CONFIGURATION_ITEM_KEY = a117.ROW_KEY) 
	join "ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM" a118 
	on (a117.MDM_KEY = a118.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CUSTOMER" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_CUSTOMER" a119 
	on (a12.CUSTOMER_KEY = a119.ROW_KEY)  
 union
select 'ldb."D_GBL_C" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
 on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY) 
	join "ldb"."D_GBL_C" a120 
	on (a110.GBL_C_KEY = a120.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_WEEK" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a113 
 on (a11.INCIDENT_DATE_KEY = a113.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_WEEK" a121 
	on (a113.week_start_date_key = a121.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_YEAR" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a113 
 on (a11.INCIDENT_DATE_KEY = a113.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a114 
 on (a113.month_start_date_key = a114.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a115 
 on (a114.quarter_start_date_key = a115.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_YEAR" a122 
	on (a115.year_start_date_key = a122.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PRIORITY" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_PRIORITY" a123 
	on (a12.PRIORITY_SRC_KEY = a123.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PROBLEM" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_PROBLEM" a124 
	on (a12.PROBLEM_KEY = a124.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_OPENED_BY" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_OPENED_BY" a125 
	on (a12.OPENED_BY_KEY = a125.ROW_KEY)  
 union
select 'ldb."D_PARENT_INCIDENT" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_PARENT_INCIDENT" a126 
	on (a12.PARENT_INCIDENT_KEY = a126.ROW_KEY)  
 union
select 'ldb."D_CALENDAR_YEAR" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_CALENDAR_DATE" a13 
 on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."D_CALENDAR_MONTH" a14 
 on (a13.month_start_date_key = a14.ROW_KEY) join "ldb"."D_CALENDAR_QUARTER" a15 
 on (a14.quarter_start_date_key = a15.ROW_KEY) 
	join "ldb"."D_CALENDAR_YEAR" a127 
	on (a15.year_start_date_key = a127.ROW_KEY)  
 union
select 'ldb."D_LOV_SERVICE_ACCESS_C" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_BUSINESS_SERVICE" a16 
 on (a11.BUSINESS_SERVICE_KEY = a16.ROW_KEY) 
	join "ldb"."D_LOV_SERVICE_ACCESS_C" a128 
	on (a16.SERVICE_ACCESS_C_KEY = a128.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_HOUR" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_TIME" a17 
 on (a11.INCIDENT_TIME_KEY = a17.ROW_KEY) 
	join "ldb"."D_INCIDENT_CALENDAR_HOUR" a129 
	on (a17.hour_key = a129.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CAUSED_BY_CHANGE" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_CAUSED_BY_CHANGE" a130 
	on (a11.INCIDENT_CAUSED_BY_CHANGE_KEY = a130.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CONTACTTYPE" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_CONTACTTYPE" a131 
	on (a11.REPORTED_TYPE_SRC_KEY = a131.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DEPARTMENT" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a18 
 on (a11.INCIDENT_EMPLOYEE_KEY = a18.ROW_KEY) 
	join "ldb"."D_INCIDENT_DEPARTMENT" a132 
	on (a18.DEPARTMENT_KEY = a132.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_EMPLOYEE_MDM" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a18 
 on (a11.INCIDENT_EMPLOYEE_KEY = a18.ROW_KEY) 
	join "ldb"."D_INCIDENT_EMPLOYEE_MDM" a133 
	on (a18.EMPLOYEE_MDM_KEY = a133.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_IMPACT" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_IMPACT" a134 
	on (a11.IMPACT_SRC_KEY = a134.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_URGENCY" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_URGENCY" a135 
	on (a11.URGENCY_SRC_KEY = a135.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_APPLICATION_MDM" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_APPLICATION" a19 
 on (a12.APPLICATION_KEY = a19.ROW_KEY) 
	join "ldb"."D_INCIDENT_APPLICATION_MDM" a136 
	on (a19.MDM_KEY = a136.ROW_KEY)  
 union
select 'ldb."D_BUSINESSUNIT_CUSTOM_C" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_BUSINESSUNIT_CUSTOM_C" a137 
	on (a12.BUSINESSUNIT_CUSTOM_C_KEY = a137.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CATEGORY" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_CATEGORY" a138 
	on (a12.CATEGORY_SRC_KEY = a138.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CLOSE_CODE" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_CLOSE_CODE" a139 
	on (a12.CLOSE_CODE_SRC_KEY = a139.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CLOSED_BY" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_CLOSED_BY" a140 
	on (a12.CLOSED_BY_KEY = a140.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_COMPANY" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_COMPANY" a141 
	on (a12.COMPANY_KEY = a141.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CUSTOMER_MDM" a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_CUSTOMER" a119 
 on (a12.CUSTOMER_KEY = a119.ROW_KEY) 
	join "ldb"."D_INCIDENT_CUSTOMER_MDM" a142 
	on (a119.customer_mdm_key = a142.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DOMAIN" a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_DOMAIN" a143 
	on (a12.DOMAIN_KEY = a143.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_LEGACY_CI_NAME_C" a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_LEGACY_CI_NAME_C" a144 
	on (a12.INCIDENT_LEGACY_CONFIGURATION_ITEM_C_KEY = a144.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_LOCATION" a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_LOCATION" a145 
	on (a12.LOCATION_KEY = a145.ROW_KEY)  
 union
select 'ldb."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a146 
	on (a12.INCIDENT_NEVA_SUBCATEGORY_C_KEY = a146.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_OPENED_BY_C" a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INTERNAL_CONTACT_OPENED_BY_C" a147 
	on (a12.INCIDENT_OPENED_BY_C_KEY = a147.ROW_KEY)  
 union
select 'ldb."D_REQUEST_ITEM_ORIGINAL_C" a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_REQUEST_ITEM_ORIGINAL_C" a148 
	on (a12.INCIDENT_ORIGINAL_REQUEST_ITEM_C_KEY = a148.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_PENDING_REASON_C" a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_LOV_INCIDENT_PENDING_REASON_C" a149 
	on (a12.INCIDENT_PENDING_REASON_C_KEY = a149.ROW_KEY)  
 union
select 'ldb."D_SCAFE_CORE_REALM_C" a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_SCAFE_CORE_REALM_C" a150 
	on (a12.SCAFE_CORE_REALM_C_KEY = a150.ROW_KEY)  
 union
select 'ldb."D_TASK_SLA_RESOLUTION_FLAG" a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_TASK_SLA_RESOLUTION_FLAG" a151 
	on (a12.MET_RESOLUTION_SLA_FLAG_KEY = a151.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_RESOLVED_BY" a152 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_RESOLVED_BY" a152 
	on (a12.RESOLVED_BY_KEY = a152.ROW_KEY)  
 union
select 'ldb."D_TASK_SLA_RESPONSE_FLAG" a153 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_TASK_SLA_RESPONSE_FLAG" a153 
	on (a12.MET_RESPONSE_SLA_FLAG_KEY = a153.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SEVERITY" a154 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_SEVERITY" a154 
	on (a12.SEVERITY_SRC_KEY = a154.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_SITUATION_C" a155 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_LOV_INCIDENT_SITUATION_C" a155 
	on (a12.INCIDENT_SITUATION_C_KEY = a155.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_STATE" a156 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_STATE" a156 
	on (a12.STATE_SRC_KEY = a156.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SUBCATEGORY" a157 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_SUBCATEGORY" a157 
	on (a12.SUB_CATEGORY_SRC_KEY = a157.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_TYPE_C" a158 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_LOV_INCIDENT_TYPE_C" a158 
	on (a12.INCIDENT_TYPE_C_KEY = a158.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_WORKPLACE_LOCATION_C" a159 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_WORKPLACE_LOCATION_C" a159 
	on (a12.INCIDENT_INTEGRATION_SRMS_LOCATION_C_KEY = a159.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_U_SUBCATEGORY_C" a160 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
	join "ldb"."D_INCIDENT_U_SUBCATEGORY_C" a160 
	on (a12.INCIDENT_SUBCATEGORY_DIM_C_KEY = a160.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a161 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a111 
 on (a12.ASSIGNMENT_GROUP_KEY = a111.ROW_KEY) 
	join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a161 
	on (a111.MANAGER_KEY = a161.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a162 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112 
 on (a12.BUSINESS_SERVICE_KEY = a112.ROW_KEY) 
	join "ldb"."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a162 
	on (a112.CRITICALITY_KEY = a162.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a163 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112 
 on (a12.BUSINESS_SERVICE_KEY = a112.ROW_KEY) 
	join "ldb"."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a163 
	on (a112.SERVICE_OWNED_BY_C_KEY = a163.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a164 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a112 
 on (a12.BUSINESS_SERVICE_KEY = a112.ROW_KEY) 
	join "ldb"."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a164 
	on (a112.USED_FOR_SRC_KEY = a164.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_VENDOR_C" a165 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a111 
 on (a12.ASSIGNMENT_GROUP_KEY = a111.ROW_KEY) 
	join "ldb"."D_INTERNAL_ORGANIZATION_VENDOR_C" a165 
	on (a111.VENDOR_C_KEY = a165.ROW_KEY)  
 union
select 'ldb."D_GBL_DIRECTOR_NAME_C" a166 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
 on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY) join "ldb"."D_GBL_C" a120 
 on (a110.GBL_C_KEY = a120.ROW_KEY) 
	join "ldb"."D_GBL_DIRECTOR_NAME_C" a166 
	on (a120.DIRECTOR_NAME_C_KEY = a166.ROW_KEY)  
 union
select 'ldb."D_GBL_SR_VICE_PRESIDENT_NAME_C" a167 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
 on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY) join "ldb"."D_GBL_C" a120 
 on (a110.GBL_C_KEY = a120.ROW_KEY) 
	join "ldb"."D_GBL_SR_VICE_PRESIDENT_NAME_C" a167 
	on (a120.SR_VICE_PRESIDENT_NAME_C_KEY = a167.ROW_KEY)  
 union
select 'ldb."D_GBL_SR_DIRECTOR_NAME_C" a168 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
 on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY) join "ldb"."D_GBL_C" a120 
 on (a110.GBL_C_KEY = a120.ROW_KEY) 
	join "ldb"."D_GBL_SR_DIRECTOR_NAME_C" a168 
	on (a120.SR_DIRECTOR_NAME_C_KEY = a168.ROW_KEY)  
 union
select 'ldb."D_GBL_VICE_PRESIDENT_NAME_C" a169 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a110 
 on (a12.ASSIGNED_TO_KEY = a110.ROW_KEY) join "ldb"."D_GBL_C" a120 
 on (a110.GBL_C_KEY = a120.ROW_KEY) 
	join "ldb"."D_GBL_VICE_PRESIDENT_NAME_C" a169 
	on (a120.VICE_PRESIDENT_NAME_C_KEY = a169.ROW_KEY) 

