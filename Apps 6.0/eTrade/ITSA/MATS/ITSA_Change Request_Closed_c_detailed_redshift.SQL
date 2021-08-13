select 'ldb."f_change_request_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 union
select 'ldb."d_change_employee" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_employee" a12 
	on (a11.change_employee_key = a12.ROW_KEY)  
 union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
	on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)  
 union
select 'ldb."d_change_application" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_application" a14 
	on (a13.APPLICATION_KEY = a14.ROW_KEY)  
 union
select 'ldb."d_change_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_internal_contact_assigned_to" a15 
	on (a13.ASSIGNED_TO_KEY = a15.ROW_KEY)  
 union
select 'ldb."d_change_request_assignment_group" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_request_assignment_group" a16 
	on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)  
 union
select 'ldb."d_h_change_assignment_group" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_request_assignment_group" a16 
 on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) 
	join "ldb"."d_h_change_assignment_group" a17 
	on (a16.group_hierarchy_key = a17.ROW_KEY)  
 union
select 'ldb."d_change_business_service" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_business_service" a18 
	on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY)  
 union
select 'ldb."d_change_date" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_date" a19 
	on (a11.change_date_key = a19.ROW_KEY)  
 union
select 'ldb."d_change_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_date" a19 
 on (a11.change_date_key = a19.ROW_KEY) 
	join "ldb"."d_change_calendar_month" a110 
	on (a19.month_start_date_key = a110.ROW_KEY)  
 union
select 'ldb."d_change_calendar_quarter" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_date" a19 
 on (a11.change_date_key = a19.ROW_KEY) join "ldb"."d_change_calendar_month" a110 
 on (a19.month_start_date_key = a110.ROW_KEY) 
	join "ldb"."d_change_calendar_quarter" a111 
	on (a110.quarter_start_date_key = a111.ROW_KEY)  
 union
select 'ldb."d_change_configuration_item" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_configuration_item" a112 
	on (a13.CONFIGURATION_ITEM_KEY = a112.ROW_KEY)  
 union
select 'ldb."d_change_configuration_item_mdm" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_configuration_item" a112 
 on (a13.CONFIGURATION_ITEM_KEY = a112.ROW_KEY) 
	join "ldb"."d_change_configuration_item_mdm" a113 
	on (a112.mdm_key = a113.ROW_KEY)  
 union
select 'ldb."d_change_request_risk" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_risk" a114 
	on (a11.RISK_SRC_KEY = a114.ROW_KEY)  
 union
select 'ldb."d_change_request_category" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_category" a115 
	on (a11.CATEGORY_SRC_KEY = a115.ROW_KEY)  
 union
select 'ldb."d_change_request_reported_type" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_reported_type" a116 
	on (a11.reported_type_src_key = a116.ROW_KEY)  
 union
select 'ldb."d_change_employee_mdm" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_employee" a12 
 on (a11.change_employee_key = a12.ROW_KEY) 
	join "ldb"."d_change_employee_mdm" a117 
	on (a12.employee_mdm_key = a117.ROW_KEY)  
 union
select 'ldb."d_change_request_impact" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_impact" a118 
	on (a11.IMPACT_SRC_KEY = a118.ROW_KEY)  
 union
select 'ldb."d_change_request_priority" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_priority" a119 
	on (a11.PRIORITY_SRC_KEY = a119.ROW_KEY)  
 union
select 'ldb."d_change_request_reason" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_reason" a120 
	on (a11.reason_src_key = a120.ROW_KEY)  
 union
select 'ldb."d_change_request_review_status" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_review_status" a121 
	on (a11.review_status_src_key = a121.ROW_KEY)  
 union
select 'ldb."d_change_request_scope" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_scope" a122 
	on (a11.SCOPE_SRC_KEY = a122.ROW_KEY)  
 union
select 'ldb."d_change_request_urgency" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_urgency" a123 
	on (a11.urgency_src_key = a123.ROW_KEY)  
 union
select 'ldb."d_change_application_mdm" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_application" a14 
 on (a13.APPLICATION_KEY = a14.ROW_KEY) 
	join "ldb"."d_change_application_mdm" a124 
	on (a14.mdm_key = a124.ROW_KEY)  
 union
select 'ldb."d_change_request_approval" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_approval" a125 
	on (a11.APPROVAL_STATE_SRC_KEY = a125.ROW_KEY)  
 union
select 'ldb."d_change_calendar_week" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_date" a19 
 on (a11.change_date_key = a19.ROW_KEY) 
	join "ldb"."d_change_calendar_week" a126 
	on (a19.week_start_date_key = a126.ROW_KEY)  
 union
select 'ldb."d_change_department" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_department" a127 
	on (a11.change_department_key = a127.ROW_KEY)  
 union
select 'ldb."d_change_domain" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_domain" a128 
	on (a13.DOMAIN_KEY = a128.ROW_KEY)  
 union
select 'ldb."d_change_location" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) 
	join "ldb"."d_change_location" a129 
	on (a13.LOCATION_KEY = a129.ROW_KEY)  
 union
select 'ldb."d_change_request_state" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_state" a130 
	on (a11.STATE_SRC_KEY = a130.ROW_KEY)  
 union
select 'ldb."d_change_request_type" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_type" a131 
	on (a11.TYPE_SRC_KEY = a131.ROW_KEY)  
 union
select 'ldb."d_change_assignment_group_level_1" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_request_assignment_group" a16 
 on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) join "ldb"."d_h_change_assignment_group" a17 
 on (a16.group_hierarchy_key = a17.ROW_KEY) 
	join "ldb"."d_change_assignment_group_level_1" a132 
	on (a17.group_level_1_key = a132.ROW_KEY)  
 union
select 'ldb."d_change_assignment_group_level_2" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_request_assignment_group" a16 
 on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) join "ldb"."d_h_change_assignment_group" a17 
 on (a16.group_hierarchy_key = a17.ROW_KEY) 
	join "ldb"."d_change_assignment_group_level_2" a133 
	on (a17.group_level_2_key = a133.ROW_KEY)  
 union
select 'ldb."d_change_assignment_group_manager" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_request_assignment_group" a16 
 on (a13.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY) 
	join "ldb"."d_change_assignment_group_manager" a134 
	on (a16.manager_key = a134.ROW_KEY)  
 union
select 'ldb."d_change_business_service_criticality" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_business_service" a18 
 on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY) 
	join "ldb"."d_change_business_service_criticality" a135 
	on (a18.criticality_key = a135.ROW_KEY)  
 union
select 'ldb."d_change_business_service_used_for" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."D_CHANGE_REQUEST" a13 
 on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY) join "ldb"."d_change_business_service" a18 
 on (a13.BUSINESS_SERVICE_KEY = a18.ROW_KEY) 
	join "ldb"."d_change_business_service_used_for" a136 
	on (a18.used_for_src_key = a136.ROW_KEY)  
 union
select 'ldb."d_change_calendar_year" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_date" a19 
 on (a11.change_date_key = a19.ROW_KEY) join "ldb"."d_change_calendar_month" a110 
 on (a19.month_start_date_key = a110.ROW_KEY) join "ldb"."d_change_calendar_quarter" a111 
 on (a110.quarter_start_date_key = a111.ROW_KEY) 
	join "ldb"."d_change_calendar_year" a137 
	on (a111.year_start_date_key = a137.ROW_KEY) 



