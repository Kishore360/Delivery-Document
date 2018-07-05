select 'ldb.f_incident_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
union
select'ldb.d_business_unit_assignment_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_business_unit_assignment_group_c       a12
on (a11.business_unit_assignment_group_c_key = a12.row_key)
union
select'ldb.d_assignment_group_support_group_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_business_unit_assignment_group_c       a12
on (a11.business_unit_assignment_group_c_key = a12.row_key)
join ldb.d_assignment_group_support_group_business_unit_c       a13
on (a12.business_unit_c_key = a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date       a18
on (a11.last_resolved_on_key = a18.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_change_request       a19
on (a11.change_request_key = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_configuration_item       a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_customer       a111
on (a11.customer_key = a111.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_contact       a112
on (a11.last_resolved_by_key = a112.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_time       a113
on (a11.opened_time_key = a113.row_key)
union
select'ldb.d_calendar_date_closed_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date_closed_c       a114
on (a11.last_resolved_on_key = a114.row_key)
union
select'ldb.d_calendar_date_opened_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date_opened_c       a115
on (a11.last_resolved_on_key = a115.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_problem       a116
on (a11.problem_key = a116.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_calendar_date       a18
on (a11.last_resolved_on_key = a18.row_key)
join ldb.d_calendar_quarter       a117
on (a18.quarter_start_date_key = a117.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_calendar_date       a18
on (a11.last_resolved_on_key = a18.row_key)
join ldb.d_calendar_week       a118
on (a18.week_start_date_key = a118.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_date       a18
on (a11.last_resolved_on_key = a18.row_key)
join ldb.d_calendar_year       a119
on (a18.year_start_date_key = a119.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_date       a18
on (a11.last_resolved_on_key = a18.row_key)
join ldb.d_calendar_month       a153
on (a18.month_start_date_key = a153.row_key)
union
select'ldb.d_parent_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_parent_incident       a120
on (a14.parent_incident_key = a120.row_key)
union
select'ldb.d_lov_incident_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_lov_incident_incident_type_c       a131
on (a14.incident_type_src_c_key = a131.row_key)
union
select'ldb.d_lov_incident_event_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_lov_incident_event_type_c       a137
on (a14.event_type_src_c_key = a137.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_category       a139
on (a14.category_src_key = a139.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_close_code       a140
on (a14.close_code_src_key = a140.row_key)
union
select'ldb.d_incident_opened_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_opened_by       a141
on (a14.opened_by_key = a141.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_priority       a142
on (a14.priority_src_key = a142.row_key)
union
select'ldb.d_task_sla_resolution_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_task_sla_resolution_flag       a143
on (a14.met_resolution_sla_flag_key = a143.row_key)
union
select'ldb.d_incident_resolved_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_resolved_by       a144
on (a14.resolved_by_key = a144.row_key)
union
select'ldb.d_task_sla_response_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_task_sla_response_flag       a145
on (a14.met_response_sla_flag_key = a145.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_severity       a146
on (a14.severity_src_key = a146.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state       a147
on (a14.state_src_key = a147.row_key)
union
select'ldb.d_lov_incident_sub_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_lov_incident_sub_status_c       a148
on (a14.sub_status_src_c_key = a148.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_subcategory       a149
on (a14.sub_category_src_key = a149.row_key)
union
select'ldb.d_internal_contact_vp_svp_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
  join ldb.d_business_unit_assignment_group_c       a12
on (a11.business_unit_assignment_group_c_key = a12.row_key)
join ldb.d_assignment_group_support_group_business_unit_c       a13
on (a12.business_unit_c_key = a13.row_key)
join ldb.d_internal_contact_vp_svp_incident_c       a121
on (a13.vp_svp_c_key = a121.row_key)
union
select'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality       a132
on (a17.criticality_key = a132.row_key)
union
select'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for       a133
on (a17.used_for_src_key = a133.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_customer       a111
on (a11.customer_key = a111.row_key)
join ldb.d_customer_mdm       a134
on (a111.row_current_key = a134.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_internal_contact       a112
on (a11.last_resolved_by_key = a112.row_key)
join ldb.d_internal_organization_department       a135
on (a112.department_key = a135.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_internal_contact       a112
on (a11.last_resolved_by_key = a112.row_key)
join ldb.d_internal_contact_mdm       a136
on (a112.row_current_key = a136.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_time       a113
on (a11.opened_time_key = a113.row_key)
join ldb.d_calendar_time_hour       a138
on (a113.hour_24_format_num = a138.hour_24_format_num)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_problem       a116
on (a11.problem_key = a116.row_key)
join ldb.d_problem_state       a150
on (a116.state_src_key = a150.row_key)
union
select'ldb.d_lov_problem_swat_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_problem       a116
on (a11.problem_key = a116.row_key)
join ldb.d_lov_problem_swat_code_c       a151
on (a116.swat_code_src_c_key = a151.row_key)
union
select'ldb.d_lov_problem_sub_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
 join ldb.d_problem       a116
on (a11.problem_key = a116.row_key)
join ldb.d_lov_problem_sub_status_c       a152
on (a116.sub_status_src_c_key = a152.row_key)




