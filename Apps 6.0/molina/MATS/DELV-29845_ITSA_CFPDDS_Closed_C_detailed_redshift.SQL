select 'dw."f_change_failure_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 union
select 'dw."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'dw."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_configuration_item" a13 
	on (a11.ci_key = a13.row_key)  
 union
select 'dw."d_assignment_group_manager" a14 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) 
	join "dw"."d_assignment_group_manager" a14 
	on (a12.assignment_group_manager_key = a14.row_key)  
 union
select 'dw."d_h_ag_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) 
	join "dw"."d_h_ag_manager" a15 
	on (a14.assignment_group_manager_hierarchy_key = a15.row_key)  
 union
select 'dw."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_calendar_date" a16 
	on (a11.date_key = a16.row_key)  
 union
select 'dw."d_change_request" a17 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
	on (a11.change_request_key = a17.row_key)  
 union
select 'dw."d_change_application" a18 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_application" a18 
	on (a17.application_key = a18.row_key)  
 union
select 'dw."d_configuration_item_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_configuration_item" a13 
 on (a11.ci_key = a13.row_key) 
	join "dw"."d_configuration_item_mdm" a19 
	on (a13.mdm_key = a19.row_key)  
 union
select 'dw."d_change_failure" a110 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_failure" a110 
	on (a11.change_failure_key = a110.row_key)  
 union
select 'dw."d_cfp_model_risk_factors" a111 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_failure" a110 
 on (a11.change_failure_key = a110.row_key) 
	join "dw"."d_cfp_model_risk_factors" a111 
	on (a110.model_risk_factor_change_request_key = a111.row_key)  
 union
select 'dw."d_calendar_month" a112 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "dw"."d_calendar_month" a112 
	on (a16.month_start_date_key = a112.row_key)  
 union
select 'dw."d_calendar_quarter" a113 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "dw"."d_calendar_month" a112 
 on (a16.month_start_date_key = a112.row_key) 
	join "dw"."d_calendar_quarter" a113 
	on (a112.quarter_start_date_key = a113.row_key)  
 union
select 'dw."d_calendar_year" a114 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "dw"."d_calendar_month" a112 
 on (a16.month_start_date_key = a112.row_key) join "dw"."d_calendar_quarter" a113 
 on (a112.quarter_start_date_key = a113.row_key) 
	join "dw"."d_calendar_year" a114 
	on (a113.year_start_date_key = a114.row_key)  
 union
select 'dw."d_ag_manager_level_1" a115 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) join "dw"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.row_key) 
	join "dw"."d_ag_manager_level_1" a115 
	on (a15.assignment_group_manager_level_1_key = a115.row_key)  
 union
select 'dw."d_ag_manager_level_2" a116 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) join "dw"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.row_key) 
	join "dw"."d_ag_manager_level_2" a116 
	on (a15.assignment_group_manager_level_2_key = a116.row_key)  
 union
select 'dw."d_ag_manager_level_3" a117 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) join "dw"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.row_key) 
	join "dw"."d_ag_manager_level_3" a117 
	on (a15.assignment_group_manager_level_3_key = a117.row_key)  
 union
select 'dw."d_ag_manager_level_4" a118 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) join "dw"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.row_key) 
	join "dw"."d_ag_manager_level_4" a118 
	on (a15.assignment_group_manager_level_4_key = a118.row_key)  
 union
select 'dw."d_ag_manager_level_5" a119 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_internal_organization_group" a12 
 on (a11.assignment_group_key = a12.row_key) join "dw"."d_assignment_group_manager" a14 
 on (a12.assignment_group_manager_key = a14.row_key) join "dw"."d_h_ag_manager" a15 
 on (a14.assignment_group_manager_hierarchy_key = a15.row_key) 
	join "dw"."d_ag_manager_level_5" a119 
	on (a15.assignment_group_manager_level_5_key = a119.row_key)  
 union
select 'dw."d_change_application_mdm" a120 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) join "dw"."d_change_application" a18 
 on (a17.application_key = a18.row_key) 
	join "dw"."d_change_application_mdm" a120 
	on (a18.mdm_key = a120.row_key)  
 union
select 'dw."d_change_request_approval" a121 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_request_approval" a121 
	on (a17.approval_state_src_key = a121.row_key)  
 union
select 'dw."d_change_internal_contact_assigned_to" a122 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_internal_contact_assigned_to" a122 
	on (a17.assigned_to_key = a122.row_key)  
 union
select 'dw."d_change_request_assignment_group" a123 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_request_assignment_group" a123 
	on (a17.assignment_group_key = a123.row_key)  
 union
select 'dw."d_change_business_service" a124 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_business_service" a124 
	on (a17.business_service_key = a124.row_key)  
 union
select 'dw."d_change_request_close_code" a125 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_request_close_code" a125 
	on (a17.close_code_src_key = a125.row_key)  
 union
select 'dw."d_internal_contact_change_closed_by" a126 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_internal_contact_change_closed_by" a126 
	on (a17.closed_by_key = a126.row_key)  
 union
select 'dw."d_change_department" a127 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_department" a127 
	on (a17.requested_by_department_key = a127.row_key)  
 union
select 'dw."d_change_request_state" a128 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request_state" a128 
	on (a11.change_state_src_key = a128.row_key)  
 union
select 'dw."d_change_request_type" a129 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_request_type" a129 
	on (a17.type_src_key = a129.row_key)  
 union
select 'dw."d_ci_location" a130 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_configuration_item" a13 
 on (a11.ci_key = a13.row_key) 
	join "dw"."d_ci_location" a130 
	on (a13.location_key = a130.row_key)  
 union
select 'dw."d_change_failure_probability" a131 ' as Table_name, count(a11.row_key) Row_Count
 from dw."f_change_failure_closed" a11 
 join "dw"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "dw"."d_change_failure_probability" a131 
	on (a17.change_request_key_fp = a131.change_request_key) 

