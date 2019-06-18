select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
	on (a11.opened_by_key = a12.row_key)  
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_master_item a13 
	on (a11.catalog_item_key = a13.row_key)  
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a14 
	on (a11.opened_on_key = a14.row_key)  
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item a15 
	on (a11.request_item_key = a15.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact_assigned_to a16 
	on (a11.assigned_to_key = a16.row_key)  
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_organization_department a17 
	on (a11.opened_by_department_key = a17.row_key)  
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
 on (a11.opened_by_key = a12.row_key) 
	join ldb.d_internal_contact_mdm a18 
	on (a12.row_current_key = a18.row_current_key)  
union
select 'ldb.d_request_item_state a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item_state a19 
	on (a11.state_src_key = a19.row_key)  
union
select 'ldb.d_calendar_week a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a14 
 on (a11.opened_on_key = a14.row_key) 
	join ldb.d_calendar_week a110 
	on (a14.week_start_date_key = a110.row_key)  
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a14 
 on (a11.opened_on_key = a14.row_key) 
	join ldb.d_calendar_month a111 
	on (a14.month_start_date_key = a111.row_key)  
union
select 'ldb.d_calendar_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a14 
 on (a11.opened_on_key = a14.row_key) 
	join ldb.d_calendar_quarter a112 
	on (a14.quarter_start_date_key = a112.row_key)  
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a14 
 on (a11.opened_on_key = a14.row_key) 
	join ldb.d_calendar_year a113 
	on (a14.year_start_date_key = a113.row_key) 

