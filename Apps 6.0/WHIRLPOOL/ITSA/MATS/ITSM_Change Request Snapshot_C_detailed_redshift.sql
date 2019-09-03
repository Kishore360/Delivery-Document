select 'ldb.n_change_request_weekly_c a13 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 
union
select 'ldb.d_change_request a12 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 

	join ldb.d_change_request a12 
	on (a13.change_request_key = a12.row_key)  
union
select 'ldb.d_calendar_date_c a14 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 

	join ldb.d_calendar_date_c a14 
	on (a13.snapshot_taken_on_c_key = a14.row_key)  
union
select 'ldb.d_change_request_approval_c a15 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 

	join ldb.d_change_request_approval_c a15 
	on (a13.approval_state_src_key = a15.row_key)  
union
select 'ldb.d_change_request_state_c a16 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 

	join ldb.d_change_request_state_c a16 
	on (a13.state_src_key = a16.row_key)  
union
select 'ldb.d_calendar_week_c a17 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 
 join ldb.d_calendar_date_c a14 
 on (a13.snapshot_taken_on_c_key = a14.row_key) 
	join ldb.d_calendar_week_c a17 
	on (a14.week_start_date_key = a17.row_key)  
union
select 'ldb.d_calendar_month_c a18 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 
 join ldb.d_calendar_date_c a14 
 on (a13.snapshot_taken_on_c_key = a14.row_key) 
	join ldb.d_calendar_month_c a18 
	on (a14.month_start_date_key = a18.row_key)  
union
select 'ldb.d_calendar_quarter_c a19 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 
 join ldb.d_calendar_date_c a14 
 on (a13.snapshot_taken_on_c_key = a14.row_key) 
	join ldb.d_calendar_quarter_c a19 
	on (a14.quarter_start_date_key = a19.row_key)  
union
select 'ldb.d_calendar_year_c a110 ' as Table_name, count(a13.row_key) Row_Count
 from ldb.n_change_request_weekly_c a13 
 join ldb.d_calendar_date_c a14 
 on (a13.snapshot_taken_on_c_key = a14.row_key) 
	join ldb.d_calendar_year_c a110 
	on (a14.year_start_date_key = a110.row_key) 

