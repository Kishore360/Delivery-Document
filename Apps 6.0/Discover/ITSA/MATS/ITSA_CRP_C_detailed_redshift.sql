/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_change_failure
d_change_request
d_change_request_close_code
d_change_request_state
d_configuration_item
d_configuration_item_mdm
d_internal_contact_assigned_to
d_internal_organization_group
f_change_failure */

select 'ldb."f_change_failure" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_change_failure" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_change_failure" a13 
	on (a11.change_failure_key = a13.row_key)  
 union
select 'ldb."d_change_request" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_change_request" a14 
	on (a11.change_request_key = a14.row_key)  
 union
select 'ldb."d_configuration_item" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_configuration_item" a15 
	on (a11.ci_key = a15.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_configuration_item" a15 
 on (a11.ci_key = a15.row_key) 
	join "ldb"."d_configuration_item_mdm" a16 
	on (a15.mdm_key = a16.row_key)  
 union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a17 
	on (a12.month_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_week" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_week" a18 
	on (a12.week_start_date_key = a18.row_key)  
 union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a17 
 on (a12.month_start_date_key = a17.row_key) 
	join "ldb"."d_calendar_quarter" a19 
	on (a17.quarter_start_date_key = a19.row_key)  
 union
select 'ldb."d_calendar_year" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a17 
 on (a12.month_start_date_key = a17.row_key) join "ldb"."d_calendar_quarter" a19 
 on (a17.quarter_start_date_key = a19.row_key) 
	join "ldb"."d_calendar_year" a110 
	on (a19.year_start_date_key = a110.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_internal_contact_assigned_to" a111 
	on (a11.assigned_to_key = a111.row_key)  
 union
select 'ldb."d_internal_organization_group" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_internal_organization_group" a112 
	on (a11.assignment_group_key = a112.row_key)  
 union
select 'ldb."d_change_request_state" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_change_request_state" a113 
	on (a11.change_state_src_key = a113.row_key)  
 union
select 'ldb."d_change_request_close_code" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_failure" a11 
 join "ldb"."d_change_request" a14 
 on (a11.change_request_key = a14.row_key) 
	join "ldb"."d_change_request_close_code" a114 
	on (a14.close_code_src_key = a114.row_key) 

