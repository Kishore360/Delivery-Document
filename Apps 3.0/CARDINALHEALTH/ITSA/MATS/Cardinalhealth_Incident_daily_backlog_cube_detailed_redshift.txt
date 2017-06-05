select 'ldb.f_incident_daily_backlog_temp_c a11 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a13 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_emp_seniors_c a13 
on (a12.manager_c_key = a13.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a14 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a15 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_greg_fiscal_c a15 
on (a11.calendar_start_date_key = a15.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a16 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_greg_fiscal_c a15 
on (a11.calendar_start_date_key = a15.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a16 
on (a15.fiscal_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_date a17 
on (a11.calendar_start_date_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a19 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a19 
on (a14.level0_manager_c_key = a19.level0_manager_c_key) 
union
select 'ldb.d_calendar_fiscal_period a110 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_greg_fiscal_c a15 
on (a11.calendar_start_date_key = a15.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a16 
on (a15.fiscal_key = a16.row_key) 
join ldb.d_calendar_fiscal_period a110 
on (a16.period_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_date a17 
on (a11.calendar_start_date_key = a17.row_key) 
join ldb.d_calendar_month a111 
on (a17.month_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.calendar_start_date_key) Row_Count
from ldb.f_incident_daily_backlog_temp_c a11 
join ldb.d_calendar_greg_fiscal_c a15 
on (a11.calendar_start_date_key = a15.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a16 
on (a15.fiscal_key = a16.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a16.year_start_date_key = a112.row_key) 