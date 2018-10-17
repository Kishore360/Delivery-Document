select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_opened_by_c a16 
on (a11.opened_by_c_key = a16.row_key) 
union
select 'ldb.d_calendar_date_fiscal a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_key = a18.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_quarter a19 
on (a17.quarter_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_fiscal_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date_fiscal a17 
on (a11.fiscal_date_key = a17.row_key) 
join ldb.d_calendar_fiscal_year a110 
on (a17.year_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a111 
on (a13.week_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a13 
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a112 
on (a15.year_start_date_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group_parent_internal_c a113 
on (a11.assignment_group_c_key = a113.row_key) 
union
select 'ldb.d_request_task a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a114 
on (a11.request_task_key = a114.row_key) 
union
select 'ldb.d_request_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a115 
on (a11.request_item_key = a115.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a116 
on (a11.assigned_to_key = a116.row_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_department a117 
on (a11.opened_by_department_key = a117.row_key) 
union
select 'ldb.d_duration_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_duration_c a118 
on (a11.opened_by_employee_duration_c = a118.row_key) 
union
select 'ldb.d_sc_task_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a119 
on (a11.priority_src_key = a119.row_key) 
union
select 'ldb.d_sc_task_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_flag_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_flag_c a121 
on (a11.sd_touch_flag_c_key = a121.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a122 
on (a12.portfolio_src_c_key = a122.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_employee_type_c a18 
on (a11.opened_by_key = a18.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a123 
on (a18.employee_type_c_key = a123.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group_parent_internal_c a113 
on (a11.assignment_group_c_key = a113.row_key) 
join ldb.d_internal_organization_group_parent_c a124 
on (a113.parent_row_c_key = a124.row_key) 
