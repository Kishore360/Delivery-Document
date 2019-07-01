select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_organization_group a12 
	on (a11.assignment_group_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_contact a13 
	on (a11.employee_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_business_service a15 
	on (a11.business_service_key = a15.row_key)  
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_calendar_date a16 
	on (a11.date_key = a16.row_key)  
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
	join ldb.d_calendar_month a17 
	on (a16.month_start_date_key = a17.row_key)  
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key) 
	join ldb.d_calendar_quarter a18 
	on (a17.quarter_start_date_key = a18.row_key)  
union
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
	on (a11.change_request_key = a19.row_key)  
union
select 'ldb.d_change_request_risk a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_risk a110 
	on (a11.risk_src_key = a110.row_key)  
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_configuration_item a111 
	on (a11.configuration_item_key = a111.row_key)  
union
select 'ldb.d_group_bu_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
	join ldb.d_group_bu_c a112 
	on (a12.group_bu_c_key = a112.row_key)  
union
select 'ldb.d_change_request_approval a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_approval a113 
	on (a11.approval_state_src_key = a113.row_key)  
union
select 'ldb.d_change_request_category a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_category a114 
	on (a11.category_src_key = a114.row_key)  
union
select 'ldb.d_change_request_reported_type a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_reported_type a115 
	on (a11.reported_type_src_key = a115.row_key)  
union
select 'ldb.d_change_request_impact a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_impact a116 
	on (a11.impact_src_key = a116.row_key)  
union
select 'ldb.d_internal_contact_manager_expedited_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_contact_manager_expedited_c a117 
	on (a11.manager_expedited_c_key = a117.row_key)  
union
select 'ldb.d_change_request_priority a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_priority a118 
	on (a11.priority_src_key = a118.row_key)  
union
select 'ldb.d_change_request_reason a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_reason a119 
	on (a11.reason_src_key = a119.row_key)  
union
select 'ldb.d_internal_organization_requester_group_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_organization_requester_group_c a120 
	on (a11.requester_group_c_key = a120.row_key)  
union
select 'ldb.d_change_request_review_status a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_review_status a121 
	on (a11.review_status_src_key = a121.row_key)  
union
select 'ldb.d_internal_contact_slt_expedited_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_contact_slt_expedited_c a122 
	on (a11.slt_expedited_c_key = a122.row_key)  
union
select 'ldb.d_change_request_scope a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_scope a123 
	on (a11.scope_src_key = a123.row_key)  
union
select 'ldb.d_change_request_state a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_state a124 
	on (a11.state_src_key = a124.row_key)  
union
select 'ldb.d_change_request_type a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_type a125 
	on (a11.type_src_key = a125.row_key)  
union
select 'ldb.d_change_request_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request_urgency a126 
	on (a11.urgency_src_key = a126.row_key)  
union
select 'ldb.d_internal_organization_department a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_organization_department a127 
	on (a11.requested_by_department_key = a127.row_key)  
union
select 'ldb.d_domain a128 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_domain a128 
	on (a11.domain_key = a128.row_key)  
union
select 'ldb.d_internal_contact_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
	join ldb.d_internal_contact_mdm a129 
	on (a13.employee_mdm_key = a129.row_key)  
union
select 'ldb.d_location a130 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_location a130 
	on (a11.location_key = a130.row_key)  
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_business_service a15 
 on (a11.business_service_key = a15.row_key) 
	join ldb.d_business_service_criticality a131 
	on (a15.criticality_key = a131.row_key)  
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_business_service a15 
 on (a11.business_service_key = a15.row_key) 
	join ldb.d_business_service_used_for a132 
	on (a15.used_for_src_key = a132.row_key)  
union
select 'ldb.d_calendar_week a133 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
	join ldb.d_calendar_week a133 
	on (a16.week_start_date_key = a133.row_key)  
union
select 'ldb.d_change_business_sponsor_group_c a134 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
 on (a11.change_request_key = a19.row_key) 
	join ldb.d_change_business_sponsor_group_c a134 
	on (a19.change_business_sponsor_group_c_key = a134.row_key)  
union
select 'ldb.d_change_request_close_code a135 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
 on (a11.change_request_key = a19.row_key) 
	join ldb.d_change_request_close_code a135 
	on (a19.close_code_src_key = a135.row_key)  
union
select 'ldb.d_lov_reason_for_change_c a136 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
 on (a11.change_request_key = a19.row_key) 
	join ldb.d_lov_reason_for_change_c a136 
	on (a19.reason_for_change_c_key = a136.row_key)  
union
select 'ldb.d_change_requester_group_c a137 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
 on (a11.change_request_key = a19.row_key) 
	join ldb.d_change_requester_group_c a137 
	on (a19.change_requester_group_c_key = a137.row_key)  
union
select 'ldb.d_change_slt_approver_c a138 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_change_request a19 
 on (a11.change_request_key = a19.row_key) 
	join ldb.d_change_slt_approver_c a138 
	on (a19.change_slt_approver_c_key = a138.row_key)  
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_closed a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key)join ldb.d_calendar_quarter a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join ldb.d_calendar_year a139 
	on (a18.year_start_date_key = a139.row_key)  

