select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_calendar_date_delivered a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_delivered a16 
on (a11.delevered_on_c_key = a16.row_key) 
union
select 'ldb.d_calendar_greg_fiscal a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) 
join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
union
select 'ldb.d_calendar_date_closed a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_closed a19 
on (a11.closed_on_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a12.row_current_key = a110.row_current_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a112 
on (a11.assignment_group_key = a112.row_key) 
union
select 'ldb.d_variable_lov_c_u_requested_for_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_variable_lov_c_u_requested_for_c a113 
on (a11.requested_for_c_key = a113.row_key) 
union
select 'ldb.d_variable_lov_c_u_request_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_variable_lov_c_u_request_type_c a114 
on (a11.request_type_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_delivery_technician_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_delivery_technician_c a115 
on (a11.delivery_technician_c_key = a115.row_key) 
union
select 'ldb.d_hr_change_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change_category a116 
on (a11.hr_category_src_key = a116.row_key) 
union
select 'ldb.d_hr_change a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change a117 
on (a11.hr_change_key = a117.row_key) 
union
select 'ldb.d_internal_contact_variable_assigned_to_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_variable_assigned_to_c a118 
on (a11.assigned_to_c_key = a118.row_key) 
union
select 'ldb.d_request a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a119 
on (a11.request_key = a119.row_key) 
union
select 'ldb.d_sc_req_item_approval a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a120 
on (a11.approval_state_src_key = a120.row_key) 
union
select 'ldb.d_request_item_pending_reason a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_pending_reason a121 
on (a11.pending_reason_src_c_key = a121.row_key) 
union
select 'ldb.d_request_item_stage a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a122 
on (a11.stage_src_key = a122.row_key) 
union
select 'ldb.d_request_item_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a123 
on (a11.state_src_key = a123.row_key) 
union
select 'ldb.d_internal_contact_requested_for a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a124 
on (a11.requested_for_key = a124.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a125 
on (a11.closed_by_key = a125.row_key) 
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a126 
on (a15.month_start_date_key = a126.row_key) 
union
select 'ldb.d_calendar_month_closed a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date_closed a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_month_closed a127 
on (a19.month_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_fiscal_period a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_period a128 
on (a18.period_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_quarter a129 
on (a18.quarter_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_fiscal_year a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_greg_fiscal a17 
on (a11.opened_on_key = a17.gregorian_calendar_key) join ldb.d_calendar_date_fiscal a18 
on (a17.fiscal_calendar_key = a18.row_key) 
join ldb.d_calendar_fiscal_year a130 
on (a18.year_start_date_key = a130.row_key) 
