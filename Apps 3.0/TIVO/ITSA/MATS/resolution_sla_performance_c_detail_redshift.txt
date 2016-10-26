select 'ldb.f_resolution_sla_performance_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_resolution_sla_performance_c a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(1) Row_Count
from ldb.f_resolution_sla_performance_c a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(1) Row_Count
from ldb.f_resolution_sla_performance_c a11 
join ldb.d_calendar_month a13 
on (a11.month_key = a13.row_key) 
union
select 'ldb.d_task_priority a14 ' as Table_name, count(1) Row_Count
from ldb.f_resolution_sla_performance_c a11 
join ldb.d_task_priority a14 
on (a11.priority_src_key = a14.row_key) 