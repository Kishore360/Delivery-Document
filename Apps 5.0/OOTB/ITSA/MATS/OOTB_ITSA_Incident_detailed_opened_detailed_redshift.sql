select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
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
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a16
on (a12.row_current_key = a16.row_current_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_priority       a18
on (a17.priority_src_key = a18.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key = a19.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident_contacttype       a110
on (a11.reported_type_src_key = a110.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level1       a111
on (a14.lev_1_key = a111.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level2       a119
on (a14.lev_2_key = a119.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level3       a120
on (a14.lev_3_key = a120.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_organization_group       a13
on (a11.assignment_group_key = a13.row_key)
join ldb.dh_user_group_hierarchy       a14
on (a13.row_dn_key = a14.lev_0_key)
join ldb.dh_user_group_level4       a121
on (a14.lev_4_key = a121.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month       a112
on (a15.month_start_date_key = a112.row_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a16
on (a12.row_current_key = a16.row_current_key)
join ldb.d_employee_location       a113
on (a16.location_key = a113.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_category       a114
on (a17.category_src_key = a114.row_key)
union
select'ldb.d_task_sla_resolution_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_task_sla_resolution_flag       a115
on (a17.met_resolution_sla_flag_key = a115.row_key)
union
select'ldb.d_task_sla_response_flag' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_task_sla_response_flag       a116
on (a17.met_response_sla_flag_key = a116.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_state       a117
on (a17.state_src_key = a117.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a17
on (a11.incident_key = a17.row_key)
join ldb.d_incident_subcategory       a118
on (a17.sub_category_src_key = a118.row_key)



