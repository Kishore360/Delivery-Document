select 'ldb.f_task_sla_breached_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_calendar_date a14 
on (a11.start_on_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_calendar_date a14 
on (a11.start_on_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key) 
union
select 'ldb.d_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task a17 
on (a11.task_key = a17.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_calendar_date a14 
on (a11.start_on_key = a14.row_key) 
join ldb.d_calendar_week a19 
on (a14.week_start_date_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_legalentity a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_internal_organization_legalentity a111 
on (a11.company_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task a17
on a11.task_key  = a17.row_key
join ldb.d_task_priority a113 
on (a17.priority_src_key = a113.row_key) 
union
select 'ldb.d_task_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task a17
on a11.task_key  = a17.row_key
join ldb.d_task_contacttype a114 
on (a17.contact_type_src_key = a114.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_calendar_date a14 
on (a11.start_on_key = a14.row_key) 
join ldb.d_calendar_month a119 
on (a14.month_start_date_key = a119.row_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_manager_c a125
on (a12.manager_c_key = a125.row_key)
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key)
join ldb.d_schedule_c a127
on (a16.schedule_c_key = a127.row_key) 
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task_sla a16 
on (a11.sla_key = a16.row_key)
join ldb.d_task_sla_name a126
on(a16.sla_category_key = a126.row_key)
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_calendar_date a14 
on (a11.start_on_key = a14.row_key) 
join ldb.d_calendar_year a115
on (a14.year_start_date_key = a115.row_key)
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task_sla_stage a123
on (a11.stage_src_key = a123.row_key) 
union
select 'ldb.d_task_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task a17 
on (a11.task_key = a17.row_key) 
join ldb.d_task_state a119
on (a17.state_src_key = a119.row_key)
union
select 'ldb.d_lov_contract_sla_timezone_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_lov_contract_sla_timezone_c a124
on (a11.timezone_src_c_key = a124.row_key) 
union
select 'ldb.d_task_sla_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_breached_c a11 
join ldb.d_task_sla_c a13
on (a11.row_key = a13.sla_row_key)




