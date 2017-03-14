select 'ldb.f_ad_hoc_request_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
union
select'ldb.d_ci_autofill_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ci_autofill_c       a12
on (a11.ci_autofill_key=a12.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
union
select'ldb.d_ad_hoc_request_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_c       a15
on (a11.ad_hoc_request_c_key=a15.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_assigned_to       a16
on (a11.assigned_to_key=a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key=a17.row_key)
union
select'ldb.d_internal_contact_caller' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_caller       a18
on (a11.caller_key=a18.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_change_request       a19
on (a11.change_request_key=a19.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_cost_center       a110
on (a11.cost_center_key=a110.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_adhoc_requested_for_location_c       a111
on (a11.adhoc_requested_for_location_key=a111.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_opened_by_c       a112
on (a11.opened_by_key=a112.row_key)
union
select'ldb.d_region_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_region_c       a113
on (a11.region_key=a113.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
 join ldb.d_calendar_date       a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_month       a114
on (a14.month_start_date_key=a114.row_key)
union
select'ldb.d_service_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_service_business_service_c       a115
on (a11.business_service_key=a115.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_requested_for       a116
on (a11.requested_for_key=a116.row_key)
union
select'ldb.d_internal_contact_resolved_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_resolved_by_c       a117
on (a11.last_resolved_by_key=a117.row_key)
union
select'ldb.d_ad_hoc_request_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_priority_c       a118
on (a11.priority_src_key=a118.row_key)
union
select'ldb.d_ad_hoc_request_reported_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_reported_type_c       a119
on (a11.reported_type_src_key=a119.row_key)
union
select'ldb.d_ad_hoc_request_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_state_c       a120
on (a11.state_src_key=a120.row_key)
union
select'ldb.d_internal_organization_vendor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_vendor_c       a121
on (a11.vendor_key=a121.row_key)
union
select'ldb.d_ad_hoc_request_on_hold_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_on_hold_type_c a122
on (a11.on_hold_type_key=a122.row_key)
union
select'ldb.d_internal_organization_support_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_support_group_c       a123
on (a11.support_group_key=a123.row_key)
union
select'ldb.d_internal_organization_vendor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_business_service      a124
on (a11.business_service_key=a124.row_key)


