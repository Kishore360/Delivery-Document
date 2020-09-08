select 'ldb.f_request_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key)  
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)  
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key) 
 join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key)  
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key) 
 join ldb.d_calendar_quarter a18 
 on (a17.quarter_start_date_key = a18.row_key)  
union
select 'ldb.d_request a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_request a19 
 on (a11.request_key = a19.row_key)  
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_configuration_item a110 
 on (a11.configuration_item_key = a110.row_key)  
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a111 
 on (a12.employee_mdm_key = a111.row_key)  
union
select 'ldb.d_calendar_time_hour a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_time a13 
 on (a11.time_key = a13.row_key) 
 join ldb.d_calendar_time_hour a112 
 on (a13.hour_key = a112.row_key)  
union
select 'ldb.d_location a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_location a113 
 on (a11.location_key = a113.row_key)  
union
select 'ldb.d_sc_request_priority a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_sc_request_priority a114 
 on (a11.request_priority_src_key = a114.row_key)  
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_keyword a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)join ldb.d_calendar_month a17 
 on (a16.month_start_date_key = a17.row_key)join ldb.d_calendar_quarter a18 
 on (a17.quarter_start_date_key = a18.row_key) 
 join ldb.d_calendar_year a115 
 on (a18.year_start_date_key = a115.row_key)  

