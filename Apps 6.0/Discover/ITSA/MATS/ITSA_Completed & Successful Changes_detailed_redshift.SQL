/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_month_three_rolling
d_calendar_week
d_calendar_week_three_rolling
d_change_request_category
d_change_request_priority
d_change_request_risk
d_change_request_scope
d_change_request_type
d_configuration_item
d_configuration_item_mdm
d_internal_organization_department
d_internal_organization_group
d_three_month_rolling
d_three_week_rolling
f_change_request_closed
 */
 
 select 'ldb."f_change_request_closed" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_three_month_rolling" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_three_month_rolling" a13 
	on (a12.month_start_date_key = a13.this_month_key)  
 union
select 'ldb."d_three_week_rolling" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_three_week_rolling" a14 
	on (a12.week_start_date_key = a14.this_week_key)  
 union
select 'ldb."d_configuration_item" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_configuration_item" a15 
	on (a11.configuration_item_key = a15.row_key)  
 union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_internal_organization_group" a16 
	on (a11.assignment_group_key = a16.row_key)  
 union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a17 
	on (a12.month_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_week" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_week" a18 
	on (a12.week_start_date_key = a18.row_key)  
 union
select 'ldb."d_change_request_category" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_category" a19 
	on (a11.category_src_key = a19.row_key)  
 union
select 'ldb."d_change_request_priority" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_priority" a110 
	on (a11.priority_src_key = a110.row_key)  
 union
select 'ldb."d_change_request_risk" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_risk" a111 
	on (a11.risk_src_key = a111.row_key)  
 union
select 'ldb."d_change_request_scope" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_scope" a112 
	on (a11.scope_src_key = a112.row_key)  
 union
select 'ldb."d_change_request_type" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_change_request_type" a113 
	on (a11.type_src_key = a113.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_configuration_item" a15 
 on (a11.configuration_item_key = a15.row_key) 
	join "ldb"."d_configuration_item_mdm" a114 
	on (a15.mdm_key = a114.row_key)  
 union
select 'ldb."d_internal_organization_department" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_internal_organization_department" a115 
	on (a11.requested_by_department_key = a115.row_key)  
 union
select 'ldb."d_calendar_month_three_rolling" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_three_month_rolling" a13 
 on (a12.month_start_date_key = a13.this_month_key) 
	join "ldb"."d_calendar_month_three_rolling" a116 
	on (a13.rolling_three_month_key = a116.row_key)  
 union
select 'ldb."d_calendar_week_three_rolling" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request_closed" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_three_week_rolling" a14 
 on (a12.week_start_date_key = a14.this_week_key) 
	join "ldb"."d_calendar_week_three_rolling" a117 
	on (a14.rolling_three_week_key = a117.row_key) 

