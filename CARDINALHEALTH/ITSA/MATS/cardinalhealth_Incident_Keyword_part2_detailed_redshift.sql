select'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_customer         a12
on (a11.customer_key=a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_calendar_time         a13
on (a11.opened_time_key=a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident         a14
on (a11.table_row_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_organization_group         a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_internal_organization_group         a15
on (a11.assignment_group_key=a15.row_key) 
join ldb.d_internal_contact_emp_seniors_c         a16
on (a15.manager_c_key=a16.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_assignment_group_level0_manager_c_relation         a17
on (a11.assignment_group_key=a17.level0_assigment_group_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.dh_assignment_group_tier_hierarchy         a18
on (a11.assignment_group_key=a18.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.dh_assignment_group_type_hierarchy         a19
on (a11.assignment_group_key=a19.user_group_type_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_calendar_date         a111
on (a11.opened_on_key=a111.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_calendar_greg_fiscal_c         a112
on (a11.opened_on_key=a112.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_greg_fiscal_c         a112
on (a11.opened_on_key=a112.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a113
on (a112.fiscal_key=a113.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_contact_assigned_to         a114
on (a11.assigned_to_key=a114.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_customer         a12
on (a11.customer_key=a12.row_key) 
join ldb.d_customer_mdm         a115
on (a12.row_current_key=a115.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_organization_department         a116
on (a11.opened_by_department_key=a116.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_time         a13
on (a11.opened_time_key=a13.row_key) 
join ldb.d_calendar_time_hour         a117
on (a13.hour_24_format_num=a117.hour_24_format_num)
union
select'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_location_assigned_to         a118
on (a11.incident_location_c_key=a118.row_key)
union
select'ldb.d_incident_verb_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_verb_c         a119
on (a11.u_verb_src_c_key=a119.row_key)
union
select'ldb.d_incident_major_incident_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_major_incident_state_c         a120
on (a11.u_major_incident_state_src_c_key=a120.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_contact         a121
on (a11.opened_on_behalf_of_c_key=a121.row_key)
union
select'ldb.d_incident_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_impact_c         a122
on (a11.u_impact_src_c_key=a122.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_task_priority         a123
on (a11.priority_src_key=a123.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_assignment_group_level0_manager_c_relation         a17
on (a11.assignment_group_key=a17.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c         a124
on (a17.level0_manager_c_key=a124.level0_manager_c_key)
union
select'ldb.d_config_item_cah_ci_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key) 
join ldb.d_config_item_cah_ci_type_c         a125
on (a110.cah_ci_type_src_code_c_key=a125.row_key)
union
select'ldb.d_config_item_cah_bus_criticl_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key) 
join ldb.d_config_item_cah_bus_criticl_c         a126
on (a110.cah_bus_criticl_src_code_c_key=a126.row_key)
union
select'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key) 
join ldb.d_config_item_cah_bus_segment_c         a127
on (a110.cah_bus_segment_src_code_c_key=a127.row_key)
union
select'ldb.d_config_item_cah_bus_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
 join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key)
join ldb.d_config_item_cah_bus_unit_c         a128
on (a110.cah_bus_unit_src_code_c_key=a128.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key) 
join ldb.d_internal_contact         a129
on (a110.eit_sup_leader_c_key=a129.row_key)
union
select'ldb.d_config_item_cah_support_grp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_configuration_item         a110
on (a11.configuration_item_key=a110.row_key) 
join ldb.d_config_item_cah_support_grp_c         a130
on (a110.cah_support_grp_src_code_c_key=a130.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_greg_fiscal_c         a112
on (a11.opened_on_key=a112.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a113
on (a112.fiscal_key=a113.row_key) 
join ldb.d_calendar_fiscal_period         a131
on (a113.period_start_date_key=a131.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_date         a111
on (a11.opened_on_key=a111.row_key) 
join ldb.d_calendar_month         a132
on (a111.month_start_date_key=a132.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_greg_fiscal_c         a112
on (a11.opened_on_key=a112.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a113
on (a112.fiscal_key=a113.row_key) 
join ldb.d_calendar_fiscal_quarter         a133
on (a113.quarter_start_date_key=a133.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
join ldb.d_calendar_greg_fiscal_c         a112
on (a11.opened_on_key=a112.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal         a113
on (a112.fiscal_key=a113.row_key) 
join ldb.d_calendar_fiscal_year         a134
on (a113.year_start_date_key=a134.row_key)
