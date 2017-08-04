select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_week a19 
on (a16.week_start_date_key = a19.row_key) 
union
select 'ldb.d_problem a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a110 
on (a11.problem_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a111 
on (a11.business_service_c_key = a111.row_key) 
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_organization_department a112 
on (a12.department_key = a112.row_key) 
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a113 
on (a12.row_current_key = a113.row_current_key) 
union
select 'ldb.d_calendar_time_hour a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a114 
on (a13.hour_24_format_num = a114.hour_24_format_num) 
union
select 'ldb.d_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a115 
on (a11.location_key = a115.row_key) 
union
select 'ldb.d_problem_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_category a116 
on (a11.category_src_key = a116.row_key) 
union
select 'ldb.d_problem_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a117 
on (a11.reported_type_src_key = a117.row_key) 
union
select 'ldb.d_problem_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a118 
on (a11.impact_src_key = a118.row_key) 
union
select 'ldb.d_internal_contact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a119 
on (a11.problem_manager_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_task_opened_by_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_task_opened_by_c a120 
on (a11.opened_by_key = a120.row_key) 
union
select 'ldb.d_problem_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a121 
on (a11.priority_src_key = a121.row_key) 
union
select 'ldb.d_internal_contact_task_resolved_by a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_task_resolved_by a122 
on (a11.closed_by_key = a122.row_key) 
union
select 'ldb.d_problem_subcategory a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_subcategory a123 
on (a11.sub_category_src_key = a123.row_key) 
union
select 'ldb.d_problem_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_internal_contact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a125 
on (a11.requestor_c_key = a125.row_key) 
union
select 'ldb.d_location_assigned_to a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_location_assigned_to a126 
on (a14.location_key = a126.row_key) 
union
select 'ldb.d_problem_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a110 
on (a11.problem_key = a110.row_key) 
join ldb.d_problem_state a127 
on (a110.state_src_key = a127.row_key) 
union
select 'ldb.d_calendar_month a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_month a128 
on (a16.month_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_quarter a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_quarter a129 
on (a16.quarter_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_year a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_year a130 
on (a16.year_start_date_key = a130.row_key) 
