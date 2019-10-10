select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact_director_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_director_c a13
on (a12.support_director_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_manager_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_manager_c a14
on (a12.managed_by_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_vp_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_internal_contact_vp_c a15
on (a12.vp_c_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
union
select 'ldb.d_change_task a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a111
on (a11.change_task_key = a111.row_key)
union
select 'ldb.d_application_event_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_application_event_c a112
on (a11.change_task_application_c_key = a112.row_key)
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_internal_contact_assigned_to a113
on (a11.assigned_to_key = a113.row_key)
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_state a114
on (a11.parent_state_src_key = a114.row_key)
union
select 'ldb.d_change_request_type a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_request_type a115
on (a11.parent_type_src_key = a115.row_key)
union
select 'ldb.d_change_task_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a111
on (a11.change_task_key = a111.row_key) 
join ldb.d_change_task_priority a116
on (a111.priority_src_key = a116.row_key)
union
select 'ldb.d_change_task_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a111
on (a11.change_task_key = a111.row_key) 
join ldb.d_change_task_state a117
on (a111.state_src_key = a117.row_key)
union
select 'ldb.d_change_task_task_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_change_task a111
on (a11.change_task_key = a111.row_key)
join ldb.d_change_task_task_type a118
on (a111.task_type_src_key = a118.row_key)
union
select 'ldb.d_calendar_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a119
on (a19.year_start_date_key = a119.row_key)
union
select 'ldb.backlog_flag = '' ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11
