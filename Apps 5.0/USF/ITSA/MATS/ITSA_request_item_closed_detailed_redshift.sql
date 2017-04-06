select 'ldb.f_request_item_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key)
union
select 'ldb.d_calendar_date_delivered a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_delivered a12 
on (a11.delevered_on_c_key = a12.row_key)
union
select 'ldb.d_calendar_date_fiscal a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.closed_on_key = a12.row_key)
union
select 'ldb.d_calendar_fiscal_period a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_fiscal_period a13
on (a12.period_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_fiscal_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_fiscal_quarter a13
on (a12.quarter_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_fiscal_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date_fiscal a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_fiscal_year a13
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.quarter_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_week a13
on (a12.week_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_year a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a12 
on (a11.closed_on_key = a12.row_key)
join ldb.d_calendar_year a13
on (a12.year_start_date_key = a13.row_key)
union
select 'ldb.d_hr_change a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_hr_change a12 
on (a11.hr_change_key = a12.row_key)
union
select 'ldb.d_hr_change_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_hr_change_category a12 
on (a11.hr_category_src_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_delivery_technician_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_delivery_technician_c a12 
on (a11.delivery_technician_c_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a13 
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_internal_contact_requested_for a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_requested_for a12 
on (a11.requested_for_key = a12.row_key)
union
select 'ldb.d_internal_contact_task_closed_by a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_requested_for a12 
on (a11.closed_by_key = a12.row_key)
union
select 'ldb.d_internal_contact_variable_assigned_to_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_variable_assigned_to_c a12 
on (a11.assigned_to_c_key = a12.row_key)
union
select 'ldb.d_internal_contact_delivery_technician_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_delivery_technician_c a12 
on (a11.delivery_technician_c_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_master_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_master_item a12 
on (a11.catalog_item_key = a12.row_key)
union
select 'ldb.d_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request a12 
on (a11.request_key = a12.row_key)
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key)
union
select 'ldb.d_request_item_pending_reason a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_pending_reason a12 
on (a11.pending_reason_src_c_key = a12.row_key)
union
select 'ldb.d_request_item_stage a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_stage a12 
on (a11.stage_src_key = a12.row_key)
union
select 'ldb.d_request_item_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_state a12 
on (a11.state_src_key = a12.row_key)
union
select 'ldb.d_sc_req_item_approval a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_sc_req_item_approval a12 
on (a11.approval_state_src_key = a12.row_key)
union
select 'ldb.d_variable_lov_c_u_request_type_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_variable_lov_c_u_request_type_c a12 
on (a11.request_type_c_key = a12.row_key)
union
select 'ldb.d_variable_lov_c_u_requested_for_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_variable_lov_c_u_requested_for_c a12 
on (a11.requested_for_c_key = a12.row_key)