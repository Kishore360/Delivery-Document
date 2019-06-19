select 'ldb.f_ad_hoc_request_resolved_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_calendar_date a12 
	on (a11.last_resolved_on_key = a12.row_key)  
union
select 'ldb.d_ad_hoc_request_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_c a13 
	on (a11.ad_hoc_request_c_key = a13.row_key)  
union
select 'ldb.d_ci_autofill_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ci_autofill_c a14 
	on (a11.ci_autofill_key = a14.row_key)  
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_configuration_item a15 
	on (a11.configuration_item_key = a15.row_key)  
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_organization_group a16 
	on (a11.assignment_group_key = a16.row_key)  
union
select 'ldb.d_ad_hoc_request_agebucket_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_agebucket_c a17 
	on (a11.age_key = a17.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_contact_assigned_to a18 
	on (a11.assigned_to_key = a18.row_key)  
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_business_service a19 
	on (a11.business_service_key = a19.row_key)  
union
select 'ldb.d_internal_contact_caller a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_contact_caller a110 
	on (a11.caller_key = a110.row_key)  
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_change_request a111 
	on (a11.change_request_key = a111.row_key)  
union
select 'ldb.d_cost_center a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_cost_center a112 
	on (a11.cost_center_key = a112.row_key)  
union
select 'ldb.d_adhoc_requested_for_location_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_adhoc_requested_for_location_c a113 
	on (a11.adhoc_requested_for_location_key = a113.row_key)  
union
select 'ldb.d_internal_contact_opened_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_contact_opened_by_c a114 
	on (a11.opened_by_key = a114.row_key)  
union
select 'ldb.d_region_c a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_region_c a115 
	on (a11.region_key = a115.row_key)  
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_calendar_date a12 
 on (a11.last_resolved_on_key = a12.row_key) 
	join ldb.d_calendar_month a116 
	on (a12.month_start_date_key = a116.row_key)  
union
select 'ldb.d_ad_hoc_request_on_hold_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_on_hold_type_c a117 
	on (a11.on_hold_type_key = a117.row_key)  
union
select 'ldb.d_service_business_service_c a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_service_business_service_c a118 
	on (a11.business_service_key = a118.row_key)  
union
select 'ldb.d_internal_contact_requested_for a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_contact_requested_for a119 
	on (a11.requested_for_key = a119.row_key)  
union
select 'ldb.d_internal_contact_resolved_by_c a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_contact_resolved_by_c a120 
	on (a11.last_resolved_by_key = a120.row_key)  
union
select 'ldb.d_ad_hoc_request_priority_c a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_priority_c a121 
	on (a11.priority_src_key = a121.row_key)  
union
select 'ldb.d_ad_hoc_request_reported_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_reported_type_c a122 
	on (a11.reported_type_src_key = a122.row_key)  
union
select 'ldb.d_ad_hoc_request_state_c a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_ad_hoc_request_state_c a123 
	on (a11.state_src_key = a123.row_key)  
union
select 'ldb.d_internal_organization_support_group_c a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_organization_support_group_c a124 
	on (a11.support_group_key = a124.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_organization_vendor_c a125 
	on (a11.vendor_key = a125.row_key)  
union
select 'ldb.d_internal_contact_queue_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_internal_organization_group a16 
 on (a11.assignment_group_key = a16.row_key) 
	join ldb.d_internal_contact_queue_manager_c a126 
	on (a16.queue_manager_c_key = a126.row_key)  
union
select 'ldb.d_calendar_year a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ad_hoc_request_resolved_c a11 
 join ldb.d_calendar_date a12 
 on (a11.last_resolved_on_key = a12.row_key) 
	join ldb.d_calendar_year a127 
	on (a12.year_start_date_key = a127.row_key)  

