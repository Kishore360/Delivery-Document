select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
union
select 'ldb.d_master_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_master_item a17
on (a11.catalog_item_key = a17.row_key)
union
select 'ldb.d_request_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item a18
on (a11.request_item_key = a18.row_key)
union
select 'ldb.d_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request a19
on (a11.request_key = a19.row_key)
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_organization_department a110
on (a12.department_key = a110.row_key)
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm a111
on (a12.row_current_key = a111.row_current_key)
union
select 'ldb.d_hr_change_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_hr_change_category a112
on (a11.hr_category_src_key = a112.row_key)
union
select 'ldb.d_hr_change a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_hr_change a113
on (a11.hr_change_key = a113.row_key)
union
select 'ldb.d_location a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_location a114
on (a11.location_key = a114.row_key)
union
select 'ldb.d_sc_req_item_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_approval a115
on (a11.approval_state_src_key = a115.row_key)
union
select 'ldb.d_request_item_contacttype a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item_contacttype a116
on (a11.reported_type_src_key = a116.row_key)
union
select 'ldb.d_sc_req_item_impact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_impact a117
on (a11.impact_src_key = a117.row_key)
union
select 'ldb.d_sc_req_item_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_priority a118
on (a11.priority_src_key = a118.row_key)
union
select 'ldb.d_request_item_stage a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item_stage a119
on (a11.stage_src_key = a119.row_key)
union
select 'ldb.d_request_item_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item_state a120
on (a11.state_src_key = a120.row_key)
union
select 'ldb.d_request_item_tribe_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item_tribe_c a121
on (a11.tribe_c_key = a121.row_key)
union
select 'ldb.d_sc_req_item_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_internal_contact_requested_for a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact_requested_for a123
on (a11.requested_for_key = a123.row_key)
union
select 'ldb.d_lov_segment_type_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a124
on (a13.segment_type_c_key = a124.row_key)
union
select 'ldb.d_internal_contact_task_closed_by a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact_task_closed_by a125
on (a11.closed_by_key = a125.row_key)
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month a126
on (a16.month_start_date_key = a126.row_key)
union
select 'ldb.d_calendar_week a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_week a127
on (a16.week_start_date_key = a127.row_key)
union
select 'ldb.d_request_location a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request a19
on (a11.request_key = a19.row_key)
join ldb.d_request_location a128
on (a19.location_key = a128.row_key)
union
select 'ldb.d_calendar_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_quarter a129
on (a16.quarter_start_date_key = a129.row_key)
union
select 'ldb.d_calendar_year a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_year a130
on (a16.year_start_date_key = a130.row_key)