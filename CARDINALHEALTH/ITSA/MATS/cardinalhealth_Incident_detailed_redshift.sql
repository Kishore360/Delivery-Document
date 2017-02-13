select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_time         a13
on (a11.opened_time_key=a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident         a14
on (a11.incident_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_group         a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_internal_organization_group         a15
on (a11.assignment_group_key=a15.row_key) 
join ldb.d_internal_contact_emp_seniors_c         a16
on (a15.manager_c_key=a16.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_assignment_group_level0_manager_c_relation         a17
on (a11.assignment_group_key=a17.level0_assigment_group_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date         a19
on (a11.opened_on_key=a19.row_key)
union
select'ldb.d_internal_organization_causal_assignment_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_causal_assignment_group_c        a110
on (a11.causal_assignment_group_c_key=a110.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_greg_fiscal_c        a111
on (a11.opened_on_key=a111.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_calendar_greg_fiscal_c        a111
on (a11.opened_on_key=a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a112
on (a111.fiscal_key=a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_calendar_date         a19
on (a11.opened_on_key=a19.row_key) 
join ldb.d_calendar_month        a113
on (a19.month_start_date_key=a113.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location        a114
on (a11.location_key=a114.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key) 
join ldb.d_internal_contact_mdm        a115
on (a12.row_current_key=a115.row_current_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_assigned_to        a116
on (a11.assigned_to_key=a116.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_legalentity        a117
on (a11.company_key=a117.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_calendar_time         a13
on (a11.opened_time_key=a13.row_key) 
join ldb.d_calendar_time_hour        a118
on (a13.hour_24_format_num=a118.hour_24_format_num)
union
select'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location_assigned_to        a119
on (a11.incident_location_c_key=a119.row_key)
union
select'ldb.d_incident_verb_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_verb_c        a120
on (a11.u_verb_src_c_key=a120.row_key)
union
select'ldb.d_location_incident_assigned_to_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location_incident_assigned_to_c        a121
on (a11.location_of_assigned_to_c_key=a121.row_key)
union
select'ldb.d_location_incident_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location_incident_opened_by_c        a122
on (a11.location_of_opened_by_c_key=a122.row_key)
union
select'ldb.d_incident_major_incident_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_major_incident_state_c        a123
on (a11.u_major_incident_state_src_c_key=a123.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_mdm        a124
on (a11.opened_by_c_key=a124.row_current_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact        a125
on (a11.opened_on_behalf_of_c_key=a125.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_problem        a126
on (a11.problem_key=a126.row_key)
union
select'ldb.d_incident_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_impact_c        a127
on (a11.u_impact_src_c_key=a127.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item        a128
on (a11.u_system_name_c_key=a128.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_task_closed_by        a129
on (a11.closed_by_key=a129.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_impact        a130
on (a11.impact_src_key=a130.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_priority        a131
on (a11.priority_src_key=a131.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_contacttype        a132
on (a11.reported_type_src_key=a132.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_urgency        a133
on (a11.urgency_src_key=a133.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_assignment_group_level0_manager_c_relation         a17
on (a11.assignment_group_key=a17.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c        a134
on (a17.level0_manager_c_key=a134.level0_manager_c_key)
union
select'ldb.d_config_item_cah_ci_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_config_item_cah_ci_type_c        a135
on (a18.cah_ci_type_src_code_c_key=a135.row_key)
union
select'ldb.d_config_item_cah_bus_criticl_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_config_item_cah_bus_criticl_c        a136
on (a18.cah_bus_criticl_src_code_c_key=a136.row_key)
union
select'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_config_item_cah_bus_segment_c        a137
on (a18.cah_bus_segment_src_code_c_key=a137.row_key)
union
select'ldb.d_config_item_cah_bus_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_config_item_cah_bus_unit_c        a138
on (a18.cah_bus_unit_src_code_c_key=a138.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_internal_organization_causal_assignment_group_c        a110
on (a11.causal_assignment_group_c_key=a110.row_key) 
join ldb.d_internal_contact_causal_assignment_group_director_c        a139
on (a110.director_c_key=a139.row_key)
union
select'ldb.d_internal_contact_assignment_grp_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_causal_assignment_group_c        a110
on (a11.causal_assignment_group_c_key=a110.row_key)
join ldb.d_internal_contact_assignment_grp_manager_c        a140
on (a110.manager_c_key=a140.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_internal_organization_causal_assignment_group_c        a110
on (a11.causal_assignment_group_c_key=a110.row_key) 
join ldb.d_internal_contact_causal_assignment_group_vp_c        a141
on (a110.vp_c_key=a141.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_internal_contact        a142
on (a18.eit_sup_leader_c_key=a142.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_incident         a14
on (a11.incident_key=a14.row_key) 
join ldb.d_incident_category        a143
on (a14.category_src_key=a143.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_incident         a14
on (a11.incident_key=a14.row_key) 
join ldb.d_incident_close_code        a144
on (a14.close_code_src_key=a144.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_incident         a14
on (a11.incident_key=a14.row_key) 
join ldb.d_incident_severity        a145
on (a14.severity_src_key=a145.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_incident         a14
on (a11.incident_key=a14.row_key) 
join ldb.d_incident_state        a146
on (a14.state_src_key=a146.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_incident         a14
on (a11.incident_key=a14.row_key)
join ldb.d_incident_subcategory        a147
on (a14.sub_category_src_key=a147.row_key)
union
select'ldb.d_config_item_cah_support_grp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_configuration_item         a18
on (a11.configuration_item_key=a18.row_key) 
join ldb.d_config_item_cah_support_grp_c        a148
on (a18.cah_support_grp_src_code_c_key=a148.row_key)
union
select'ldb.d_internal_contact_director' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key) 
join ldb.d_internal_contact_mdm        a115
on (a12.row_current_key=a115.row_current_key) 
join ldb.d_internal_contact_director        a149
on (a115.director_c_key=a149.row_key)
union
select'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key) 
join ldb.d_internal_contact_mdm        a115
on (a12.row_current_key=a115.row_current_key)
join ldb.d_internal_contact_manager        a150
on (a115.manager_c_key=a150.row_key)
union
select'ldb.d_internal_contact_vp' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key=a12.row_key) 
join ldb.d_internal_contact_mdm        a115
on (a12.row_current_key=a115.row_current_key)
join ldb.d_internal_contact_vp        a151
on (a115.vp_c_key=a151.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
join ldb.d_calendar_greg_fiscal_c        a111
on (a11.opened_on_key=a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a112
on (a111.fiscal_key=a112.row_key) 
join ldb.d_calendar_fiscal_period        a152
on (a112.period_start_date_key=a152.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_greg_fiscal_c        a111
on (a11.opened_on_key=a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a112
on (a111.fiscal_key=a112.row_key)
join ldb.d_calendar_fiscal_quarter        a153
on (a112.quarter_start_date_key=a153.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_greg_fiscal_c        a111
on (a11.opened_on_key=a111.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal        a112
on (a111.fiscal_key=a112.row_key)
join ldb.d_calendar_fiscal_year        a154
on (a112.year_start_date_key=a154.row_key)
