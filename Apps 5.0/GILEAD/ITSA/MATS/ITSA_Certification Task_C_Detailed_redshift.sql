select 'ldb.f_certification_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_internal_contact a12 
	on (a11.opened_by_key = a12.row_key)  
union
select 'ldb.d_certification_task_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_certification_task_c a13 
	on (a11.certification_task_c_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_internal_organization_group a15 
	on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_cert_schedule_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_cert_schedule_c a16 
	on (a11.cert_schedule_c_key = a16.row_key)  
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_configuration_item a17 
	on (a11.configuration_item_key = a17.row_key)  
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key) 
	join ldb.d_internal_contact_mdm a18 
	on (a12.row_current_key = a18.row_current_key)  
union
select 'ldb.d_internal_contact_opened_by_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_internal_contact_opened_by_c a19 
	on (a11.opened_by_key = a19.row_key)  
union
select 'ldb.d_certification_task_c_state a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_certification_task_c a11 
 join ldb.d_certification_task_c_state a110 
	on (a11.state_src_key = a110.row_key)  

