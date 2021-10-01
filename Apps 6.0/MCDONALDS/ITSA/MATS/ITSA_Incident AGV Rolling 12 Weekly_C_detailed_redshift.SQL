select 'ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 
union
select 'ldb.d_calendar_week_rolling_12_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 
 join ldb.d_calendar_week_rolling_12_c a13 
	on (a11.Week_Start_Date_Key_Rolling = a13.rolling_12_week)  
union
select 'ldb.d_calendar_week a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 
 join ldb.d_calendar_week_rolling_12_c a13 
 on (a11.Week_Start_Date_Key_Rolling = a13.rolling_12_week) 
	join ldb.d_calendar_week a14 
	on (a13.week_start_date_key = a14.row_key)  
union
select 'ldb.d_incident_priority a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 
 join ldb.d_incident_priority a15 
	on (a11.priority_src_key = a15.row_key)  
union
select 'ldb.d_internal_contact_group_vendor_name_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.n_incident_vdr_io_snapshot_dynamic_weekly_c a11 
 join ldb.d_internal_contact_group_vendor_name_c a16 
	on (a11.assignment_gp_vendor_key = a16.row_key) 

