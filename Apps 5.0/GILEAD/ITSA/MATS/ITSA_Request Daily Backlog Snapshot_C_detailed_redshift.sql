select 'ldb.n_request_snapshot_daily_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
 join ldb.d_calendar_date a12 
	on (a11.n_key = a12.row_key)  
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
 join ldb.d_internal_organization_group a13 
	on (a11.assignment_group_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
 join ldb.d_internal_contact_assigned_to a14 
	on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_vendor_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key) 
	join ldb.d_internal_organization_vendor_c a15 
	on (a13.vendor_c_key = a15.row_key)  
union
select 'ldb.d_internal_contact_owner_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_request_snapshot_daily_c a11 
 join ldb.d_internal_organization_group a13 
 on (a11.assignment_group_key = a13.row_key) 
	join ldb.d_internal_contact_owner_c a16 
	on (a13.owner_c_key = a16.row_key) 

