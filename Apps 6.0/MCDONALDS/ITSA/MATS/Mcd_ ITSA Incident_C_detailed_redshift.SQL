select 'ldb."F_INCIDENT" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 union
select 'ldb."D_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_BUSINESS_SERVICE" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_BUSINESS_SERVICE" a13 
 on (a11.BUSINESS_SERVICE_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_TIME" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_TIME" a14 
 on (a11.INCIDENT_TIME_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_EMPLOYEE" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a15 
 on (a11.INCIDENT_EMPLOYEE_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_APPLICATION" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_APPLICATION" a16 
 on (a12.APPLICATION_KEY = a16.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNED_TO" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a18 
 on (a12.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a19 
 on (a12.BUSINESS_SERVICE_KEY = a19.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DATE" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a110 
 on (a11.INCIDENT_DATE_KEY = a110.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_MONTH" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a110 
 on (a11.INCIDENT_DATE_KEY = a110.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_MONTH" a111 
 on (a110.month_start_date_key = a111.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_QUARTER" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a110 
 on (a11.INCIDENT_DATE_KEY = a110.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a111 
 on (a110.month_start_date_key = a111.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a112 
 on (a111.quarter_start_date_key = a112.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_RFC" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_RFC" a113 
 on (a12.CHANGE_REQUEST_KEY = a113.ROW_KEY)  
 union
select 'ldb."D_CONFIGURATION_ITEM_INCIDENT" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a114 
 on (a12.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a114 
 on (a12.CONFIGURATION_ITEM_KEY = a114.ROW_KEY) 
join "ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM" a115 
 on (a114.MDM_KEY = a115.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CUSTOMER" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CUSTOMER" a116 
 on (a12.CUSTOMER_KEY = a116.ROW_KEY)  
 union
select 'ldb."D_GBL_C" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY) 
join "ldb"."D_GBL_C" a117 
 on (a17.GBL_C_KEY = a117.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_WEEK" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a110 
 on (a11.INCIDENT_DATE_KEY = a110.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_WEEK" a118 
 on (a110.week_start_date_key = a118.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_YEAR" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_DATE" a110 
 on (a11.INCIDENT_DATE_KEY = a110.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_MONTH" a111 
 on (a110.month_start_date_key = a111.ROW_KEY) join "ldb"."D_INCIDENT_CALENDAR_QUARTER" a112 
 on (a111.quarter_start_date_key = a112.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_YEAR" a119 
 on (a112.year_start_date_key = a119.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PRIORITY" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_PRIORITY" a120 
 on (a12.PRIORITY_SRC_KEY = a120.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_PROBLEM" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_PROBLEM" a121 
 on (a12.PROBLEM_KEY = a121.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_OPENED_BY" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_OPENED_BY" a122 
 on (a12.OPENED_BY_KEY = a122.ROW_KEY)  
 union
select 'ldb."D_PARENT_INCIDENT" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_PARENT_INCIDENT" a123 
 on (a12.PARENT_INCIDENT_KEY = a123.ROW_KEY)  
 union
select 'ldb."D_LOV_SERVICE_ACCESS_C" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_BUSINESS_SERVICE" a13 
 on (a11.BUSINESS_SERVICE_KEY = a13.ROW_KEY) 
join "ldb"."D_LOV_SERVICE_ACCESS_C" a124 
 on (a13.SERVICE_ACCESS_C_KEY = a124.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CALENDAR_HOUR" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_TIME" a14 
 on (a11.INCIDENT_TIME_KEY = a14.ROW_KEY) 
join "ldb"."D_INCIDENT_CALENDAR_HOUR" a125 
 on (a14.hour_key = a125.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CAUSED_BY_CHANGE" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_CAUSED_BY_CHANGE" a126 
 on (a11.INCIDENT_CAUSED_BY_CHANGE_KEY = a126.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CONTACTTYPE" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_CONTACTTYPE" a127 
 on (a11.REPORTED_TYPE_SRC_KEY = a127.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DEPARTMENT" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a15 
 on (a11.INCIDENT_EMPLOYEE_KEY = a15.ROW_KEY) 
join "ldb"."D_INCIDENT_DEPARTMENT" a128 
 on (a15.DEPARTMENT_KEY = a128.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_EMPLOYEE_MDM" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_EMPLOYEE" a15 
 on (a11.INCIDENT_EMPLOYEE_KEY = a15.ROW_KEY) 
join "ldb"."D_INCIDENT_EMPLOYEE_MDM" a129 
 on (a15.EMPLOYEE_MDM_KEY = a129.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_IMPACT" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_IMPACT" a130 
 on (a11.IMPACT_SRC_KEY = a130.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_URGENCY" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT_URGENCY" a131 
 on (a11.URGENCY_SRC_KEY = a131.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_APPLICATION_MDM" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_APPLICATION" a16 
 on (a12.APPLICATION_KEY = a16.ROW_KEY) 
join "ldb"."D_INCIDENT_APPLICATION_MDM" a132 
 on (a16.MDM_KEY = a132.ROW_KEY)  
 union
select 'ldb."D_BUSINESSUNIT_CUSTOM_C" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_BUSINESSUNIT_CUSTOM_C" a133 
 on (a12.BUSINESSUNIT_CUSTOM_C_KEY = a133.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CATEGORY" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CATEGORY" a134 
 on (a12.CATEGORY_SRC_KEY = a134.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CLOSE_CODE" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CLOSE_CODE" a135 
 on (a12.CLOSE_CODE_SRC_KEY = a135.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CLOSED_BY" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_CLOSED_BY" a136 
 on (a12.CLOSED_BY_KEY = a136.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_COMPANY" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_COMPANY" a137 
 on (a12.COMPANY_KEY = a137.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_CUSTOMER_MDM" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_CUSTOMER" a116 
 on (a12.CUSTOMER_KEY = a116.ROW_KEY) 
join "ldb"."D_INCIDENT_CUSTOMER_MDM" a138 
 on (a116.customer_mdm_key = a138.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_DOMAIN" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_DOMAIN" a139 
 on (a12.DOMAIN_KEY = a139.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_LEGACY_CI_NAME_C" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_LEGACY_CI_NAME_C" a140 
 on (a12.INCIDENT_LEGACY_CONFIGURATION_ITEM_C_KEY = a140.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_LOCATION" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_LOCATION" a141 
 on (a12.LOCATION_KEY = a141.ROW_KEY)  
 union
select 'ldb."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a142 
 on (a12.INCIDENT_NEVA_SUBCATEGORY_C_KEY = a142.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_OPENED_BY_C" a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INTERNAL_CONTACT_OPENED_BY_C" a143 
 on (a12.INCIDENT_OPENED_BY_C_KEY = a143.ROW_KEY)  
 union
select 'ldb."D_REQUEST_ITEM_ORIGINAL_C" a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_REQUEST_ITEM_ORIGINAL_C" a144 
 on (a12.INCIDENT_ORIGINAL_REQUEST_ITEM_C_KEY = a144.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_PENDING_REASON_C" a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_LOV_INCIDENT_PENDING_REASON_C" a145 
 on (a12.INCIDENT_PENDING_REASON_C_KEY = a145.ROW_KEY)  
 union
select 'ldb."D_SCAFE_CORE_REALM_C" a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_SCAFE_CORE_REALM_C" a146 
 on (a12.SCAFE_CORE_REALM_C_KEY = a146.ROW_KEY)  
 union
select 'ldb."D_TASK_SLA_RESOLUTION_FLAG" a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_TASK_SLA_RESOLUTION_FLAG" a147 
 on (a12.MET_RESOLUTION_SLA_FLAG_KEY = a147.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_RESOLVED_BY" a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_RESOLVED_BY" a148 
 on (a12.RESOLVED_BY_KEY = a148.ROW_KEY)  
 union
select 'ldb."D_TASK_SLA_RESPONSE_FLAG" a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_TASK_SLA_RESPONSE_FLAG" a149 
 on (a12.MET_RESPONSE_SLA_FLAG_KEY = a149.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SEVERITY" a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_SEVERITY" a150 
 on (a12.SEVERITY_SRC_KEY = a150.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_SITUATION_C" a151 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_LOV_INCIDENT_SITUATION_C" a151 
 on (a12.INCIDENT_SITUATION_C_KEY = a151.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_STATE" a152 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_STATE" a152 
 on (a12.STATE_SRC_KEY = a152.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_SUBCATEGORY" a153 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_SUBCATEGORY" a153 
 on (a12.SUB_CATEGORY_SRC_KEY = a153.ROW_KEY)  
 union
select 'ldb."D_LOV_INCIDENT_TYPE_C" a154 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_LOV_INCIDENT_TYPE_C" a154 
 on (a12.INCIDENT_TYPE_C_KEY = a154.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_WORKPLACE_LOCATION_C" a155 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_WORKPLACE_LOCATION_C" a155 
 on (a12.INCIDENT_INTEGRATION_SRMS_LOCATION_C_KEY = a155.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_U_SUBCATEGORY_C" a156 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_U_SUBCATEGORY_C" a156 
 on (a12.INCIDENT_SUBCATEGORY_DIM_C_KEY = a156.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a157 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a18 
 on (a12.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY) 
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a157 
 on (a18.MANAGER_KEY = a157.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a158 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a19 
 on (a12.BUSINESS_SERVICE_KEY = a19.ROW_KEY) 
join "ldb"."D_INCIDENT_BUSINESS_SERVICE_CRITICALITY" a158 
 on (a19.CRITICALITY_KEY = a158.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a159 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a19 
 on (a12.BUSINESS_SERVICE_KEY = a19.ROW_KEY) 
join "ldb"."D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C" a159 
 on (a19.SERVICE_OWNED_BY_C_KEY = a159.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a160 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_BUSINESS_SERVICE" a19 
 on (a12.BUSINESS_SERVICE_KEY = a19.ROW_KEY) 
join "ldb"."D_INCIDENT_BUSINESS_SERVICE_USED_FOR" a160 
 on (a19.USED_FOR_SRC_KEY = a160.ROW_KEY)  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_VENDOR_C" a161 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a18 
 on (a12.ASSIGNMENT_GROUP_KEY = a18.ROW_KEY) 
join "ldb"."D_INTERNAL_ORGANIZATION_VENDOR_C" a161 
 on (a18.VENDOR_C_KEY = a161.ROW_KEY)  
 union
select 'ldb."D_GBL_DIRECTOR_NAME_C" a162 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY) join "ldb"."D_GBL_C" a117 
 on (a17.GBL_C_KEY = a117.ROW_KEY) 
join "ldb"."D_GBL_DIRECTOR_NAME_C" a162 
 on (a117.DIRECTOR_NAME_C_KEY = a162.ROW_KEY)  
 union
select 'ldb."D_GBL_SR_VICE_PRESIDENT_NAME_C" a163 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY) join "ldb"."D_GBL_C" a117 
 on (a17.GBL_C_KEY = a117.ROW_KEY) 
join "ldb"."D_GBL_SR_VICE_PRESIDENT_NAME_C" a163 
 on (a117.SR_VICE_PRESIDENT_NAME_C_KEY = a163.ROW_KEY)  
 union
select 'ldb."D_GBL_SR_DIRECTOR_NAME_C" a164 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY) join "ldb"."D_GBL_C" a117 
 on (a17.GBL_C_KEY = a117.ROW_KEY) 
join "ldb"."D_GBL_SR_DIRECTOR_NAME_C" a164 
 on (a117.SR_DIRECTOR_NAME_C_KEY = a164.ROW_KEY)  
 union
select 'ldb."D_GBL_VICE_PRESIDENT_NAME_C" a165 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT" a11 
 join "ldb"."D_INCIDENT" a12 
 on (a11.INCIDENT_KEY = a12.ROW_KEY) join "ldb"."D_INCIDENT_ASSIGNED_TO" a17 
 on (a12.ASSIGNED_TO_KEY = a17.ROW_KEY) join "ldb"."D_GBL_C" a117 
 on (a17.GBL_C_KEY = a117.ROW_KEY) 
join "ldb"."D_GBL_VICE_PRESIDENT_NAME_C" a165 
 on (a117.VICE_PRESIDENT_NAME_C_KEY = a165.ROW_KEY)  

