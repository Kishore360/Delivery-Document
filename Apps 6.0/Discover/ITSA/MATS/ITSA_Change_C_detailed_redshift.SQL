/* Tables Accessed:
d_application
d_application_mdm
d_business_service
d_business_service_criticality
d_business_service_used_for
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_change_request
d_change_request_approval
d_change_request_category
d_change_request_impact
d_change_request_priority
d_change_request_reason
d_change_request_reported_type
d_change_request_risk
d_change_request_scope
d_change_request_state
d_change_request_type
d_change_request_urgency
d_change_template_c
d_change_vendor_c
d_configuration_item
d_configuration_item_mdm
d_domain
d_internal_contact
d_internal_contact_assigned_to
d_internal_contact_change_requested_by_c
d_internal_contact_mdm
d_internal_organization_department
d_internal_organization_group
d_location
d_lov_change_cab_prior_to_install
d_lov_change_cab_review
d_lov_change_caused_problem
d_lov_change_code_repository_system_c
d_lov_change_communication_method
d_lov_change_completion_code
d_lov_change_environment
d_lov_change_executive_flag
d_lov_change_project_related
d_lov_change_sponsors_risk_assessment
d_lov_change_stage
d_lov_change_subcategory
d_lov_employee_type_c
d_standard_change
d_std_change_producer_version_c
f_change_request
 */
 
 select 'ldb."f_change_request" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_application" a12 
	on (a11.application_key = a12.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
	on (a11.assigned_to_key = a13.row_key)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_organization_group" a14 
	on (a11.assignment_group_key = a14.row_key)  
 union
select 'ldb."d_change_request" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
	on (a11.change_request_key = a15.row_key)  
 union
select 'ldb."d_business_service" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_business_service" a16 
	on (a11.business_service_key = a16.row_key)  
 union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a17 
	on (a11.date_key = a17.row_key)  
 union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a17 
 on (a11.date_key = a17.row_key) 
	join "ldb"."d_calendar_month" a18 
	on (a17.month_start_date_key = a18.row_key)  
 union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a17 
 on (a11.date_key = a17.row_key) join "ldb"."d_calendar_month" a18 
 on (a17.month_start_date_key = a18.row_key) 
	join "ldb"."d_calendar_quarter" a19 
	on (a18.quarter_start_date_key = a19.row_key)  
 union
select 'ldb."d_change_request_risk" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_risk" a110 
	on (a11.risk_src_key = a110.row_key)  
 union
select 'ldb."d_configuration_item" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_configuration_item" a111 
	on (a11.configuration_item_key = a111.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_configuration_item" a111 
 on (a11.configuration_item_key = a111.row_key) 
	join "ldb"."d_configuration_item_mdm" a112 
	on (a111.mdm_key = a112.row_key)  
 union
select 'ldb."d_internal_contact" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_contact" a113 
	on (a11.employee_key = a113.row_key)  
 union
select 'ldb."d_calendar_week" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a17 
 on (a11.date_key = a17.row_key) 
	join "ldb"."d_calendar_week" a114 
	on (a17.week_start_date_key = a114.row_key)  
 union
select 'ldb."d_calendar_year" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a17 
 on (a11.date_key = a17.row_key) join "ldb"."d_calendar_month" a18 
 on (a17.month_start_date_key = a18.row_key) join "ldb"."d_calendar_quarter" a19 
 on (a18.quarter_start_date_key = a19.row_key) 
	join "ldb"."d_calendar_year" a115 
	on (a19.year_start_date_key = a115.row_key)  
 union
select 'ldb."d_change_request_approval" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_approval" a116 
	on (a11.approval_state_src_key = a116.row_key)  
 union
select 'ldb."d_change_request_category" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_category" a117 
	on (a11.category_src_key = a117.row_key)  
 union
select 'ldb."d_change_request_reported_type" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_reported_type" a118 
	on (a11.reported_type_src_key = a118.row_key)  
 union
select 'ldb."d_change_request_impact" a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_impact" a119 
	on (a11.impact_src_key = a119.row_key)  
 union
select 'ldb."d_change_request_priority" a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_priority" a120 
	on (a11.priority_src_key = a120.row_key)  
 union
select 'ldb."d_change_request_reason" a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_reason" a121 
	on (a11.reason_src_key = a121.row_key)  
 union
select 'ldb."d_change_request_scope" a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_scope" a122 
	on (a11.scope_src_key = a122.row_key)  
 union
select 'ldb."d_change_request_state" a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_state" a123 
	on (a11.state_src_key = a123.row_key)  
 union
select 'ldb."d_change_request_type" a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_type" a124 
	on (a11.type_src_key = a124.row_key)  
 union
select 'ldb."d_change_request_urgency" a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_urgency" a125 
	on (a11.urgency_src_key = a125.row_key)  
 union
select 'ldb."d_domain" a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_domain" a126 
	on (a11.domain_key = a126.row_key)  
 union
select 'ldb."d_location" a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_location" a127 
	on (a11.location_key = a127.row_key)  
 union
select 'ldb."d_standard_change" a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_standard_change" a128 
	on (a11.standard_change_c_key = a128.row_key)  
 union
select 'ldb."d_change_template_c" a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_template_c" a129 
	on (a11.change_template_c_key = a129.row_key)  
 union
select 'ldb."d_change_vendor_c" a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_vendor_c" a130 
	on (a11.change_vendor_c_key = a130.row_key)  
 union
select 'ldb."d_application_mdm" a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_application" a12 
 on (a11.application_key = a12.row_key) 
	join "ldb"."d_application_mdm" a131 
	on (a12.mdm_key = a131.row_key)  
 union
select 'ldb."d_business_service_criticality" a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_business_service" a16 
 on (a11.business_service_key = a16.row_key) 
	join "ldb"."d_business_service_criticality" a132 
	on (a16.criticality_key = a132.row_key)  
 union
select 'ldb."d_business_service_used_for" a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_business_service" a16 
 on (a11.business_service_key = a16.row_key) 
	join "ldb"."d_business_service_used_for" a133 
	on (a16.used_for_src_key = a133.row_key)  
 union
select 'ldb."d_lov_change_cab_review" a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_cab_review" a134 
	on (a15.change_cab_review_c_key = a134.row_key)  
 union
select 'ldb."d_lov_change_caused_problem" a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_caused_problem" a135 
	on (a15.change_caused_problem_c_key = a135.row_key)  
 union
select 'ldb."d_lov_change_stage" a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_stage" a136 
	on (a15.change_stage_c_key = a136.row_key)  
 union
select 'ldb."d_internal_contact_change_requested_by_c" a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_internal_contact_change_requested_by_c" a137 
	on (a15.change_requested_by_c = a137.row_key)  
 union
select 'ldb."d_lov_change_code_repository_system_c" a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_code_repository_system_c" a138 
	on (a15.change_code_repository_system_c_key = a138.row_key)  
 union
select 'ldb."d_lov_change_communication_method" a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_communication_method" a139 
	on (a15.change_communication_method_c_key = a139.row_key)  
 union
select 'ldb."d_lov_change_completion_code" a140 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_completion_code" a140 
	on (a15.change_completion_code_c_key = a140.row_key)  
 union
select 'ldb."d_lov_change_cab_prior_to_install" a141 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_cab_prior_to_install" a141 
	on (a15.change_cab_prior_to_install_c_key = a141.row_key)  
 union
select 'ldb."d_internal_organization_department" a142 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_organization_department" a142 
	on (a11.requested_by_department_key = a142.row_key)  
 union
select 'ldb."d_internal_contact_mdm" a143 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_contact" a113 
 on (a11.employee_key = a113.row_key) 
	join "ldb"."d_internal_contact_mdm" a143 
	on (a113.employee_mdm_key = a143.row_key)  
 union
select 'ldb."d_lov_employee_type_c" a144 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_contact_assigned_to" a13 
 on (a11.assigned_to_key = a13.row_key) 
	join "ldb"."d_lov_employee_type_c" a144 
	on (a13.employee_type_c_key = a144.row_key)  
 union
select 'ldb."d_lov_change_environment" a145 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_environment" a145 
	on (a15.change_environment_c_key = a145.row_key)  
 union
select 'ldb."d_lov_change_executive_flag" a146 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_executive_flag" a146 
	on (a15.change_executive_flag_c_key = a146.row_key)  
 union
select 'ldb."d_lov_change_project_related" a147 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_project_related" a147 
	on (a15.change_project_related_c_key = a147.row_key)  
 union
select 'ldb."d_lov_change_sponsors_risk_assessment" a148 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_sponsors_risk_assessment" a148 
	on (a15.change_sponsors_risk_assessment_c_key = a148.row_key)  
 union
select 'ldb."d_std_change_producer_version_c" a149 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_std_change_producer_version_c" a149 
	on (a15.std_change_producer_version_c_key = a149.row_key)  
 union
select 'ldb."d_lov_change_subcategory" a150 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a15 
 on (a11.change_request_key = a15.row_key) 
	join "ldb"."d_lov_change_subcategory" a150 
	on (a15.change_subcategory_c_key = a150.row_key) 

