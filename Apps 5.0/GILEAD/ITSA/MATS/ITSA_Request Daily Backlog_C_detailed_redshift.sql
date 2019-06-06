select 'ldb.f_request a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
union
select 'ldb.d_sc_request_request_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_sc_request_request_state a12 
	on (a11.state_src_key = a12.row_key)  
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_calendar_date a13 
	on (a11.opened_on_key = a13.row_key)  
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_internal_organization_group a14 
	on (a11.assignment_group_key = a14.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_internal_contact_assigned_to a15 
	on (a11.assigned_to_key = a15.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_internal_organization_group a14 
 on (a11.assignment_group_key = a14.row_key) 
	join ldb.d_internal_organization_vendor_c a16 
	on (a14.vendor_c_key = a16.row_key)  
union
select 'ldb.d_internal_contact_owner_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request a11 
 join ldb.d_internal_organization_group a14 
 on (a11.assignment_group_key = a14.row_key) 
	join ldb.d_internal_contact_owner_c a17 
	on (a14.owner_c_key = a17.row_key) 

