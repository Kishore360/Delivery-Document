select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11
 join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key) 
join ldb.dh_user_group_level2         a113
on (a13.lev_2_key=a113.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11
join ldb.d_calendar_date         a15
on (a11.opened_on_key=a15.row_key) 
join ldb.d_calendar_month         a114
on (a15.month_start_date_key=a114.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
  join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key)
join ldb.dh_user_group_level3         a115
on (a13.lev_3_key=a115.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
  join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key)
join ldb.dh_user_group_level4         a116
on (a13.lev_4_key=a116.row_key)
union
select'ldb.dh_user_group_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11
 join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key) 
join ldb.dh_user_group_level5         a117
on (a13.lev_5_key=a117.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11 
 join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_state_c             a11
 join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key=a12.row_key)
join ldb.dh_user_group_hierarchy         a13
on (a12.row_dn_key=a13.lev_0_key) 
join ldb.dh_user_group_level1         a111
on (a13.lev_1_key=a111.row_key)
