select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
union
select 'ldb.d_change_task a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_change_task_reported_type a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
join ldb.d_change_task_reported_type a16 
on (a12.reported_type_src_key = a16.row_key) 
union
select 'ldb.d_change_task_impact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
join ldb.d_change_task_impact a17 
on (a12.impact_src_key = a17.row_key) 
union
select 'ldb.d_change_task_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
join ldb.d_change_task_priority a18 
on (a12.priority_src_key = a18.row_key) 
union
select 'ldb.d_change_task_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
join ldb.d_change_task_state a19 
on (a12.state_src_key = a19.row_key) 
union
select 'ldb.d_change_task_urgency a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a12 
on (a11.change_task_key = a12.row_key) 
join ldb.d_change_task_urgency a110 
on (a12.urgency_src_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a112 
on (a13.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_week a113 
on (a13.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_quarter a114 
on (a13.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_year a115 
on (a13.year_start_date_key = a115.row_key) 