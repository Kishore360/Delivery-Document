select 'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem       a14
on (a11.problem_key = a14.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_date       a19
on (a11.opened_on_key = a19.row_key)
union
select'ldb.d_problem_application_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_application_c       a110
on (a11.application_c_key = a110.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_change_request       a111
on (a11.change_request_key = a111.row_key)
union
select'ldb.d_internal_contact_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact_closed_by_c       a112
on (a11.closed_by_key = a112.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_organization_department       a113
on (a11.opened_by_department_key = a113.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a114
on (a12.row_current_key = a114.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a115
on (a13.hour_24_format_num = a115.hour_24_format_num)
union
select'ldb.d_problem_it_provider_service_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_it_provider_service_c       a116
on (a11.it_provider_service_c_key = a116.row_key)
union
select'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact_opened_by_c       a117
on (a11.opened_by_key = a117.row_key)
union
select'ldb.d_problem_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_impact       a118
on (a11.impact_src_key = a118.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_priority       a119
on (a11.priority_src_key = a119.row_key)
union
select'ldb.d_problem_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_reported_type       a120
on (a11.reported_type_src_key = a120.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_state       a121
on (a11.state_src_key = a121.row_key)
union
select'ldb.d_problem_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_urgency       a122
on (a11.urgency_src_key = a122.row_key)
union
select'ldb.d_problem_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_state_c       a123
on (a11.state_state_src_key = a123.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_location       a124
on (a11.location_key = a124.row_key)
union
select'ldb.d_problem_complexity_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11
 join ldb.d_problem       a14
on (a11.problem_key = a14.row_key)
join ldb.d_problem_complexity_c       a127
on (a14.complexity_src_c_key = a127.row_key)
union
select'ldb.d_problem_escalation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11
 join ldb.d_problem       a14
on (a11.problem_key = a14.row_key)
join ldb.d_problem_escalation_c       a128
on (a14.escalation_src_c_key = a128.row_key)
union
select'ldb.d_problem_resolution_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_problem       a14
on (a11.problem_key = a14.row_key)
join ldb.d_problem_resolution_code_c       a130
on (a14.resolution_code_src_c_key = a130.row_key)
union
select'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11
 join ldb.d_internal_contact_assigned_to       a15
on (a11.assigned_to_key = a15.row_key)
join ldb.d_location_assigned_to       a125
on (a15.location_key = a125.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level1       a126
on (a17.lev_1_key = a126.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level2       a131
on (a17.lev_2_key = a131.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level3       a132
on (a17.lev_3_key = a132.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11
 join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy       a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level4       a133
on (a17.lev_4_key = a133.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_calendar_date       a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_month       a129
on (a19.month_start_date_key = a129.row_key)






