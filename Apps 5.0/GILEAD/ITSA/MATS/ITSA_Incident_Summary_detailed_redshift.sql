select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key)  
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_customer a13 
 on (a11.customer_key = a13.row_key)  
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key) 
 join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key)  
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_configuration_item a17 
 on (a11.configuration_item_key = a17.row_key)  
union
select 'ldb.d_incident_priority a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
 join ldb.d_incident_priority a18 
 on (a14.priority_src_key = a18.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_assigned_to a19 
 on (a11.assigned_to_key = a19.row_key)  
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_month a110 
 on (a12.month_start_date_key = a110.row_key)  
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a12 
 on (a11.opened_on_key = a12.row_key) 
 join ldb.d_calendar_week a111 
 on (a12.week_start_date_key = a111.row_key)  
union
select 'ldb.d_customer_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_customer a13 
 on (a11.customer_key = a13.row_key) 
 join ldb.d_customer_mdm a112 
 on (a13.row_current_key = a112.row_current_key)  
union
select 'ldb.d_domain a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_domain a113 
 on (a11.domain_key = a113.row_key)  
union
select 'ldb.d_incident_category a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
 join ldb.d_incident_category a114 
 on (a14.category_src_key = a114.row_key)  
union
select 'ldb.d_incident_state a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
 join ldb.d_incident_state a115 
 on (a14.state_src_key = a115.row_key)  
union
select 'ldb.d_incident_subcategory a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a14 
 on (a11.incident_key = a14.row_key) 
 join ldb.d_incident_subcategory a116 
 on (a14.sub_category_src_key = a116.row_key)  
union
select 'ldb.dh_user_group_level1 a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level1 a117 
 on (a16.lev_1_key = a117.row_key)  
union
select 'ldb.dh_user_group_level2 a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level2 a118 
 on (a16.lev_2_key = a118.row_key)  
union
select 'ldb.dh_user_group_level3 a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level3 a119 
 on (a16.lev_3_key = a119.row_key)  
union
select 'ldb.dh_user_group_level4 a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)join ldb.dh_user_group_hierarchy a16 
 on (a15.row_dn_key = a16.lev_0_key) 
 join ldb.dh_user_group_level4 a120 
 on (a16.lev_4_key = a120.row_key)  

