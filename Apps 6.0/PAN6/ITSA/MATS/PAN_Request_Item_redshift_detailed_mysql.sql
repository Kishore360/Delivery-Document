select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group_parent_internal_c a13 
on (a11.assignment_group_c_key = a13.row_key) 
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_opened_by_c a19 
on (a11.opened_by_key = a19.row_key) 
union
select 'ldb.d_master_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a110 
on (a11.catalog_item_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_quarter a111 
on (a12.quarter_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.fiscal_date_key = a12.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a12.year_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_week a113 
on (a16.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
join ldb.d_calendar_year a114 
on (a18.year_start_date_key = a114.row_key) 
union
select 'ldb.d_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a115 
on (a11.request_key = a115.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a116 
on (a11.assigned_to_key = a116.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_closed_by_c a117 
on (a11.closed_by_key = a117.row_key) 
union
select 'ldb.d_duration_requested_for_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_duration_requested_for_c a118 
on (a11.requested_for_employee_duration_c = a118.row_key) 
union
select 'ldb.d_duration_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_duration_c a119 
on (a11.opened_by_employee_duration_c = a119.row_key) 
union
select 'ldb.d_hr_change_category a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change_category a120 
on (a11.hr_category_src_key = a120.row_key) 
union
select 'ldb.d_hr_change a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change a121 
on (a11.hr_change_key = a121.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group_parent_internal_c a13 
on (a11.assignment_group_c_key = a13.row_key) 
join ldb.d_internal_organization_group_parent_c a122 
on (a13.parent_row_c_key = a122.row_key) 
union
select 'ldb.d_sc_req_item_approval a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a123 
on (a11.approval_state_src_key = a123.row_key) 
union
select 'ldb.d_request_item_stage a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a124 
on (a11.stage_src_key = a124.row_key) 
union
select 'ldb.d_request_item_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a125 
on (a11.state_src_key = a125.row_key) 
union
select 'ldb.d_internal_contact_requested_for a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a126 
on (a11.requested_for_key = a126.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a127 
on (a15.portfolio_src_c_key = a127.row_key) 
union
select 'ldb.d_lov_request_item_employee_type_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_lov_request_item_employee_type_c a128 
on (a14.employee_type_c_key = a128.row_key) 
union
select 'ldb.d_internal_contact_manager_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_opened_by_c a19 
on (a11.opened_by_key = a19.row_key) 
join ldb.d_internal_contact_manager_c a129 
on (a19.manager_c_key = a129.row_key) 
