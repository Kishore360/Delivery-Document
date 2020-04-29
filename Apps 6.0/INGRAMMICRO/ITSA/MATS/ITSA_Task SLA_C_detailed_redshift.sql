select 'ldb.f_task_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
join ldb.d_internal_contact_assigned_to a12
on (a11.assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_task_sla a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
join ldb.d_task_sla a14
on (a11.sla_key = a14.row_key)
union
select 'ldb.d_task_sla_stage a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
join ldb.d_task_sla_stage a15
on (a11.stage_src_key = a15.row_key)
union
select 'ldb.d_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_c a11
join ldb.d_task a16
on (a11.task_key = a16.row_key)