select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_employee_type_c a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.assignment_group_c_key = a14.row_key) 
union
select 'ldb.d_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a15 
on (a11.request_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) 
join ldb.d_calendar_quarter a19 
on (a18.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_opened_by_c a110 
on (a11.opened_by_c_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_quarter a111 
on (a12.quarter_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a12.year_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
join ldb.d_calendar_week a113 
on (a17.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19 
on (a18.quarter_start_date_key = a19.row_key) 
join ldb.d_calendar_year a114 
on (a19.year_start_date_key = a114.row_key) 
union
select 'ldb.d_request_task a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a115 
on (a11.request_task_key = a115.row_key) 
union
select 'ldb.d_internal_contact_request_requested_for_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request a15 
on (a11.request_key = a15.row_key) 
join ldb.d_internal_contact_request_requested_for_c a116 
on (a15.requested_for_c_key = a116.row_key) 
union
select 'ldb.d_request_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a117 
on (a11.request_item_key = a117.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a118 
on (a11.assigned_to_key = a118.row_key) 
union
select 'ldb.d_employee_duration_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_employee_duration_c a119 
on (a11.requestor_employee_duration_c_key = a119.row_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_department a120 
on (a11.opened_by_department_key = a120.row_key) 
union
select 'ldb.d_duration_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_duration_c a121 
on (a11.opened_by_employee_duration_c = a121.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_employee_type_c a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a122 
on (a13.employee_type_c_key = a122.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group_parent_internal_c a14 
on (a11.assignment_group_c_key = a14.row_key) 
join ldb.d_internal_organization_group_parent_c a123 
on (a14.parent_row_c_key = a123.row_key) 
union
select 'ldb.d_sc_task_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a124 
on (a11.priority_src_key = a124.row_key) 
union
select 'ldb.d_sc_task_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a125 
on (a11.state_src_key = a125.row_key) 
union
select 'ldb.d_internal_contact_requested_for a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_requested_for a126 
on (a11.requested_for_key = a126.row_key) 
union
select 'ldb.d_flag_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_flag_c a127 
on (a11.sd_touch_flag_c_key = a127.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a128 
on (a16.portfolio_src_c_key = a128.row_key) 