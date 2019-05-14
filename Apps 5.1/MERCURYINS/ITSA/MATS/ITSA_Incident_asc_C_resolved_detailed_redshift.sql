select 'ldb.f_incident_asc_resolved_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_calendar_time       a12
on (a11.asc_incident_opened_time_c_key = a12.row_key)
union
select'ldb.d_incident_asc_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_incident_asc_c       a13
on (a11.incident_asc_c_key = a13.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_business_service       a14
on (a11.asc_incident_business_service_c_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_calendar_date       a15
on (a11.asc_incident_last_resolved_on_c_key = a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_calendar_date       a15
on (a11.asc_incident_last_resolved_on_c_key = a15.row_key)
join ldb.d_calendar_month       a16
on (a15.month_start_date_key = a16.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_problem       a17
on (a11.asc_problem_c_key = a17.row_key)
union
select'ldb.d_lov_incident_asc_caller_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_caller_type_c       a18
on (a11.asc_incident_caller_type_c_key = a18.row_key)
union
select'ldb.d_lov_incident_asc_lob_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_lob_c       a19
on (a11.asc_incident_line_of_business_c_key = a19.row_key)
union
select'ldb.d_lov_incident_asc_contact_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_contact_type_c       a110
on (a11.asc_incident_contact_type_c_key = a110.row_key)
union
select'ldb.d_lov_incident_asc_resolution_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_resolution_type_c       a111
on (a11.asc_incident_resolution_type_c_key = a111.row_key)
union
select'ldb.d_lov_incident_asc_escalation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_escalation_c       a112
on (a11.asc_incident_escalation_c_key = a112.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_contact_assigned_to       a113
on (a11.asc_incident_assigned_to_c_key = a113.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_organization_group       a114
on (a11.asc_incident_assignment_group_c_key = a114.row_key)
union
select'ldb.d_internal_contact_caller_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_contact_caller_c       a115
on (a11.asc_incident_caller_c_key = a115.row_key)
union
select'ldb.d_internal_contact_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_contact_closed_by_c       a116
on (a11.asc_incident_last_resolved_by_c_key = a116.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_configuration_item       a117
on (a11.asc_incident_configuration_item_c_key = a117.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_contact_opened_by_c       a118
on (a11.asc_incident_opened_by_key = a118.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_organization_department       a119
on (a11.asc_incident_opened_by_department_c_key = a119.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11
 join ldb.d_calendar_time       a12
on (a11.asc_incident_opened_time_c_key = a12.row_key)
join ldb.d_calendar_time_hour       a120
on (a12.hour_24_format_num = a120.hour_24_format_num)
union
select'ldb.d_lov_incident_asc_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_impact_c       a121
on (a11.asc_incident_impact_c_key = a121.row_key)
union
select'ldb.d_lov_incident_asc_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_priority_c       a122
on (a11.asc_incident_priority_c_key = a122.row_key)
union
select'ldb.d_lov_incident_asc_urgency_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_lov_incident_asc_urgency_c       a123
on (a11.asc_incident_urgency_c_key = a123.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_location       a124
on (a11.asc_incident_location_c_key = a124.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.d_internal_contact       a125
on (a11.asc_incident_last_resolved_by_c_key = a125.row_key)
union
select'ldb.o_data_freshness' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
join ldb.o_data_freshness       a126
on (a11.source_id = a126.source_id)
union
select'ldb.d_lov_incident_asc_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_incident_asc_c       a13
on (a11.incident_asc_c_key = a13.row_key)
join ldb.d_lov_incident_asc_category_c       a127
on (a13.asc_incident_category_c_key = a127.row_key)
union
select'ldb.d_lov_incident_asc_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_incident_asc_c       a13
on (a11.incident_asc_c_key = a13.row_key)
join ldb.d_lov_incident_asc_state_c       a128
on (a13.asc_incident_state_c_key = a128.row_key)
union
select'ldb.d_lov_incident_asc_subcategory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11
 join ldb.d_incident_asc_c       a13
on (a11.incident_asc_c_key = a13.row_key)
join ldb.d_lov_incident_asc_subcategory_c       a129
on (a13.asc_incident_sub_category_c_key = a129.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11
 join ldb.d_business_service       a14
on (a11.asc_incident_business_service_c_key = a14.row_key)
join ldb.d_business_service_criticality       a130
on (a14.criticality_key = a130.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_business_service       a14
on (a11.asc_incident_business_service_c_key = a14.row_key)
join ldb.d_business_service_used_for       a131
on (a14.used_for_src_key = a131.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_calendar_date       a15
on (a11.asc_incident_last_resolved_on_c_key = a15.row_key)
join ldb.d_calendar_week       a132
on (a15.week_start_date_key = a132.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_calendar_date       a15
on (a11.asc_incident_last_resolved_on_c_key = a15.row_key)
join ldb.d_calendar_quarter       a133
on (a15.quarter_start_date_key = a133.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_resolved_c       a11 
 join ldb.d_calendar_date       a15
on (a11.asc_incident_last_resolved_on_c_key = a15.row_key)
join ldb.d_calendar_year       a134
on (a15.year_start_date_key = a134.row_key)
