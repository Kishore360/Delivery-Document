select 'ldb."f_request_item" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_internal_organization_group" a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'ldb."d_request_item_employee" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_employee" a13 
	on (a11.request_item_employee_key = a13.row_key)  
 union
select 'ldb."D_REQUEST_ITEM" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
	on (a11.request_item_key = a14.row_key)  
 union
select 'ldb."d_request_item_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_assigned_to" a15 
	on (a14.assigned_to_key = a15.row_key)  
 union
select 'ldb."d_request_item_assignment_group" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_assignment_group" a16 
	on (a14.assignment_group_key = a16.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a17 
	on (a14.REQUEST_ITEM_BUSINESS_SERVICE_C_KEY = a17.row_key)  
 union
select 'ldb."d_request_item_date" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_date" a18 
	on (a11.request_item_date_key = a18.row_key)  
 union
select 'ldb."d_request_item_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_date" a18 
 on (a11.request_item_date_key = a18.row_key) 
	join "ldb"."d_request_item_calendar_month" a19 
	on (a18.month_start_date_key = a19.row_key)  
 union
select 'ldb."d_request_item_calendar_quarter" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_date" a18 
 on (a11.request_item_date_key = a18.row_key) join "ldb"."d_request_item_calendar_month" a19 
 on (a18.month_start_date_key = a19.row_key) 
	join "ldb"."d_request_item_calendar_quarter" a110 
	on (a19.quarter_start_date_key = a110.row_key)  
 union
select 'ldb."d_request_item_master_item" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_master_item" a111 
	on (a14.catalog_item_key = a111.row_key)  
 union
select 'ldb."D_REQ_ITEM_OPENED_BY" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_REQ_ITEM_OPENED_BY" a112 
	on (a14.opened_by_key = a112.row_key)  
 union
select 'ldb."d_request_item_requested_for" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_requested_for" a113 
	on (a14.requested_for_key = a113.row_key)  
 union
select 'ldb."d_request_item_state" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_state" a114 
	on (a11.state_src_key = a114.row_key)  
 union
select 'ldb."d_request" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request" a115 
	on (a11.REQUEST_KEY = a115.row_key)  
 union
select 'ldb."d_sc_req_item_approval" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_sc_req_item_approval" a116 
	on (a11.approval_state_src_key = a116.row_key)  
 union
select 'ldb."d_request_item_contacttype" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_contacttype" a117 
	on (a11.reported_type_src_key = a117.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_VENDOR_C" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) 
	join "ldb"."D_REQUEST_ITEM_VENDOR_C" a118 
	on (a12.REQUEST_ITEM_VENDOR_C_KEY = a118.row_key)  
 union
select 'ldb."d_request_item_department" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_employee" a13 
 on (a11.request_item_employee_key = a13.row_key) 
	join "ldb"."d_request_item_department" a119 
	on (a13.department_key = a119.row_key)  
 union
select 'ldb."d_request_item_employee_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_employee" a13 
 on (a11.request_item_employee_key = a13.row_key) 
	join "ldb"."d_request_item_employee_mdm" a120 
	on (a13.employee_mdm_key = a120.row_key)  
 union
select 'ldb."d_sc_req_item_impact" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_sc_req_item_impact" a121 
	on (a11.impact_src_key = a121.row_key)  
 union
select 'ldb."d_sc_req_item_priority" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_sc_req_item_priority" a122 
	on (a11.priority_src_key = a122.row_key)  
 union
select 'ldb."d_request_item_stage" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_stage" a123 
	on (a11.stage_src_key = a123.row_key)  
 union
select 'ldb."d_sc_req_item_urgency" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_sc_req_item_urgency" a124 
	on (a11.urgency_src_key = a124.row_key)  
 union
select 'ldb."D_LOV_REQUEST_ITEM_AFFECTED_ENVIRONMENT_C" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_LOV_REQUEST_ITEM_AFFECTED_ENVIRONMENT_C" a125 
	on (a14.REQUEST_ITEM_AFFECTED_ENVIRONMENT_SRC_C_KEY = a125.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C" a126 
	on (a14.REQUEST_ITEM_BUSINESSUNIT_CUSTOM_C_KEY = a126.row_key)  
 union
select 'ldb."d_request_item_calendar_week" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_date" a18 
 on (a11.request_item_date_key = a18.row_key) 
	join "ldb"."d_request_item_calendar_week" a127 
	on (a18.week_start_date_key = a127.row_key)  
 union
select 'ldb."d_request_item_closed_by" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_closed_by" a128 
	on (a14.closed_by_key = a128.row_key)  
 union
select 'ldb."d_request_item_hr_change_category" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_hr_change_category" a129 
	on (a14.HR_CATEGORY_SRC_KEY = a129.row_key)  
 union
select 'ldb."d_request_item_hr_change" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_hr_change" a130 
	on (a14.HR_CHANGE_KEY = a130.row_key)  
 union
select 'ldb."d_request_item_location" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."d_request_item_location" a131 
	on (a14.location_key = a131.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_REQUESTER_C" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_REQUEST_ITEM_REQUESTER_C" a132 
	on (a14.REQUEST_ITEM_REQUESTER_C_KEY = a132.row_key)  
 union
select 'ldb."D_LOV_REQUEST_ITEM_RESOLUTION_CODE_SRC_C" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_LOV_REQUEST_ITEM_RESOLUTION_CODE_SRC_C" a133 
	on (a14.REQUEST_ITEM_RESOLUTION_CODE_SRC_C_KEY = a133.row_key)  
 union
select 'ldb."D_INTERNAL_CONTACT_REQUEST_ITEM_RESOLVED_BY_C" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_INTERNAL_CONTACT_REQUEST_ITEM_RESOLVED_BY_C" a134 
	on (a14.REQUEST_ITEM_RESOLVED_BY_C_KEY = a134.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_SCAFE_CORE_REALM_C" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_REQUEST_ITEM_SCAFE_CORE_REALM_C" a135 
	on (a14.REQUEST_ITEM_SCAFE_CORE_REALM_C_KEY = a135.row_key)  
 union
select 'ldb."D_LOV_REQUEST_ITEM_SERVICE_CATEGORY_SRC_C" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_LOV_REQUEST_ITEM_SERVICE_CATEGORY_SRC_C" a136 
	on (a14.REQUEST_ITEM_SERVICE_CATEGORY_SRC_C_KEY = a136.row_key)  
 union
select 'ldb."D_LOV_REQUEST_ITEM_SITUATION_SRC_C" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_LOV_REQUEST_ITEM_SITUATION_SRC_C" a137 
	on (a14.REQUEST_ITEM_SITUATION_SRC_C_KEY = a137.row_key)  
 union
select 'ldb."d_request_location" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request" a115 
 on (a11.REQUEST_KEY = a115.row_key) 
	join "ldb"."d_request_location" a138 
	on (a115.location_key = a138.row_key)  
 union
select 'ldb."D_LOV_REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) 
	join "ldb"."D_LOV_REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C" a139 
	on (a14.REQUEST_ITEM_REMINDER_NOTIFICATIONS_SRC_C_KEY = a139.row_key)  
 union
select 'ldb."d_request_item_assignment_group_manager" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."d_request_item_assignment_group" a16 
 on (a14.assignment_group_key = a16.row_key) 
	join "ldb"."d_request_item_assignment_group_manager" a140 
	on (a16.manager_key = a140.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_SERVICE_OWNED_BY_C" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."D_REQUEST_ITEM_BUSINESS_SERVICE_C" a17 
 on (a14.REQUEST_ITEM_BUSINESS_SERVICE_C_KEY = a17.row_key) 
	join "ldb"."D_REQUEST_ITEM_SERVICE_OWNED_BY_C" a141 
	on (a17.REQ_ITEM_SERVICE_OWNED_BY_C_KEY = a141.row_key)  
 union
select 'ldb."d_request_item_item_category" a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."d_request_item_master_item" a111 
 on (a14.catalog_item_key = a111.row_key) 
	join "ldb"."d_request_item_item_category" a142 
	on (a111.ITEM_CATEGORY_KEY = a142.row_key)  
 union
select 'ldb."d_request_item_item_type" a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."d_request_item_master_item" a111 
 on (a14.catalog_item_key = a111.row_key) 
	join "ldb"."d_request_item_item_type" a143 
	on (a111.ITEM_TYPE_CODE_KEY = a143.row_key)  
 union
select 'ldb."d_req_item_open_by_dept" a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."D_REQ_ITEM_OPENED_BY" a112 
 on (a14.opened_by_key = a112.row_key) 
	join "ldb"."d_req_item_open_by_dept" a144 
	on (a112.department_key = a144.row_key)  
 union
select 'ldb."D_REQUEST_ITEM_GBL_C" a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."D_REQ_ITEM_OPENED_BY" a112 
 on (a14.opened_by_key = a112.row_key) 
	join "ldb"."D_REQUEST_ITEM_GBL_C" a145 
	on (a112.REQUEST_ITEM_GBL_C_KEY = a145.row_key)  
 union
select 'ldb."d_req_item_open_by_loc" a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."D_REQ_ITEM_OPENED_BY" a112 
 on (a14.opened_by_key = a112.row_key) 
	join "ldb"."d_req_item_open_by_loc" a146 
	on (a112.location_key = a146.row_key)  
 union
select 'ldb."d_req_item_req_for_loc" a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."D_REQUEST_ITEM" a14 
 on (a11.request_item_key = a14.row_key) join "ldb"."d_request_item_requested_for" a113 
 on (a14.requested_for_key = a113.row_key) 
	join "ldb"."d_req_item_req_for_loc" a147 
	on (a113.location_key = a147.row_key)  
 union
select 'ldb."d_request_item_calendar_year" a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_request_item" a11 
 join "ldb"."d_request_item_date" a18 
 on (a11.request_item_date_key = a18.row_key) join "ldb"."d_request_item_calendar_month" a19 
 on (a18.month_start_date_key = a19.row_key) join "ldb"."d_request_item_calendar_quarter" a110 
 on (a19.quarter_start_date_key = a110.row_key) 
	join "ldb"."d_request_item_calendar_year" a148 
	on (a110.year_start_date_key = a148.row_key) 

