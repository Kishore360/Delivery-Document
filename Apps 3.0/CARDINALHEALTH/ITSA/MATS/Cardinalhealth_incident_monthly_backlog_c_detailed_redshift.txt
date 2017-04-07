select 'ldb.f_incident_monthly_backlog_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_emp_seniors_c a13 
on (a12.manager_c_key = a13.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_calendar_month a16 
on (a11.calendar_month_start_date_key = a16.row_key) 
union
select 'ldb.d_task_impact a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_task_impact a17 
on (a11.impact_src_key = a17.row_key) 
union
select 'ldb.d_task_priority a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_task_priority a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.d_task_urgency a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_task_urgency a19 
on (a11.urgency_src_key = a19.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_monthly_backlog_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a110 
on (a14.level0_manager_c_key = a110.level0_manager_c_key) 