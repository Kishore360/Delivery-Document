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
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_user_group_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a110 
on (a11.change_request_key = a110.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_closed_by_c a111 
on (a11.closed_by_key = a111.row_key) 
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_department a112 
on (a11.opened_by_department_key = a112.row_key) 
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
select 'ldb.d_problem_it_provider_service_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_it_provider_service_c a115 
on (a11.it_provider_service_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_opened_by_c a116 
on (a11.opened_by_key = a116.row_key) 
union
select 'ldb.d_problem_impact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a117 
on (a11.impact_src_key = a117.row_key) 
union
select 'ldb.d_problem_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a118 
on (a11.priority_src_key = a118.row_key) 
union
select 'ldb.d_problem_reported_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a119 
on (a11.reported_type_src_key = a119.row_key) 
union
select 'ldb.d_problem_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_problem_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_problem_state_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_state_c a122 
on (a11.state_state_src_key = a122.row_key) 
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a123 
on (a11.location_key = a123.row_key) 
union
select 'ldb.d_location_assigned_to a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_location_assigned_to a124 
on (a15.location_key = a124.row_key) 
union
select 'ldb.dh_user_group_level1 a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level1 a125 
on (a17.lev_1_key = a125.row_key) 
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a126 
on (a19.month_start_date_key = a126.row_key) 
union
select 'ldb.d_problem_resolution_code_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
join ldb.d_problem_resolution_code_c a127 
on (a14.resolution_code_src_c_key = a127.row_key) 
union
select 'ldb.dh_user_group_level2 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level2 a128 
on (a17.lev_2_key = a128.row_key) 
union
select 'ldb.dh_user_group_level3 a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level3 a129 
on (a17.lev_3_key = a129.row_key) 
union
select 'ldb.dh_user_group_level4 a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level4 a130 
on (a17.lev_4_key = a130.row_key) 