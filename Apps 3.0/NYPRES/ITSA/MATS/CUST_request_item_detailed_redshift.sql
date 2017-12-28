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
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_calendar_date_closed a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a16 
on (a11.closed_on_key = a16.row_key) 
union
select 'ldb.d_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request a17 
on (a11.request_key = a17.row_key) 
union
select 'ldb.d_hr_change a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_hr_change a18 
on (a11.hr_change_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
left outer join ldb.d_calendar_week a19 
on (a15.week_start_date_key = a19.row_key) 
union
select 'ldb.d_location_request_item_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
left outer join ldb.d_location_request_item_c a110 
on (a14.opened_by_location_c_key = a110.row_key) 
union
select 'ldb.d_location_request_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request a17 
on (a11.request_key = a17.row_key) 
left outer join ldb.d_location_request_c a111 
on (a17.opened_by_location_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_assigned_to a112 
on (a11.assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_organization_group a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_organization_department a114 
on (a11.opened_by_department_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
left outer join ldb.d_internal_contact_mdm a115 
on (a12.row_current_key = a115.row_current_key) 
union
select 'ldb.d_hr_change_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_hr_change_category a116 
on (a11.hr_category_src_key = a116.row_key) 
union
select 'ldb.d_sc_req_item_approval a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_sc_req_item_approval a117 
on (a11.approval_state_src_key = a117.row_key) 
union
select 'ldb.d_request_item_stage a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item_stage a118 
on (a11.stage_src_key = a118.row_key) 
union
select 'ldb.d_request_item_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_internal_contact_requested_for a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_requested_for a120 
on (a11.requested_for_key = a120.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_internal_contact_task_closed_by a121 
on (a11.closed_by_key = a121.row_key) 
union
select 'ldb.d_request_item_type_of_item_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
left outer join ldb.d_request_item_type_of_item_c a122 
on (a14.type_of_item_c_key = a122.row_key) 
union
select 'ldb.d_calendar_month_closed a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a16 
on (a11.closed_on_key = a16.row_key) 
left outer join ldb.d_calendar_month_closed a123 
on (a16.month_start_date_key = a123.row_key) 
union
select 'ldb.d_calendar_month a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
left outer join ldb.d_calendar_month a124 
on (a15.month_start_date_key = a124.row_key) 
union
select 'ldb.d_master_item_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
left outer join ldb.d_master_item_type_c a125 
on (a13.type_src_c_key = a125.row_key) 
union
select 'ldb.d_calendar_quarter a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
left outer join ldb.d_calendar_quarter a126 
on (a15.quarter_start_date_key = a126.row_key) 
