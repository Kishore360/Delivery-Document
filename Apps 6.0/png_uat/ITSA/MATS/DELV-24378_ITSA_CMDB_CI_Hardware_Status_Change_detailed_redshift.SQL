select 'ldb.f_cmdb_ci_hardware_activity_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 union
select 'ldb.d_configuration_cmdb_ci_hardware_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_configuration_cmdb_ci_hardware_c a12 
	on (a11.cmdb_ci_hardware_c_key = a12.row_key)  
 union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_calendar_date a13 
	on (a11.date_key = a13.row_key)  
 union
select 'ldb.d_from_cmdb_ci_hardware_status_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_from_cmdb_ci_hardware_status_c a14 
	on (a11.from_cmdb_state_src_c_key = a14.row_key)  
 union
select 'ldb.d_to_cmdb_ci_hardware_status_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_to_cmdb_ci_hardware_status_c a15 
	on (a11.to_cmdb_ci_state_src_c_key = a15.row_key)  
 union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_calendar_date a13 
 on (a11.date_key = a13.row_key) 
	join ldb.d_calendar_month a16 
	on (a13.month_start_date_key = a16.row_key)  
 union
select 'ldb.d_current_cmdb_ci_hardware_status_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_cmdb_ci_hardware_activity_c a11 
 join ldb.d_configuration_cmdb_ci_hardware_c a12 
 on (a11.cmdb_ci_hardware_c_key = a12.row_key) 
	join ldb.d_current_cmdb_ci_hardware_status_c a17 
	on (a12.current_cmdb_ci_hardware_status_c = a17.row_key)  



