select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
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
select 'ldb.d_master_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_master_item a19
on (a11.catalog_item_key = a19.row_key)
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a110
on (a18.year_start_date_key = a110.row_key)
union
select 'ldb.d_request_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item a111
on (a11.request_item_key = a111.row_key)
union
select 'ldb.d_req_item_opened_by a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item a111
on (a11.request_item_key = a111.row_key)
join ldb.d_req_item_opened_by a112
on (a111.opened_by_key = a112.row_key)
union
select 'ldb.d_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request a113
on (a11.request_key = a113.row_key)
union
select 'ldb.d_internal_contact_task_closed_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact_task_closed_by a114
on (a11.closed_by_key = a114.row_key)
union
select 'ldb.d_internal_organization_department a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_organization_department a115
on (a13.department_key = a115.row_key)
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_contact_mdm a116
on (a13.employee_mdm_key = a116.row_key)
union
select 'ldb.d_hr_change_category a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_hr_change_category a117
on (a11.hr_category_src_key = a117.row_key)
union
select 'ldb.d_hr_change a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_hr_change a118
on (a11.hr_change_key = a118.row_key)
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_location a119
on (a11.location_key = a119.row_key)
union
select 'ldb.d_sc_req_item_approval a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_approval a120
on (a11.approval_state_src_key = a120.row_key)
union
select 'ldb.d_request_item_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item_contacttype a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_sc_req_item_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_impact a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_sc_req_item_priority a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_priority a123
on (a11.priority_src_key = a123.row_key)
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
select 'ldb.d_sc_req_item_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_sc_req_item_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_internal_contact_requested_for a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_internal_contact_requested_for a127
on (a11.requested_for_key = a127.row_key)
union
select 'ldb.d_calendar_week a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week a128
on (a16.week_start_date_key = a128.row_key)
union
select 'ldb.d_sc_item_category a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_master_item a19
on (a11.catalog_item_key = a19.row_key)
join ldb.d_sc_item_category a129
on (a19.item_category_key = a129.row_key)
union
select 'ldb.d_item_category_code a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_master_item a19
on (a11.catalog_item_key = a19.row_key)
join ldb.d_item_category_code a130
on (a19.item_type_code_key = a130.row_key)
union
select 'ldb.d_request_location a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request a113
on (a11.request_key = a113.row_key)
join ldb.d_request_location a131
on (a113.location_key = a131.row_key)
union
select 'ldb.d_req_item_open_by_dept a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item a111
on (a11.request_item_key = a111.row_key) join ldb.d_req_item_opened_by a112
on (a111.opened_by_key = a112.row_key)
join ldb.d_req_item_open_by_dept a132
on (a112.department_key = a132.row_key)
union
select 'ldb.d_req_item_open_by_loc a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11
join ldb.d_request_item a111
on (a11.request_item_key = a111.row_key) join ldb.d_req_item_opened_by a112
on (a111.opened_by_key = a112.row_key)
join ldb.d_req_item_open_by_loc a133
on (a112.location_key = a133.row_key)