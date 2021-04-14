/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_change_request
d_change_request_category
d_change_request_priority
d_change_request_risk
d_change_request_scope
d_change_request_state
d_change_request_type
d_configuration_item
d_configuration_item_mdm
d_internal_contact_assigned_to
d_internal_organization_department
d_internal_organization_group
f_change_request */


select 'ldb."f_change_request" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_configuration_item" a13 
	on (a11.configuration_item_key = a13.row_key)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_organization_group" a14 
	on (a11.assignment_group_key = a14.row_key)  
 union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a15 
	on (a12.month_start_date_key = a15.row_key)  
 union
select 'ldb."d_calendar_quarter" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a15 
 on (a12.month_start_date_key = a15.row_key) 
	join "ldb"."d_calendar_quarter" a16 
	on (a15.quarter_start_date_key = a16.row_key)  
 union
select 'ldb."d_change_request" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request" a17 
	on (a11.change_request_key = a17.row_key)  
 union
select 'ldb."d_change_request_priority" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_priority" a18 
	on (a11.priority_src_key = a18.row_key)  
 union
select 'ldb."d_change_request_risk" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_risk" a19 
	on (a11.risk_src_key = a19.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key) 
	join "ldb"."d_configuration_item_mdm" a110 
	on (a13.mdm_key = a110.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_contact_assigned_to" a111 
	on (a11.assigned_to_key = a111.row_key)  
 union
select 'ldb."d_calendar_week" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_week" a112 
	on (a12.week_start_date_key = a112.row_key)  
 union
select 'ldb."d_change_request_category" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_category" a113 
	on (a11.category_src_key = a113.row_key)  
 union
select 'ldb."d_change_request_scope" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_scope" a114 
	on (a11.scope_src_key = a114.row_key)  
 union
select 'ldb."d_change_request_state" a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_state" a115 
	on (a11.state_src_key = a115.row_key)  
 union
select 'ldb."d_change_request_type" a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_change_request_type" a116 
	on (a11.type_src_key = a116.row_key)  
 union
select 'ldb."d_internal_organization_department" a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_internal_organization_department" a117 
	on (a11.requested_by_department_key = a117.row_key)  
 union
select 'ldb."d_calendar_year" a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a15 
 on (a12.month_start_date_key = a15.row_key) join "ldb"."d_calendar_quarter" a16 
 on (a15.quarter_start_date_key = a16.row_key) 
	join "ldb"."d_calendar_year" a118 
	on (a16.year_start_date_key = a118.row_key) 

