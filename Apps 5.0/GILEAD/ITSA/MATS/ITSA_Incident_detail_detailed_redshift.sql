select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key)  
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key)  
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key) 
 join ldb.dh_user_group_hierarchy a14 
 on (a13.row_dn_key = a14.lev_0_key)  
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a15 
 on (a11.opened_on_key = a15.row_key)  
union
select 'ldb.d_internal_contact_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a16 
 on (a12.row_current_key = a16.row_current_key)  
union
select 'ldb.d_employee_location a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key)join ldb.d_internal_contact_mdm a16 
 on (a12.row_current_key = a16.row_current_key) 
 join ldb.d_employee_location a17 
 on (a16.location_key = a17.row_key)  
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a18 
 on (a11.incident_key = a18.row_key)  
union
select 'ldb.d_incident_priority a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a18 
 on (a11.incident_key = a18.row_key) 
 join ldb.d_incident_priority a19 
 on (a18.priority_src_key = a19.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_assigned_to a110 
 on (a11.assigned_to_key = a110.row_key)  
union
select 'ldb.d_incident_contacttype a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident_contacttype a111 
 on (a11.reported_type_src_key = a111.row_key)  
union
select 'ldb.dh_user_group_level1 a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key)join ldb.dh_user_group_hierarchy a14 
 on (a13.row_dn_key = a14.lev_0_key) 
 join ldb.dh_user_group_level1 a112 
 on (a14.lev_1_key = a112.row_key)  
union
select 'ldb.d_incident_category a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a18 
 on (a11.incident_key = a18.row_key) 
 join ldb.d_incident_category a113 
 on (a18.category_src_key = a113.row_key)  
union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a18 
 on (a11.incident_key = a18.row_key) 
 join ldb.d_incident_state a114 
 on (a18.state_src_key = a114.row_key)  
union
select 'ldb.d_incident_subcategory a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a18 
 on (a11.incident_key = a18.row_key) 
 join ldb.d_incident_subcategory a115 
 on (a18.sub_category_src_key = a115.row_key)  
union
select 'ldb.dh_user_group_level2 a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key)join ldb.dh_user_group_hierarchy a14 
 on (a13.row_dn_key = a14.lev_0_key) 
 join ldb.dh_user_group_level2 a116 
 on (a14.lev_2_key = a116.row_key)  
union
select 'ldb.dh_user_group_level3 a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key)join ldb.dh_user_group_hierarchy a14 
 on (a13.row_dn_key = a14.lev_0_key) 
 join ldb.dh_user_group_level3 a117 
 on (a14.lev_3_key = a117.row_key)  
union
select 'ldb.dh_user_group_level4 a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key)join ldb.dh_user_group_hierarchy a14 
 on (a13.row_dn_key = a14.lev_0_key) 
 join ldb.dh_user_group_level4 a118 
 on (a14.lev_4_key = a118.row_key)  

