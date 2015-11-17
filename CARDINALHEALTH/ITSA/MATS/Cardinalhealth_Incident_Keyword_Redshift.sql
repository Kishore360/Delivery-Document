SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
union
select  'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_organization_department           a12
on (a11.opened_by_department_key = a12.row_key)
union
select  'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_customer           a13
on (a11.customer_key = a13.row_key)
union
select  'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_calendar_time           a14
on (a11.opened_time_key = a14.row_key)
union
select  'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident           a15
on (a11.table_row_key = a15.row_key)
union
select  'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
union
select  'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
union
select  'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_assignment_group_level0_manager_c_relation           a18
on (a11.assignment_group_key = a18.level0_assigment_group_key)
union
select  'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.dh_assignment_group_tier_hierarchy           a19
on (a11.assignment_group_key = a19.user_group_tier_key)
union
select  'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.dh_assignment_group_type_hierarchy           a110
on (a11.assignment_group_key = a110.user_group_type_key)
union
select  'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
union
select  'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_calendar_date           a112
on (a11.opened_on_key = a112.row_key)
union
select  'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
  join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation           a113
on (a17.lev_1_key = a113.level1_assigment_group_key)
union
select  'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11  
 join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation           a114
on (a17.lev_1_key = a114.level1_assigment_group_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_contact           a115
on (a11.assigned_to_key = a115.row_key)
union
select  'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_customer           a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm           a116
on (a13.row_current_key = a116.row_current_key)
union
select  'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_calendar_time           a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour           a117
on (a14.hour_24_format_num = a117.hour_24_format_num)
union
select  'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_location_assigned_to           a118
on (a11.incident_location_c_key = a118.row_key)
union
select  'ldb.d_incident_verb_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_verb_c           a119
on (a11.u_verb_src_c_key = a119.row_key)
union
select  'ldb.d_incident_major_incident_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_major_incident_state_c           a120
on (a11.u_major_incident_state_src_c_key = a120.row_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_internal_contact           a121
on (a11.opened_on_behalf_of_c_key = a121.row_key)
union
select  'ldb.d_incident_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_impact_c           a122
on (a11.u_impact_src_c_key = a122.row_key)
union
select  'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_task_priority           a123
on (a11.priority_src_key = a123.row_key)
union
select  'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.dh_user_group_level1           a124
on (a17.lev_1_key = a124.row_key)
union
select  'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_assignment_group_level0_manager_c_relation           a18
on (a11.assignment_group_key = a18.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c           a125
on (a18.level0_manager_c_key = a125.level0_manager_c_key)
union
select  'ldb.d_config_item_cah_ci_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_config_item_cah_ci_type_c           a126
on (a111.cah_ci_type_src_code_c_key = a126.row_key)
union
select  'ldb.d_config_item_cah_bus_criticl_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_config_item_cah_bus_criticl_c           a127
on (a111.cah_bus_criticl_src_code_c_key = a127.row_key)
union
select  'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_config_item_cah_bus_segment_c           a128
on (a111.cah_bus_segment_src_code_c_key = a128.row_key)
union
select  'ldb.d_config_item_cah_bus_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_config_item_cah_bus_unit_c           a129
on (a111.cah_bus_unit_src_code_c_key = a129.row_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_internal_contact           a130
on (a111.eit_sup_leader_c_key = a130.row_key)
union
select  'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_calendar_date           a112
on (a11.opened_on_key = a112.row_key)
join ldb.d_calendar_month           a131
on (a112.month_start_date_key = a131.row_key)
union
select  'ldb.d_config_item_cah_support_grp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_configuration_item           a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_config_item_cah_support_grp_c           a132
on (a111.cah_support_grp_src_code_c_key = a132.row_key)
union
select  'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_calendar_date           a112
on (a11.opened_on_key = a112.row_key)
join ldb.d_calendar_week           a133
on (a112.week_start_date_key = a133.row_key)
union
select  'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
  join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation           a113
on (a17.lev_1_key = a113.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c           a134
on (a113.level1_manager_c_key = a134.level1_manager_c_key)
union
select  'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_internal_organization_group           a16
on (a11.assignment_group_key = a16.row_key)
join ldb.dh_user_group_hierarchy           a17
on (a16.row_dn_key = a17.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation           a114
on (a17.lev_1_key = a114.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c           a135
on (a114.level1_vp_c_key = a135.level1_vp_c_key)
union
select  'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 join ldb.d_calendar_date           a112
on (a11.opened_on_key = a112.row_key)
join ldb.d_calendar_quarter           a136
on (a112.quarter_start_date_key = a136.row_key)
union
select  'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword             a11
 join ldb.d_calendar_date           a112
on (a11.opened_on_key = a112.row_key)
join ldb.d_calendar_year           a137
on (a112.year_start_date_key = a137.row_key)
)a
)b



