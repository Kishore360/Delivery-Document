select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a15
on (a11.incident_key = a15.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority       a16
on (a15.priority_src_key = a16.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_state       a17
on (a15.state_src_key = a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key = a18.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a19
on (a12.month_start_date_key = a19.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level1       a110
on (a14.lev_1_key = a110.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level2       a111
on (a14.lev_2_key = a111.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level3       a112
on (a14.lev_3_key = a112.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level4       a113
on (a14.lev_4_key = a113.row_key)

