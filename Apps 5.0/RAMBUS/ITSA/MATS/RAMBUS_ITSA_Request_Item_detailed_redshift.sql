select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_calendar_date_closed a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a17 
on (a11.closed_on_key = a17.row_key) 
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
left outer join ldb.d_calendar_week a18 
on (a16.week_start_date_key = a18.row_key) 
union
select 'ldb.d_request_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request a110 
on (a11.request_key = a110.row_key) 
union
select 'ldb.d_internal_organization_department a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
left outer join ldb.d_internal_organization_department a111 
on (a12.department_key = a111.row_key) 
union
select 'ldb.d_internal_contact_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
left outer join ldb.d_internal_contact_mdm a112 
on (a12.row_current_key = a112.row_current_key) 
union
select 'ldb.d_sc_req_item_approval a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_sc_req_item_approval a113 
on (a11.approval_state_src_key = a113.row_key) 
union
select 'ldb.d_request_item_stage a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item_stage a114 
on (a11.stage_src_key = a114.row_key) 
union
select 'ldb.d_request_item_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item_state a115 
on (a11.state_src_key = a115.row_key) 
union
select 'ldb.d_internal_contact_requested_for a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_requested_for a116 
on (a11.requested_for_key = a116.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_task_closed_by a117 
on (a11.closed_by_key = a117.row_key) 
union
select 'ldb.d_calendar_month a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
left outer join ldb.d_calendar_month a118 
on (a16.month_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_month_closed a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a17 
on (a11.closed_on_key = a17.row_key) 
left outer join ldb.d_calendar_month_closed a119 
on (a17.month_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_quarter a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
left outer join ldb.d_calendar_quarter a120 
on (a16.quarter_start_date_key = a120.row_key) 
union
select 'ldb.d_calendar_year a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
left outer join ldb.d_calendar_year a121 
on (a16.year_start_date_key = a121.row_key) 
