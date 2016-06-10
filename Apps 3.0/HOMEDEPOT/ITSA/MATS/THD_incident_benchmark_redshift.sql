select'ldb.f_incident_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_calendar_date       a13
on (a11.last_resolved_on_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key=a15.lev_0_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
join ldb.d_task_priority       a16
on (a11.priority_src_key=a16.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_category       a17
on (a12.category_src_key=a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
 join ldb.d_calendar_date       a13
on (a11.last_resolved_on_key=a13.row_key)
join ldb.d_calendar_month       a18
on (a13.month_start_date_key=a18.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key=a15.lev_0_key)
join ldb.dh_user_group_level1       a19k
on (a15.lev_1_key=a19.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key=a15.lev_0_key)
join ldb.dh_user_group_level2       a110
on (a15.lev_2_key=a110.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key=a15.lev_0_key)
join ldb.dh_user_group_level3       a111
on (a15.lev_3_key=a111.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved       a11 
  join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy       a15
on (a14.row_dn_key=a15.lev_0_key)
join ldb.dh_user_group_level4       a112
on (a15.lev_4_key=a112.row_key)


