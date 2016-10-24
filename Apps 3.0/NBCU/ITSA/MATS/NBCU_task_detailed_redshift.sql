
select'ldb.f_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
union
select'ldb.d_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_task_ra_c       a16
on (a11.task_key=a16.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_master_item       a17
on (a11.catalog_item_key=a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key=a18.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key=a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count

  from  ldb.f_task_c       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm       a110
on (a12.row_current_key=a110.row_current_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_task_priority       a111
on (a11.priority_src_key=a111.row_key)
union
select'ldb.d_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
join ldb.d_task_state_c       a112
on (a11.state_src_key=a112.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
join ldb.dh_user_group_level1       a113
on (a14.lev_1_key=a113.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
join ldb.dh_user_group_level2       a114
on (a14.lev_2_key=a114.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
join ldb.dh_user_group_level3       a116
on (a14.lev_3_key=a116.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
join ldb.dh_user_group_level4       a117
on (a14.lev_4_key=a117.row_key)
union
select'ldb.dh_user_group_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key=a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key=a14.lev_0_key)
join ldb.dh_user_group_level5       a118
on (a14.lev_5_key=a118.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
join ldb.d_calendar_week       a115
on (a15.week_start_date_key=a115.row_key)
union
row_count, select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_c       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
join ldb.d_calendar_quarter       a119
on (a15.quarter_start_date_key=a119.row_key)




