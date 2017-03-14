select 'ldb.f_change_request_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_business_service       a13
on (a11.business_service_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request       a15
on (a11.change_request_key=a15.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a16
on (a11.configuration_item_key=a16.row_key)
union
select'ldb.d_ci_autofill_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_ci_autofill_c       a17
on (a11.ci_autofill_c_key=a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key=a18.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_group       a19
on (a11.assignment_group_key=a19.row_key)
union
select'ldb.d_internal_organization_business_approver_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_business_approver_c       a110
on (a11.business_approver_c_key=a110.row_key)
union
select'ldb.d_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_business_service_c       a111
on (a11.business_src_c_key=a111.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_category       a112
on (a11.category_src_key=a112.row_key)
union
select'ldb.d_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_impact       a113
on (a11.impact_src_key=a113.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_priority       a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_reason       a115
on (a11.reason_src_key=a115.row_key)
union
select'ldb.d_change_request_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_reported_type       a116
on (a11.reported_type_src_key=a116.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_state       a117
on (a11.state_src_key=a117.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_review_status       a118
on (a11.review_status_src_key=a118.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_risk       a119
on (a11.risk_src_key=a119.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_scope       a120
on (a11.scope_src_key=a120.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_type       a121
on (a11.type_src_key=a121.row_key)
union
select'ldb.d_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_urgency       a122
on (a11.urgency_src_key=a122.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_department       a123
on (a11.requested_by_department_key=a123.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_domain       a124
on (a11.domain_key=a124.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11
 join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm       a125
on (a12.row_current_key=a125.row_current_key)
union
select'ldb.d_internal_organization_gis_approval_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_gis_approval_c       a126
on (a11.gis_approval_group_c_key=a126.row_key)
union
select'ldb.d_implementation_result_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_implementation_result_c       a127
on (a11.implementation_result_src_c_key=a127.row_key)
union
select'ldb.d_outage_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_outage_type_c       a128
on (a11.outage_type_src_c_key=a128.row_key)
union
select'ldb.d_service_business_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_service_business_service_c       a129
on (a11.business_service_c_key=a129.row_key)
union
select'ldb.d_source_of_change_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_source_of_change_c       a130
on (a11.source_of_change_src_c_key=a130.row_key)
union
select'ldb.d_internal_organization_vendor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_vendor_c       a131
on (a11.vendor_c_key=a131.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_location       a132
on (a11.location_key=a132.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_business_service       a13
on (a11.business_service_key=a13.row_key)
join ldb.d_business_service_criticality       a133
on (a13.criticality_key=a133.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_business_service       a13
on (a11.business_service_key=a13.row_key)
join ldb.d_business_service_used_for       a134
on (a13.used_for_src_key=a134.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_month       a135
on (a14.month_start_date_key=a135.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_week       a136
on (a14.week_start_date_key=a136.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_calendar_date       a14
on (a11.closed_on_key=a14.row_key)
join ldb.d_calendar_quarter       a137
on (a14.quarter_start_date_key=a137.row_key)
union
select'ldb.d_change_request_region_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_change_request_region_c       a14
on (a11.region_c_key=a14.row_key)



