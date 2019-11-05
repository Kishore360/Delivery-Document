select 'ldb.f_change_task_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
union
select 'ldb.d_change_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a17
on (a12.month_start_date_key = a17.row_key)
union
select 'ldb.d_change_request_state a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_request_state a18
on (a11.parent_state_key = a18.row_key)
union
select 'ldb.d_change_task_from_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task_from_state a19
on (a11.from_state_key = a19.row_key)
union
select 'ldb.d_change_task_to_state a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task_to_state a110
on (a11.to_state_key = a110.row_key)
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
union
select 'ldb.d_change_task_approval a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_approval a112
on (a16.approval_src_key = a112.row_key)
union
select 'ldb.d_change_task_impact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_impact a113
on (a16.impact_src_key = a113.row_key)
union
select 'ldb.d_change_task_priority a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_priority a114
on (a16.priority_src_key = a114.row_key)
union
select 'ldb.d_change_task_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_state a115
on (a16.state_src_key = a115.row_key)
union
select 'ldb.d_change_task_task_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_task_type a116
on (a16.task_type_src_key = a116.row_key)
union
select 'ldb.d_change_task_upon_approval a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_upon_approval a117
on (a16.upon_approval_src_key = a117.row_key)
union
select 'ldb.d_change_task_upon_reject a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_state_activity a11
join ldb.d_change_task a16
on (a11.change_task_key = a16.row_key)
join ldb.d_change_task_upon_reject a118
on (a16.upon_reject_src_key = a118.row_key)
