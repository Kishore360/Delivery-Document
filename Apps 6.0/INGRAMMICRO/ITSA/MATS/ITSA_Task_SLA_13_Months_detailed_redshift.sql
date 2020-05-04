select 'ldb.f_task_sla_eod_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key)
union
select 'ldb.d_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
union
select 'ldb.d_parent_task a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_parent_task a18
on (a17.parent_task_key = a18.row_key)
union
select 'ldb.d_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a19
on (a12.mdm_key = a19.row_key)
union
select 'ldb.d_task_sla a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task_sla a110
on (a11.sla_key = a110.row_key)
union
select 'ldb.d_task_sla_stage a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task_sla_stage a111
on (a11.stage_src_key = a111.row_key)
union
select 'ldb.d_task_closed_by a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_task_closed_by a112
on (a17.closed_by_key = a112.row_key)
union
select 'ldb.d_task_contacttype a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_task_contacttype a113
on (a17.contact_type_src_key = a113.row_key)
union
select 'ldb.d_task_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_task_priority a114
on (a17.priority_src_key = a114.row_key)
union
select 'ldb.d_task_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_task_state a115
on (a17.state_src_key = a115.row_key)
union
select 'ldb.d_task_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla_eod_c a11
join ldb.d_task a17
on (a11.task_key = a17.row_key)
join ldb.d_task_type a116
on (a17.task_type_src_key = a116.row_key)
