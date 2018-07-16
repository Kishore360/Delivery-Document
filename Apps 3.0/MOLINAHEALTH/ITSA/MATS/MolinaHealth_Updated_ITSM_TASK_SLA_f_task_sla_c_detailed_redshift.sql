select 'ldb.f_task_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_week a15 
on (a13.week_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_year a16 
on (a13.year_start_date_key = a16.row_key) 
union
select 'ldb.d_task_sla a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_sla a17 
on (a11.sla_key = a17.row_key) 
union
select 'ldb.d_task_sla_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_sla_c a18 
on (a11.task_sla_c_key = a18.row_key) 
union
select 'ldb.d_task a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task a19 
on (a11.task_key = a19.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_legalentity a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_legalentity a111 
on (a11.company_c_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_priority a113 
on (a11.priority_key = a113.row_key) 
union
select 'ldb.d_task_contacttype_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_contacttype_c a114 
on (a11.contact_type_c_key = a114.row_key) 
union
select 'ldb.d_lov_task_c_stage_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_lov_task_c_stage_c a115 
on (a11.stage_src_key = a115.row_key) 
union
select 'ldb.d_lov_task_c_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_lov_task_c_state_c a116 
on (a11.state_src_key = a116.row_key) 
union
select 'ldb.d_internal_contact_assignment_manager_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_assignment_manager_c a117 
on (a12.manager_c_key = a117.row_key) 
union
select 'ldb.d_lov_task_sla_category_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task_sla a17 
on (a11.sla_key = a17.row_key) 
join ldb.d_lov_task_sla_category_c a118 
on (a17.sla_category_c_key = a118.row_key) 
union
select 'ldb.d_task_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_task a19 
on (a11.task_key = a19.row_key) 
join ldb.d_task_type a119 
on (a19.task_type_src_key = a119.row_key) 
union
select 'ldb.d_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13 
on (a11.start_on_key = a13.row_key) 
join ldb.d_calendar_month a120 
on (a13.month_start_date_key = a120.row_key) 
