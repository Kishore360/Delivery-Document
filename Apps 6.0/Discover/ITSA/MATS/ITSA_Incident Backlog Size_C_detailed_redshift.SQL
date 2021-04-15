/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_configuration_item
d_configuration_item_mdm
d_incident
d_incident_priority
d_internal_contact_assigned_to
d_internal_organization_group
f_incident */

select 'ldb."f_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_calendar_date" a12 
	on (a11.date_key = a12.row_key)  
 union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_configuration_item" a13 
	on (a11.configuration_item_key = a13.row_key)  
 union
select 'ldb."d_calendar_week" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_week" a14 
	on (a12.week_start_date_key = a14.row_key)  
 union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_internal_organization_group" a15 
	on (a11.assignment_group_key = a15.row_key)  
 union
select 'ldb."d_incident" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_incident" a16 
	on (a11.incident_key = a16.row_key)  
 union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) 
	join "ldb"."d_calendar_month" a17 
	on (a12.month_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_quarter" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a17 
 on (a12.month_start_date_key = a17.row_key) 
	join "ldb"."d_calendar_quarter" a18 
	on (a17.quarter_start_date_key = a18.row_key)  
 union
select 'ldb."d_calendar_year" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_calendar_date" a12 
 on (a11.date_key = a12.row_key) join "ldb"."d_calendar_month" a17 
 on (a12.month_start_date_key = a17.row_key) join "ldb"."d_calendar_quarter" a18 
 on (a17.quarter_start_date_key = a18.row_key) 
	join "ldb"."d_calendar_year" a19 
	on (a18.year_start_date_key = a19.row_key)  
 union
select 'ldb."d_internal_contact_assigned_to" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_internal_contact_assigned_to" a110 
	on (a11.assigned_to_key = a110.row_key)  
 union
select 'ldb."d_configuration_item_mdm" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_configuration_item" a13 
 on (a11.configuration_item_key = a13.row_key) 
	join "ldb"."d_configuration_item_mdm" a111 
	on (a13.mdm_key = a111.row_key)  
 union
select 'ldb."d_incident_priority" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident" a11 
 join "ldb"."d_incident" a16 
 on (a11.incident_key = a16.row_key) 
	join "ldb"."d_incident_priority" a112 
	on (a16.priority_src_key = a112.row_key) 

