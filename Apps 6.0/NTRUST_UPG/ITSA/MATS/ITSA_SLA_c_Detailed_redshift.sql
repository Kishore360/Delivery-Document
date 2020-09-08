select 'ldb.f_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
union
select 'ldb.d_task_sla a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a12
on (a11.sla_key = a12.row_key)
union
select 'ldb.d_task_sla_name a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a12
on (a11.sla_key = a12.row_key)
join ldb.d_task_sla_name a13
on (a12.sla_category_key = a13.row_key)
union
select 'ldb.d_cmn_schedule_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_cmn_schedule_c a14
on (a11.cmn_schedule_c_key = a14.row_key)
union
select 'ldb.d_sla_task_type_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a12
on (a11.sla_key = a12.row_key)
join ldb.d_sla_task_type_c a15
on (a12.sla_task_type_c_key = a15.row_key)
union
select 'ldb.d_sla_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a12
on (a11.sla_key = a12.row_key)
join ldb.d_sla_type_c a16
on (a12.sla_type_c_key = a16.row_key)