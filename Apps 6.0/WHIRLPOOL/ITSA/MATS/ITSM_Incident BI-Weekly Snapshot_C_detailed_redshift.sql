select 'ldb.n_incident_weekly a11 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
union
select 'ldb.d_affected_user_location_c a12 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_affected_user_location_c a12 
	on (a11.country_c_key = a12.row_key)  
union
select 'ldb.d_location_region_c a13 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_location_region_c a13 
	on (a11.lkp_region_c_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_internal_organization_group a15 
	on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_configuration_item a16 
	on (a11.configuration_item_key = a16.row_key)  
union
select 'ldb.d_incident_agebucket a17 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_incident_agebucket a17 
	on (a11.age_key = a17.row_key)  
union
select 'ldb.d_incident_state a18 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_incident_state a18 
	on (a11.state_src_key = a18.row_key)  
union
select 'ldb.d_region_c a19 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_region_c a19 
	on (a11.region_c_key = a19.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a110 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_internal_organization_vendor_c a110 
	on (a11.vendor_c_key = a110.row_key)  
union
select 'ldb.d_task_priority a111 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_task_priority a111 
	on (a11.priority_src_key = a111.row_key)  
union
select 'ldb.d_task_contacttype a112 ' as Table_name, count(a11.country_c_key) Row_Count
 from ldb.n_incident_weekly a11 
 join ldb.d_task_contacttype a112 
	on (a11.reported_type_src_key = a112.row_key)  

