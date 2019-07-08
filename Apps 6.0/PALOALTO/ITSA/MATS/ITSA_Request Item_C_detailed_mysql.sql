select 'ldb.f_request_item_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_opened_by_c a17 
on (a11.opened_by_key = a17.row_key) 
union
select 'ldb.d_calendar_date_fiscal a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a18 
on (a11.fiscal_date_key = a18.row_key) 
union
select 'ldb.d_master_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_master_item a19 
on (a11.catalog_item_key = a19.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a18 
on (a11.fiscal_date_key = a18.row_key) 
join ldb.d_calendar_fiscal_quarter a110 
on (a18.quarter_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a18 
on (a11.fiscal_date_key = a18.row_key) 
join ldb.d_calendar_fiscal_year a111 
on (a18.year_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_week a112 
on (a14.week_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
join ldb.d_calendar_year a113 
on (a16.year_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group_parent_internal_c a114 
on (a11.assignment_group_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_requested_for a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_requested_for a115 
on (a11.requested_for_key = a115.row_key) 
union
select 'ldb.d_request a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request a116 
on (a11.request_key = a116.row_key) 
union
select 'ldb.d_internal_contact_request_requested_for_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request a116 
on (a11.request_key = a116.row_key) 
join ldb.d_internal_contact_request_requested_for_c a117 
on (a116.requested_for_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_assigned_to a118 
on (a11.assigned_to_key = a118.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_closed_by_c a119 
on (a11.closed_by_key = a119.row_key) 
union
select 'ldb.d_duration_requested_for_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_duration_requested_for_c a120 
on (a11.requested_for_employee_duration_c = a120.row_key) 
union
select 'ldb.d_duration_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_duration_c a121 
on (a11.opened_by_employee_duration_c = a121.row_key) 
union
select 'ldb.d_hr_change_category a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_hr_change_category a122 
on (a11.hr_category_src_key = a122.row_key) 
union
select 'ldb.d_hr_change a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_hr_change a123 
on (a11.hr_change_key = a123.row_key) 
union
select 'ldb.d_sc_req_item_approval a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_sc_req_item_approval a124 
on (a11.approval_state_src_key = a124.row_key) 
union
select 'ldb.d_request_item_stage a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_stage a125 
on (a11.stage_src_key = a125.row_key) 
union
select 'ldb.d_request_item_state a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_state a126 
on (a11.state_src_key = a126.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a127 
on (a13.portfolio_src_c_key = a127.row_key) 
union
select 'ldb.d_lov_request_item_employee_type_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
join ldb.d_lov_request_item_employee_type_c a128 
on (a12.employee_type_c_key = a128.row_key) 
union
select 'ldb.d_internal_contact_manager_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_opened_by_c a17 
on (a11.opened_by_key = a17.row_key) 
join ldb.d_internal_contact_manager_c a129 
on (a17.manager_c_key = a129.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group_parent_internal_c a114 
on (a11.assignment_group_c_key = a114.row_key) 
join ldb.d_internal_organization_group_parent_c a130 
on (a114.parent_row_c_key = a130.row_key) 