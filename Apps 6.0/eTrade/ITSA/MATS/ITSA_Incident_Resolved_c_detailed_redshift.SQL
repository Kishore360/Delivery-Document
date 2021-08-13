select 'ldb."f_incident_resolved" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 union
select 'ldb."d_incident_time" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_time" a12 
	on (a11.incident_time_key = a12.ROW_KEY)  
 union
select 'ldb."d_incident_employee" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_employee" a13 
	on (a11.incident_employee_key = a13.ROW_KEY)  
 union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
	on (a11.INCIDENT_KEY = a14.ROW_KEY)  
 union
select 'ldb."d_incident_application" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_application" a15 
	on (a14.APPLICATION_KEY = a15.ROW_KEY)  
 union
select 'ldb."d_incident_assigned_to" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_assigned_to" a16 
	on (a14.ASSIGNED_TO_KEY = a16.ROW_KEY)  
 union
select 'ldb."d_incident_assignment_group" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_assignment_group" a17 
	on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)  
 union
select 'ldb."d_incident_business_service" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_business_service" a18 
	on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY)  
 union
select 'ldb."d_incident_date" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_date" a19 
	on (a11.incident_date_key = a19.ROW_KEY)  
 union
select 'ldb."d_incident_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_date" a19 
 on (a11.incident_date_key = a19.ROW_KEY) 
	join "ldb"."d_incident_calendar_month" a110 
	on (a19.month_start_date_key = a110.ROW_KEY)  
 union
select 'ldb."d_incident_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_date" a19 
 on (a11.incident_date_key = a19.ROW_KEY) join "ldb"."d_incident_calendar_month" a110 
 on (a19.month_start_date_key = a110.ROW_KEY) 
	join "ldb"."d_incident_calendar_quarter" a111 
	on (a110.quarter_start_date_key = a111.ROW_KEY)  
 union
select 'ldb."d_incident_rfc" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_rfc" a112 
	on (a14.CHANGE_REQUEST_KEY = a112.ROW_KEY)  
 union
select 'ldb."d_configuration_item_incident" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_configuration_item_incident" a113 
	on (a14.CONFIGURATION_ITEM_KEY = a113.ROW_KEY)  
 union
select 'ldb."d_incident_configuration_item_mdm" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_configuration_item_incident" a113 
 on (a14.CONFIGURATION_ITEM_KEY = a113.ROW_KEY) 
	join "ldb"."d_incident_configuration_item_mdm" a114 
	on (a113.mdm_key = a114.ROW_KEY)  
 union
select 'ldb."d_incident_customer" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_customer" a115 
	on (a14.CUSTOMER_KEY = a115.ROW_KEY)  
 union
select 'ldb."d_parent_incident" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_parent_incident" a116 
	on (a14.PARENT_INCIDENT_KEY = a116.ROW_KEY)  
 union
select 'ldb."d_incident_calendar_hour" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_time" a12 
 on (a11.incident_time_key = a12.ROW_KEY) 
	join "ldb"."d_incident_calendar_hour" a117 
	on (a12.hour_key = a117.ROW_KEY)  
 union
select 'ldb."d_incident_caused_by_change" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_caused_by_change" a118 
	on (a11.incident_caused_by_change_key = a118.ROW_KEY)  
 union
select 'ldb."d_incident_contacttype" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_contacttype" a119 
	on (a11.reported_type_src_key = a119.ROW_KEY)  
 union
select 'ldb."d_incident_department" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_employee" a13 
 on (a11.incident_employee_key = a13.ROW_KEY) 
	join "ldb"."d_incident_department" a120 
	on (a13.DEPARTMENT_KEY = a120.ROW_KEY)  
 union
select 'ldb."d_incident_employee_mdm" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_employee" a13 
 on (a11.incident_employee_key = a13.ROW_KEY) 
	join "ldb"."d_incident_employee_mdm" a121 
	on (a13.employee_mdm_key = a121.ROW_KEY)  
 union
select 'ldb."d_incident_impact" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_impact" a122 
	on (a11.IMPACT_SRC_KEY = a122.ROW_KEY)  
 union
select 'ldb."d_incident_urgency" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_urgency" a123 
	on (a11.urgency_src_key = a123.ROW_KEY)  
 union
select 'ldb."d_incident_application_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_incident_application" a15 
 on (a14.APPLICATION_KEY = a15.ROW_KEY) 
	join "ldb"."d_incident_application_mdm" a124 
	on (a15.mdm_key = a124.ROW_KEY)  
 union
select 'ldb."d_incident_calendar_week" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_date" a19 
 on (a11.incident_date_key = a19.ROW_KEY) 
	join "ldb"."d_incident_calendar_week" a125 
	on (a19.week_start_date_key = a125.ROW_KEY)  
 union
select 'ldb."d_incident_category" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_category" a126 
	on (a14.CATEGORY_SRC_KEY = a126.ROW_KEY)  
 union
select 'ldb."d_incident_close_code" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_close_code" a127 
	on (a14.CLOSE_CODE_SRC_KEY = a127.ROW_KEY)  
 union
select 'ldb."d_incident_company" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_company" a128 
	on (a14.COMPANY_KEY = a128.ROW_KEY)  
 union
select 'ldb."d_incident_customer_mdm" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_incident_customer" a115 
 on (a14.CUSTOMER_KEY = a115.ROW_KEY) 
	join "ldb"."d_incident_customer_mdm" a129 
	on (a115.customer_mdm_key = a129.ROW_KEY)  
 union
select 'ldb."d_incident_domain" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_domain" a130 
	on (a14.DOMAIN_KEY = a130.ROW_KEY)  
 union
select 'ldb."d_incident_location" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_location" a131 
	on (a14.LOCATION_KEY = a131.ROW_KEY)  
 union
select 'ldb."d_incident_priority" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_priority" a132 
	on (a14.PRIORITY_SRC_KEY = a132.ROW_KEY)  
 union
select 'ldb."d_task_sla_resolution_flag" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_task_sla_resolution_flag" a133 
	on (a14.MET_RESOLUTION_SLA_FLAG_KEY = a133.ROW_KEY)  
 union
select 'ldb."d_task_sla_response_flag" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_task_sla_response_flag" a134 
	on (a14.MET_RESPONSE_SLA_FLAG_KEY = a134.ROW_KEY)  
 union
select 'ldb."d_incident_severity" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_severity" a135 
	on (a14.SEVERITY_SRC_KEY = a135.ROW_KEY)  
 union
select 'ldb."d_incident_state" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_state" a136 
	on (a14.STATE_SRC_KEY = a136.ROW_KEY)  
 union
select 'ldb."d_incident_subcategory" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) 
	join "ldb"."d_incident_subcategory" a137 
	on (a14.SUB_CATEGORY_SRC_KEY = a137.ROW_KEY)  
 union
select 'ldb."d_incident_assignment_group_manager" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_incident_assignment_group" a17 
 on (a14.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY) 
	join "ldb"."d_incident_assignment_group_manager" a138 
	on (a17.manager_key = a138.ROW_KEY)  
 union
select 'ldb."d_incident_business_service_criticality" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_incident_business_service" a18 
 on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY) 
	join "ldb"."d_incident_business_service_criticality" a139 
	on (a18.criticality_key = a139.ROW_KEY)  
 union
select 'ldb."d_incident_business_service_used_for" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."D_INCIDENT" a14 
 on (a11.INCIDENT_KEY = a14.ROW_KEY) join "ldb"."d_incident_business_service" a18 
 on (a14.BUSINESS_SERVICE_KEY = a18.ROW_KEY) 
	join "ldb"."d_incident_business_service_used_for" a140 
	on (a18.used_for_src_key = a140.ROW_KEY)  
 union
select 'ldb."d_incident_calendar_year" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_resolved" a11 
 join "ldb"."d_incident_date" a19 
 on (a11.incident_date_key = a19.ROW_KEY) join "ldb"."d_incident_calendar_month" a110 
 on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."d_incident_calendar_quarter" a111 
 on (a110.quarter_start_date_key = a111.ROW_KEY) 
	join "ldb"."d_incident_calendar_year" a141 
	on (a111.year_start_date_key = a141.ROW_KEY) 

