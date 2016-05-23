SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
union
select  'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item           a12
on (a11.configuration_item_key = a12.row_key)
union
select  'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date           a13
on (a11.opened_on_key = a13.row_key)
union
select  'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
union
select  'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
union
select  'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation           a16
on (a15.lev_1_key = a16.level1_assigment_group_key)
union
select  'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation           a17
on (a15.lev_1_key = a17.level1_assigment_group_key)
union
select  'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident           a18
on (a11.incident_key = a18.row_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact           a19
on (a11.assigned_to_key = a19.row_key)
union
select  'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_configuration_item           a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_config_item_cah_bus_segment_c           a110
on (a12.cah_bus_segment_src_code_c_key = a110.row_key)
union
select  'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11
 join ldb.d_calendar_date           a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month           a111
on (a13.month_start_date_key = a111.row_key)
union
select  'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level1           a112
on (a15.lev_1_key = a112.row_key)
union
select  'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation           a16
on (a15.lev_1_key = a16.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c           a113
on (a16.level1_manager_c_key = a113.level1_manager_c_key)
union
select  'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy           a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation           a17
on (a15.lev_1_key = a17.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c           a114
on (a17.level1_vp_c_key = a114.level1_vp_c_key)
)a
)b

