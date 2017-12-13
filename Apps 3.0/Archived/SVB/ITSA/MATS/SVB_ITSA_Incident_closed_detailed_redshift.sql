select 'ldb.f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact       a12
on (a11.closed_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.dh_assignment_group_type_hierarchy       a16
on (a11.assignment_group_key = a16.user_group_type_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a17
on (a11.closed_on_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_configuration_item_application_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_configuration_item_application_c       a19
on (a11.configuration_item_application_c_key = a19.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11
 join ldb.d_calendar_date       a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_year       a110
on (a17.year_start_date_key = a110.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_calendar_date       a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_week       a111
on (a17.week_start_date_key = a111.row_key)
union
select'ldb.d_incident_open_to_resolve_duration_agebucket_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_open_to_resolve_duration_agebucket_c       a112
on (a11.open_to_resolve_duration_bucket_c_key = a112.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_assigned_to       a113
on (a11.assigned_to_key = a113.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_legalentity       a114
on (a11.company_key = a114.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_department       a115
on (a11.opened_by_department_key = a115.row_key)
union
select'ldb.d_incident_dormancybucket' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_dormancybucket       a116
on (a11.dormancy_age_key = a116.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_internal_contact       a12
on (a11.closed_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a117
on (a12.row_current_key = a117.row_current_key)
union
select'ldb.d_lov_incident_environment_src_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_lov_incident_environment_src_c       a118
on (a11.inc_environment_c_src_key = a118.row_key)
union
select'ldb.d_escalation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_escalation_c       a119
on (a11.escalate_c_key = a119.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a120
on (a13.hour_24_format_num = a120.hour_24_format_num)
union
select'ldb.d_incident_agebucket' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_agebucket       a121
on (a11.age_key = a121.row_key)
union
select'ldb.d_lov_incident_type_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_lov_incident_type_incident_c       a122
on (a11.incident_type_src_c_key = a122.row_key)
union
select'ldb.d_incident_outage_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_outage_type_c       a123
on (a11.outage_type_c_key = a123.row_key)
union
select'ldb.d_parent_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_parent_incident       a124
on (a11.parent_incident_key = a124.row_key)
union
select'ldb.d_internal_contact_reported_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_reported_by_c       a125
on (a11.reported_by_c_key = a125.row_key)
union
select'ldb.d_incident_close_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_close_code_c       a126
on (a11.close_code_src_key = a126.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_impact       a127
on (a11.impact_src_key = a127.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_location       a128
on (a11.location_key = a128.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_priority       a129
on (a11.priority_src_key = a129.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_contacttype       a130
on (a11.reported_type_src_key = a130.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_urgency       a131
on (a11.urgency_src_key = a131.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_category       a133
on (a14.category_src_key = a133.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_close_code       a134
on (a14.close_code_src_key = a134.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_severity       a135
on (a14.severity_src_key = a135.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state       a136
on (a14.state_src_key = a136.row_key)
union
select'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_manager_c       a132
on (a15.manager_c_key = a132.row_key)
union
select'ldb.d_portfolio_owner_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
  join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_portfolio_owner_c       a137
on (a18.portfolio_owner_c_key = a137.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 join ldb.d_calendar_date       a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_month       a138
on (a17.month_start_date_key = a138.row_key)