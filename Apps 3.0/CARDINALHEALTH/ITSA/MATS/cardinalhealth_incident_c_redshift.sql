SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select     'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
union
select     'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_time     a13
on  (a11.opened_time_key=a13.row_key)
union
select     'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident     a14
on  (a11.incident_key=a14.row_key)
union
select     'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
union
select     'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
union
select     'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_assignment_group_level0_manager_c_relation     a17
on  (a11.assignment_group_key=a17.level0_assigment_group_key)
union
select     'ldb.d_assignment_group_level0_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_assignment_group_level0_vp_c_relation     a18
on  (a11.assignment_group_key=a18.level0_assigment_group_key)
union
select     'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
union
select     'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date     a110
on  (a11.opened_on_key=a110.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a111
on  (a16.lev_1_key=a111.level1_assigment_group_key)
union
select     'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a112
on  (a16.lev_1_key=a112.level1_assigment_group_key)
union
select     'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location     a113
on  (a11.location_key=a113.row_key)
union
select     'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm     a114
on  (a12.row_current_key=a114.row_current_key)
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact     a115
on  (a11.assigned_to_key=a115.row_key)
union
select     'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_legalentity     a116
on  (a11.company_key=a116.row_key)
union
select     'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_time     a13
on  (a11.opened_time_key=a13.row_key)
join ldb.d_calendar_time_hour     a117
on  (a13.hour_24_format_num=a117.hour_24_format_num)
union

select     'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_category     a118
on  (a11.category_src_key=a118.row_key)
union
select     'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_close_code     a119
on  (a11.close_code_src_key=a119.row_key)
union
select     'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location_assigned_to     a120
on  (a11.incident_location_c_key=a120.row_key)
union
select     'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_severity     a121
on  (a11.severity_src_key=a121.row_key)
union
select     'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_state     a122
on  (a11.state_src_key=a122.row_key)
union
select     'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_subcategory     a123
on  (a11.sub_category_src_key=a123.row_key)
union
select     'ldb.d_incident_verb_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_verb_c     a124
on  (a11.u_verb_src_c_key=a124.row_key)
union
select     'ldb.d_incident_major_incident_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_major_incident_state_c     a125
on  (a11.u_major_incident_state_src_c_key=a125.row_key)
union
select     'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_mdm     a126
on  (a11.opened_by_c_key=a126.row_current_key)
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact     a127
on  (a11.opened_on_behalf_of_c_key=a127.row_key)
union
select     'ldb.d_incident_impact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_impact_c     a128
on  (a11.u_impact_src_c_key=a128.row_key)
union
select     'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item     a129
on  (a11.u_system_name_c_key=a129.row_key)
union
select     'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_impact     a130
on  (a11.impact_src_key=a130.row_key)
union
select     'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_priority     a131
on  (a11.priority_src_key=a131.row_key)
union
select     'ldb.d_incident_contacttype_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_contacttype_c     a132
on  (a11.reported_type_src_key=a132.row_key)
union
select     'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_urgency     a133
on  (a11.urgency_src_key=a133.row_key)
union
select     'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
join ldb.dh_user_group_level1     a134
on  (a16.lev_1_key=a134.row_key)
union
select     'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_assignment_group_level0_manager_c_relation     a17
on  (a11.assignment_group_key=a17.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c     a135
on  (a17.level0_manager_c_key=a135.level0_manager_c_key)
union
select     'ldb.d_assignment_group_level0_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_assignment_group_level0_vp_c_relation     a18
on  (a11.assignment_group_key=a18.level0_assigment_group_key)
join ldb.d_assignment_group_level0_vp_c     a136
on  (a18.level0_vp_c_key=a136.level0_vp_c_key)
union
select     'ldb.d_config_item_cah_ci_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_config_item_cah_ci_type_c     a137
on  (a19.cah_ci_type_src_code_c_key=a137.row_key)
union
select     'ldb.d_config_item_cah_bus_criticl_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_config_item_cah_bus_criticl_c     a138
on  (a19.cah_bus_criticl_src_code_c_key=a138.row_key)
union
select     'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_config_item_cah_bus_segment_c     a139
on  (a19.cah_bus_segment_src_code_c_key=a139.row_key)
union
select     'ldb.d_config_item_cah_bus_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_config_item_cah_bus_unit_c     a140
on  (a19.cah_bus_unit_src_code_c_key=a140.row_key)
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_internal_contact     a141
on  (a19.eit_sup_leader_c_key=a141.row_key)
union
select     'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_date     a110
on  (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_month     a142
on  (a110.month_start_date_key=a142.row_key)
union
select     'ldb.d_config_item_cah_support_grp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item     a19
on  (a11.configuration_item_key=a19.row_key)
join ldb.d_config_item_cah_support_grp_c     a143
on  (a19.cah_support_grp_src_code_c_key=a143.row_key)
union
select     'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
 join ldb.d_calendar_date     a110
on  (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_week     a144
on  (a110.week_start_date_key=a144.row_key)
union
select     'ldb.d_internal_contact_director' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm     a114
on  (a12.row_current_key=a114.row_current_key)
join ldb.d_internal_contact_director     a145
on  (a114.director_c_key=a145.row_key)
union
select     'ldb.d_internal_contact_manager' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm     a114
on  (a12.row_current_key=a114.row_current_key)
join ldb.d_internal_contact_manager     a146
on  (a114.manager_c_key=a146.row_key)
union
select     'ldb.d_internal_contact_vp' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm     a114
on  (a12.row_current_key=a114.row_current_key)
join ldb.d_internal_contact_vp     a147
on  (a114.vp_c_key=a147.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a111
on  (a16.lev_1_key=a111.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c     a148
on  (a111.level1_manager_c_key=a148.level1_manager_c_key)
union
select     'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group     a15
on  (a11.assignment_group_key=a15.row_key)
join ldb.dh_user_group_hierarchy     a16
on  (a15.row_dn_key=a16.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a112
on  (a16.lev_1_key=a112.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c     a149
on  (a112.level1_vp_c_key=a149.level1_vp_c_key)
union
select     'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_date     a110
on  (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_quarter     a150
on  (a110.quarter_start_date_key=a150.row_key)
union
select     'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_date     a110
on  (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_year     a151
on  (a110.year_start_date_key=a151.row_key)
)a
)b



