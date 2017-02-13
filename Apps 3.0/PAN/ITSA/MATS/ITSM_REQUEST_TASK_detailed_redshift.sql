select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
union									
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_contact a12 									
on (a11.opened_by_key = a12.row_key) 									
union									
select 'ldb.d_internal_contact_employee_type_c a13 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_contact_employee_type_c a13 									
on (a11.opened_by_key = a13.row_key) 									
union									
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_calendar_date a14 									
on (a11.opened_on_key = a14.row_key) 									
union									
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_organization_group a15 									
on (a11.assignment_group_key = a15.row_key) 									
union									
select 'ldb.d_request_item a16 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_request_item a16 									
on (a11.request_item_key = a16.row_key) 									
union									
select 'ldb.d_request_task a17 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_request_task a17 									
on (a11.request_task_key = a17.row_key) 									
union									
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_contact_assigned_to a18 									
on (a11.assigned_to_key = a18.row_key) 									
union									
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_organization_department a19 									
on (a11.opened_by_department_key = a19.row_key) 									
union									
select 'ldb.d_internal_contact_opened_by_c a110 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_contact_opened_by_c a110 									
on (a11.opened_by_key = a110.row_key) 									
union									
select 'ldb.d_duration_c a111 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_duration_c a111 									
on (a11.opened_by_employee_duration = a111.duration_c_key) 									
union									
select 'ldb.d_lov_employee_type_c a112 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_contact_employee_type_c a13 									
on (a11.opened_by_key = a13.row_key) 									
join ldb.d_lov_employee_type_c a112 									
on (a13.employee_type_c_key = a112.row_key) 									
union									
select 'ldb.d_sc_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_sc_task_priority a113 									
on (a11.priority_src_key = a113.row_key) 									
union									
select 'ldb.d_sc_task_state a114 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_sc_task_state a114 									
on (a11.state_src_key = a114.row_key) 									
union									
select 'ldb.d_flag_c a115 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_flag_c a115 									
on (a11.sd_touch_flag_c_key = a115.row_key) 									
union									
select 'ldb.d_internal_organization_group_parent_c a116 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_internal_organization_group a15 									
on (a11.assignment_group_key = a15.row_key) 									
join ldb.d_internal_organization_group_parent_c a116 									
on (a15.parent_row_key_c = a116.row_key) 									
union									
select 'ldb.d_calendar_month a117 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_calendar_date a14 									
on (a11.opened_on_key = a14.row_key) 									
join ldb.d_calendar_month a117 									
on (a14.month_start_date_key = a117.row_key) 									
union									
select 'ldb.d_calendar_week a118 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_request_task a11 									
join ldb.d_calendar_date a14 									
on (a11.opened_on_key = a14.row_key) 									
join ldb.d_calendar_week a118 									
on (a14.week_start_date_key = a118.row_key) 									
