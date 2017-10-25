select'f_incident_task_sla' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11 
 union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month         a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_task_sla' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11 
join ldb.d_task_sla       a13
on (a11.sla_key = a13.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'd_task_sla_stage' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_task_sla             a11
join ldb.d_task_sla_stage       a14
on (a11.stage_src_key = a14.row_key)
