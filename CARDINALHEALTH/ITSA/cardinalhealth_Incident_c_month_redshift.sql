SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select     'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
union
select     'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item     a12
on (a11.configuration_item_key = a12.row_key)
union
select     'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date     a13
on (a11.opened_on_key = a13.row_key)
union
select     'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident     a14
on (a11.incident_key = a14.row_key)
union
select     'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_date     a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month     a15
on (a13.month_start_date_key = a15.row_key)
union
select     'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
union
select     'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
union
select     'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a14
on (a13.lev_1_key = a14.level1_assigment_group_key)
union
select     'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a15
on (a13.lev_1_key = a15.level1_assigment_group_key)
union
select     'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
  join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.dh_user_group_level1     a16
on (a13.lev_1_key = a16.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a14
on (a13.lev_1_key = a14.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c     a17
on (a14.level1_manager_c_key = a17.level1_manager_c_key)
union
select     'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_organization_group     a12
on (a11.assignment_group_key = a12.row_key)
join ldb.dh_user_group_hierarchy     a13
on (a12.row_dn_key = a13.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a15
on (a13.lev_1_key = a15.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c     a18
on (a15.level1_vp_c_key = a18.level1_vp_c_key) 
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact     a12
on (a11.row_key = a12.row_key)
union
select     'ldb.d_config_item_cah_bus_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_config_item_cah_bus_segment_c     a12
on (a11.row_key = a12.row_key)
union
select     'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join	ldb.d_calendar_date	a10
	  on 	(a11.opened_on_key = a10.row_key)
join ldb.d_calendar_month     a12
on (a10.month_start_date_key = a12.row_key)
)a
)b

