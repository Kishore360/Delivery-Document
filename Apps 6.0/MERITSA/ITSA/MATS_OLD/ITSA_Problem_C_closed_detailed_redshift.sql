select 'ldb.f_problem_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem       a12
on (a11.problem_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_business_service       a18
on (a11.business_service_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_calendar_date       a19
on (a11.closed_on_key = a19.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_change_request       a110
on (a11.change_request_key = a110.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_configuration_item       a111
on (a11.configuration_item_key = a111.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_calendar_date       a19
on (a11.closed_on_key = a19.row_key)
join ldb.d_calendar_month       a112
on (a19.month_start_date_key = a112.row_key)
union
select'ldb.d_configuration_item_cmdb_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_configuration_item_cmdb_ci_c       a113
on (a11.cmdb_ci_c_key = a113.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
join ldb.d_internal_organization_department       a114
on (a13.department_key = a114.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a115
on (a13.row_current_key = a115.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour       a116
on (a14.hour_24_format_num = a116.hour_24_format_num)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_location       a117
on (a11.location_key = a117.row_key)
union
select'ldb.d_lov_problem_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_lov_problem_category_c       a118
on (a11.category_src_key = a118.row_key)
union
select'ldb.d_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_reported_type       a119
on (a11.reported_type_src_key = a119.row_key)
union
select'ldb.d_problem_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_impact       a120
on (a11.impact_src_key = a120.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_priority       a121
on (a11.priority_src_key = a121.row_key)
union
select'ldb.d_problem_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_problem_urgency       a122
on (a11.urgency_src_key = a122.row_key)
union
select'ldb.o_data_freshness' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.o_data_freshness       a123
on (a11.source_id = a123.source_id)
union
select'ldb.d_lov_problem_outage_scope_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_outage_scope_c       a129
on (a12.outage_scope_c_key = a129.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_state       a130
on (a12.state_src_key = a130.row_key)
union
select'ldb.d_lov_problem_root_cause_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_problem       a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_root_cause_category_c       a131
on (a12.root_cause_category_c_key = a131.row_key)
union
select'ldb.d_lov_problem_severity_level_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_problem       a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_severity_level_c       a132
on (a12.severity_level_c_key = a132.row_key)
union
select'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
join ldb.d_location_assigned_to       a124
on (a15.location_key = a124.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level1       a125
on (a17.lev_1_key = a125.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level2       a133
on (a17.lev_2_key = a133.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level3       a135
on (a17.lev_3_key = a135.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level4       a137
on (a17.lev_4_key = a137.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_business_service       a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_criticality       a126
on (a18.criticality_key = a126.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11 
 join ldb.d_business_service       a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_used_for       a127
on (a18.used_for_src_key = a127.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_calendar_date       a19
on (a11.closed_on_key = a19.row_key)
join ldb.d_calendar_week       a128
on (a19.week_start_date_key = a128.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_calendar_date       a19
on (a11.closed_on_key = a19.row_key)
join ldb.d_calendar_quarter       a134
on (a19.quarter_start_date_key = a134.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_closed       a11
 join ldb.d_calendar_date       a19
on (a11.closed_on_key = a19.row_key)
join ldb.d_calendar_year       a136
on (a19.year_start_date_key = a136.row_key)





