/* Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_week
d_calendar_year
d_incident
d_incident_priority
d_incident_state
d_internal_contact_from
d_internal_contact_to
d_internal_organization_group
d_internal_organization_group_from
d_internal_organization_group_to
f_incident_activity
 */
 
 select 'ldb."f_incident_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_internal_organization_group" a12 
	on (a11.current_assignment_group_key = a12.row_key)  
 union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_calendar_date" a13 
	on (a11.date_key = a13.row_key)  
 union
select 'ldb."d_incident" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_incident" a14 
	on (a11.incident_key = a14.row_key)  
 union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_calendar_date" a13 
 on (a11.date_key = a13.row_key) 
	join "ldb"."d_calendar_month" a15 
	on (a13.month_start_date_key = a15.row_key)  
 union
select 'ldb."d_calendar_week" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_calendar_date" a13 
 on (a11.date_key = a13.row_key) 
	join "ldb"."d_calendar_week" a16 
	on (a13.week_start_date_key = a16.row_key)  
 union
select 'ldb."d_calendar_quarter" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_calendar_date" a13 
 on (a11.date_key = a13.row_key) join "ldb"."d_calendar_month" a15 
 on (a13.month_start_date_key = a15.row_key) 
	join "ldb"."d_calendar_quarter" a17 
	on (a15.quarter_start_date_key = a17.row_key)  
 union
select 'ldb."d_calendar_year" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_calendar_date" a13 
 on (a11.date_key = a13.row_key) join "ldb"."d_calendar_month" a15 
 on (a13.month_start_date_key = a15.row_key) join "ldb"."d_calendar_quarter" a17 
 on (a15.quarter_start_date_key = a17.row_key) 
	join "ldb"."d_calendar_year" a18 
	on (a17.year_start_date_key = a18.row_key)  
 union
select 'ldb."d_internal_contact_to" a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_internal_contact_to" a19 
	on (a11.to_assigned_to_key = a19.row_key)  
 union
select 'ldb."d_internal_organization_group_to" a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_internal_organization_group_to" a110 
	on (a11.to_assignment_group_key = a110.row_key)  
 union
select 'ldb."d_internal_contact_from" a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_internal_contact_from" a111 
	on (a11.from_assigned_to_key = a111.row_key)  
 union
select 'ldb."d_internal_organization_group_from" a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_internal_organization_group_from" a112 
	on (a11.from_assignment_group_key = a112.row_key)  
 union
select 'ldb."d_incident_priority" a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_incident" a14 
 on (a11.incident_key = a14.row_key) 
	join "ldb"."d_incident_priority" a113 
	on (a14.priority_src_key = a113.row_key)  
 union
select 'ldb."d_incident_state" a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_incident_activity" a11 
 join "ldb"."d_incident" a14 
 on (a11.incident_key = a14.row_key) 
	join "ldb"."d_incident_state" a114 
	on (a14.state_src_key = a114.row_key) 

