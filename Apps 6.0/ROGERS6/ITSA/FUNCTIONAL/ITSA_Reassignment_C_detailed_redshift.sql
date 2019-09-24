select 'ldb.f_incident_activity	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_calendar_date	a12 
on (a11.assigned_on_key = a12.row_key) 
union
select 'ldb.d_calendar_month	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_calendar_date	a12 
on (a11.assigned_on_key = a12.row_key) 
join	ldb.d_calendar_month	a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_internal_organization_assignment_group_from_c	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_internal_organization_assignment_group_from_c	a17 
on (a11.from_assignment_group_key = a17.row_key) 
union
select 'ldb.d_calendar_quarter	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_calendar_date	a12 
on (a11.assigned_on_key = a12.row_key) 
join	ldb.d_calendar_quarter	a19 
on (a12.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_week	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_calendar_date	a12 
on (a11.assigned_on_key = a12.row_key) 
join	ldb.d_calendar_week	a110 
on (a12.week_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_year	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_calendar_date	a12 
on (a11.assigned_on_key = a12.row_key) 
join	ldb.d_calendar_year	a111 
on (a12.year_start_date_key = a111.row_key) 
union
select 'ldb.d_internal_contact_to	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_internal_contact_to	a112 
on (a11.to_assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group_to	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_internal_organization_group_to	a113 
on (a11.to_assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_contact_from	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_internal_contact_from	a114 
on (a11.from_assigned_to_key = a114.row_key) 
union
select 'ldb.d_incident_priority	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 

join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
join	ldb.d_incident_priority	a115 
on (a13.priority_src_key = a115.row_key) 
union
select 'ldb.d_incident_state	a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
join	ldb.d_incident_state	a116 
on (a13.state_src_key = a116.row_key) 
union
select 'ldb.d_incident_subcategory	a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity	a11 
join	ldb.d_incident	a13
	  on 	(a11.incident_key = a13.row_key)
join	ldb.d_incident_subcategory	a117 
on (a13.sub_category_src_key = a117.row_key) 