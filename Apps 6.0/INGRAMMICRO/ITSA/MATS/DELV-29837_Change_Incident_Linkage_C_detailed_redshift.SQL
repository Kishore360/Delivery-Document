select 'ldb.f_change_incident_linkage_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 union
select 'ldb.d_change_incident_linkage_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
	on (a11.change_incident_linkage_c_key = a12.row_key)  
 union
select 'ldb.d_change_chg_to_inc_linkage_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_change_chg_to_inc_linkage_c a13 
	on (a12.change_c_key = a13.row_key)  
 union
select 'ldb.d_incident_chg_to_inc_linkage_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_incident_chg_to_inc_linkage_c a14 
	on (a12.incident_c_key = a14.row_key)  
 union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_calendar_date a15 
	on (a11.date_c_key = a15.row_key)  
 union
select 'ldb.d_chg2inc_change_configuration_item_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_chg2inc_change_configuration_item_c a16 
	on (a12.change_ci_c_key = a16.row_key)  
 union
select 'ldb.d_lov_chg2inc_days_difference_bucket_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_lov_chg2inc_days_difference_bucket_c a17 
	on (a12.time_difference_bucket_c_key = a17.row_key)  
 union
select 'ldb.d_chg2inc_incident_configuration_item_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_chg2inc_incident_configuration_item_c a18 
	on (a12.incident_ci_c_key = a18.row_key)  
 union
select 'ldb.d_lov_chg2inc_keywords_count_bucket_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_lov_chg2inc_keywords_count_bucket_c a19 
	on (a12.common_keywords_bucket_c_key = a19.row_key)  
 union
select 'ldb.d_lov_chg2inc_pair_possibility_c a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) 
	join ldb.d_lov_chg2inc_pair_possibility_c a110 
	on (a12.pair_possibility_bucket_c_key = a110.row_key)  
 union
select 'ldb.d_chg2inc_change_assigned_to_c a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) join ldb.d_change_chg_to_inc_linkage_c a13 
 on (a12.change_c_key = a13.row_key) 
	join ldb.d_chg2inc_change_assigned_to_c a111 
	on (a13.chg2inc_change_assigned_to_c_key = a111.row_key)  
 union
select 'ldb.d_chg2inc_change_assignment_group_c a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) join ldb.d_change_chg_to_inc_linkage_c a13 
 on (a12.change_c_key = a13.row_key) 
	join ldb.d_chg2inc_change_assignment_group_c a112 
	on (a13.chg2inc_change_assignment_group_c_key = a112.row_key)  
 union
select 'ldb.d_chg2inc_incident_assignment_group_c a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) join ldb.d_incident_chg_to_inc_linkage_c a14 
 on (a12.incident_c_key = a14.row_key) 
	join ldb.d_chg2inc_incident_assignment_group_c a113 
	on (a14.chg2inc_incident_assignment_group_c_key = a113.row_key)  
 union
select 'ldb.d_chg2inc_incident_assigned_to_c a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_change_incident_linkage_c a12 
 on (a11.change_incident_linkage_c_key = a12.row_key) join ldb.d_incident_chg_to_inc_linkage_c a14 
 on (a12.incident_c_key = a14.row_key) 
	join ldb.d_chg2inc_incident_assigned_to_c a114 
	on (a14.chg2inc_incident_assigned_to_c_key = a114.row_key)  
 union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_incident_linkage_c a11 
 join ldb.d_calendar_date a15 
 on (a11.date_c_key = a15.row_key) 
	join ldb.d_calendar_month a115 
	on (a15.month_start_date_key = a115.row_key)  


