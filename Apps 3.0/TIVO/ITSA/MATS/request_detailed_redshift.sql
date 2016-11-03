select 'ldb.f_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
union
select 'ldb.d_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_request a12 
on (a11.request_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_caller_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_caller_c a17 
on (a11.caller_key = a17.row_key) 
union
select 'ldb.d_request_category_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_request_category_c a18 
on (a11.category_src_c_key = a18.row_key) 
union
select 'ldb.d_calendar_time_hour a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a19 
on (a13.hour_24_format_num = a19.hour_24_format_num) 
union
select 'ldb.d_sc_request_approval a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_sc_request_approval a110 
on (a11.approval_state_src_key = a110.row_key) 
union
select 'ldb.d_request_request_class_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_request_request_class_c a111 
on (a11.request_class_src_c_key = a111.row_key) 
union
select 'ldb.d_sc_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_sc_request_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_sc_request_stage a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_sc_request_stage a113 
on (a11.stage_src_key = a113.row_key) 
union
select 'ldb.d_sc_request_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_sc_request_request_state a114 
on (a11.state_src_key = a114.row_key) 
union
select 'ldb.d_request_request_type_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_request_request_type_c a115 
on (a11.request_type_src_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_requested_for a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_requested_for a116 
on (a11.requested_for_key = a116.row_key) 
union
select 'ldb.d_master_item_sub_category_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_master_item_sub_category_c a117 
on (a11.sub_category_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_task_closed_by a118 
on (a11.closed_by_key = a118.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a119 
on (a14.month_start_date_key = a119.row_key) 
union
select 'ldb.d_internal_contact_opened_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request a11 
join ldb.d_internal_contact_opened_by a120 
on (a11.opened_by_key = a120.row_key) 

