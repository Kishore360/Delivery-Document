select 'ldb.f_incident_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a15 
on (a13.month_start_date_key = a15.row_key) 
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key) 
union
select 'ldb.d_task_sla_stage a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla_stage a17 
on (a11.stage_src_key = a17.row_key) 
union
select 'ldb.d_incident_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_priority a18 
on (a14.priority_src_key = a18.row_key) 
union
select 'ldb.d_task_sla_name a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key) 
join ldb.d_task_sla_name a19 
on (a16.sla_category_key = a19.row_key) 
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_year a110 
on (a13.year_start_date_key = a110.row_key) 
