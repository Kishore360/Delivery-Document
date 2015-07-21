SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (select 'f_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_calendar_date	a15
   on         (a11.opened_on_key = a15.row_key)

union

select  'd_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident	a17
   on         (a11.incident_key = a17.row_key)


union

select  'd_incident_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_state	a18
   on         (a11.state_src_key = a18.row_key)

union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_organization_department	a19
   on         (a11.opened_by_department_key = a19.row_key)


union

select  'd_incident_severity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_severity	a19
   on         (a11.severity_src_key = a19.row_key)

union

select  'd_task_impact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_task_impact	a19
   on         (a11.impact_src_key = a19.row_key)

union

select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_task_priority	a19
   on         (a11.priority_src_key = a19.row_key)

union

select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_task_urgency	a19
   on         (a11.urgency_src_key = a19.row_key)

union

select  'd_incident_agebucket' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_agebucket a19
   on         (a11.age_key = a19.row_key)
)a
)b