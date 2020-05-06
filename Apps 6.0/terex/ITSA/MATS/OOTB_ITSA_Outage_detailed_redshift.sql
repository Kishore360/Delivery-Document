select 'ldb.f_incident_outage' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
union
select'ldb.d_application' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_application       a12
on (a11.application_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_business_service' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
union
select'ldb.d_change_request_caused_by' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
union
select'ldb.d_outage' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_outage       a110
on (a11.outage_key = a110.row_key)
union
select'ldb.d_configuration_item_incident' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_configuration_item_incident       a111
on (a11.incident_configuration_item_key = a111.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_incident_contacttype       a112
on (a11.incident_reported_type_src_key = a112.row_key)
union
select'ldb.d_incident_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_incident_impact       a113
on (a11.incident_impact_src_key = a113.row_key)
union
select'ldb.d_incident_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
join ldb.d_incident_urgency       a114
on (a11.incident_urgency_src_key = a114.row_key)
union
select'ldb.d_application_tier' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_application       a12
on (a11.application_key = a12.row_key)
join ldb.d_application_tier       a115
on (a12.tier_src_key = a115.row_key)
union
select'ldb.d_application_used_for' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_application       a12
on (a11.application_key = a12.row_key)
join ldb.d_application_used_for       a116
on (a12.used_for_src_key = a116.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality       a117
on (a15.criticality_key = a117.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11
 join ldb.d_business_service       a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for       a118
on (a15.used_for_src_key = a118.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11
 join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_month       a119
on (a16.month_start_date_key = a119.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_week       a120
on (a16.week_start_date_key = a120.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_quarter       a132
on (a16.quarter_start_date__1_key = a132.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_year       a133
on (a16.year_start_date__1_key = a133.row_key)
union
select'ldb.d_internal_contact_caused_by_change' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_internal_contact_caused_by_change       a121
on (a17.assigned_to_key = a121.row_key)
union
select'ldb.d_internal_organization_caused_by_change' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_internal_organization_caused_by_change       a122
on (a17.assignment_group_key = a122.row_key)
union
select'ldb.d_change_request_caused_by_category' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_change_request_caused_by_category       a123
on (a17.category_src_key = a123.row_key)
union
select'ldb.d_configuration_item_caused_by_change' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_configuration_item_caused_by_change       a124
on (a17.configuration_item_key = a124.row_key)
union
select'ldb.d_change_request_caused_by_risk' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_change_request_caused_by_risk       a125
on (a17.risk_src_key = a125.row_key)
union
select'ldb.d_change_request_caused_by_scope' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_change_request_caused_by_scope       a126
on (a17.scope_src_key = a126.row_key)
union
select'ldb.d_change_request_caused_by_type' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11
 join ldb.d_change_request_caused_by       a17
on (a11.caused_by_change_key = a17.row_key)
join ldb.d_change_request_caused_by_type       a127
on (a17.type_src_key = a127.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_category       a128
on (a19.category_src_key = a128.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_priority       a129
on (a19.priority_src_key = a129.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_outage       a11 
 join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
join ldb.d_incident_subcategory       a130
on (a19.sub_category_src_key = a130.row_key)



