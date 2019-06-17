select 'ldb.f_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
union
select 'ldb.d_task a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task a12 
on (a11.task_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_date_created_on_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date_created_on_c a16 
on (a11.created_on_c_key = a16.row_key) 
union
select 'ldb.d_location_task_sla_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task a12 
on (a11.task_key = a12.row_key) 
join ldb.d_location_task_sla_c a17 
on (a12.location_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.sla_assigned_to_c_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_internal_organization_group a19 
on (a11.sla_assignment_group_c_key = a19.row_key) 
union
select 'ldb.d_task_sla a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task_sla a110 
on (a11.sla_key = a110.row_key) 
union
select 'ldb.d_task_sla_stage a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task_sla_stage a111 
on (a11.stage_src_key = a111.row_key) 
union
select 'ldb.o_data_freshness a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.o_data_freshness a112 
on (a11.source_id = a112.source_id) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a113 
on (a13.week_start_date_key = a113.row_key) 
union
select 'ldb.d_configuration_item_task_sla_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task a12 
on (a11.task_key = a12.row_key) 
join ldb.d_configuration_item_task_sla_c a114 
on (a12.configuration_item_c_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a115 
on (a15.year_start_date_key = a115.row_key) 