/* Tables Accessed:
d_assignment_group_leader
d_business_service
d_business_service_criticality
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_change_request
d_change_request_approval
d_change_request_category
d_change_request_close_code
d_change_request_impact
d_change_request_priority
d_change_request_reason
d_change_request_review_status
d_change_request_risk
d_change_request_state
d_change_request_type
d_change_request_urgency
d_ci_location
d_configuration_item
d_configuration_item_mdm
d_dq_rules
d_dq_rules_config
d_internal_contact_assigned_to
d_internal_organization_department
d_internal_organization_group
d_location
f_n_dq_change_monthly
 */
 
 select 'ldb."f_n_dq_change_monthly" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 union
select 'ldb."d_business_service" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_business_service" a12 
	on (a11.business_service_key = a12.row_key)  
 union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_configuration_item" a13 
	on (a11.configuration_item_key = a13.row_key)  
 union
select 'ldb."d_dq_rules_config" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_dq_rules_config" a14 
	on (a11.dq_rules_configuration_key = a14.row_key)  
 union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_internal_organization_group" a15 
	on (a11.assignment_group_key = a15.row_key)  
 union
select 'ldb."d_calendar_date" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_calendar_date" a16 
	on (a11.date_key = a16.row_key)  
 union
select 'ldb."d_change_request" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request" a17 
	on (a11.change_request_key = a17.row_key)  
 union
select 'ldb."d_change_request_state" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_state" a18 
	on (a11.change_state_src_key = a18.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key) 
	join "ldb"."d_configuration_item_mdm" a19 
	on (a13.mdm_key = a19.row_key)  
 union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_month" a110 
	on (a16.month_start_date_key = a110.row_key)  
 union
select 'ldb."d_calendar_week" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) 
	join "ldb"."d_calendar_week" a111 
	on (a16.week_start_date_key = a111.row_key)  
 union
select 'ldb."d_calendar_quarter" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a110 
 on (a16.month_start_date_key = a110.row_key) 
	join "ldb"."d_calendar_quarter" a112 
	on (a110.quarter_start_date_key = a112.row_key)  
 union
select 'ldb."d_calendar_year" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_calendar_date" a16 
 on (a11.date_key = a16.row_key) join "ldb"."d_calendar_month" a110 
 on (a16.month_start_date_key = a110.row_key) join "ldb"."d_calendar_quarter" a112 
 on (a110.quarter_start_date_key = a112.row_key) 
	join "ldb"."d_calendar_year" a113 
	on (a112.year_start_date_key = a113.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_internal_contact_assigned_to" a114 
	on (a11.assignee_key = a114.row_key)  
 union
select 'ldb."d_business_service_criticality" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_business_service" a12 
 on (a11.business_service_key = a12.row_key) 
	join "ldb"."d_business_service_criticality" a115 
	on (a12.criticality_key = a115.row_key)  
 union
select 'ldb."d_change_request_approval" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_approval" a116 
	on (a11.approval_state_src_key = a116.row_key)  
 union
select 'ldb."d_change_request_category" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_category" a117 
	on (a11.category_src_key = a117.row_key)  
 union
select 'ldb."d_change_request_impact" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_impact" a118 
	on (a11.impact_src_key = a118.row_key)  
 union
select 'ldb."d_change_request_priority" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_priority" a119 
	on (a11.priority_src_key = a119.row_key)  
 union
select 'ldb."d_change_request_reason" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_reason" a120 
	on (a11.reason_src_key = a120.row_key)  
 union
select 'ldb."d_change_request_review_status" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_review_status" a121 
	on (a11.review_status_src_key = a121.row_key)  
 union
select 'ldb."d_change_request_risk" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_risk" a122 
	on (a11.risk_src_key = a122.row_key)  
 union
select 'ldb."d_change_request_type" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_type" a123 
	on (a11.type_src_key = a123.row_key)  
 union
select 'ldb."d_change_request_urgency" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request_urgency" a124 
	on (a11.urgency_src_key = a124.row_key)  
 union
select 'ldb."d_dq_rules" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_dq_rules_config" a14 
 on (a11.dq_rules_configuration_key = a14.row_key) 
	join "ldb"."d_dq_rules" a125 
	on (a14.rule_key = a125.row_key)  
 union
select 'ldb."d_internal_organization_department" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_internal_organization_department" a126 
	on (a11.department_key = a126.row_key)  
 union
select 'ldb."d_location" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_location" a127 
	on (a11.location_key = a127.row_key)  
 union
select 'ldb."d_assignment_group_leader" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_internal_organization_group" a15 
 on (a11.assignment_group_key = a15.row_key) 
	join "ldb"."d_assignment_group_leader" a128 
	on (a15.assignment_group_leader_key = a128.row_key)  
 union
select 'ldb."d_change_request_close_code" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_change_request" a17 
 on (a11.change_request_key = a17.row_key) 
	join "ldb"."d_change_request_close_code" a129 
	on (a17.close_code_src_key = a129.row_key)  
 union
select 'ldb."d_ci_location" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_n_dq_change_monthly" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key) 
	join "ldb"."d_ci_location" a130 
	on (a13.location_key = a130.row_key) 

