select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to_dlink_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to_dlink_c a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group_dlink_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group_dlink_c a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_configuration_item_dlink_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item_dlink_c a15
on (a11.configuration_item_key = a15.row_key)
union
select 'ldb.d_calendar_date_dlink_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date_dlink_c a16
on (a11.opened_on_key = a16.row_key)
union
select 'ldb.d_problem_dlink_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
union
select 'ldb.d_incident_dlink_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident_dlink_c a18
on (a11.incident_key = a18.row_key)
union
select 'ldb.d_calendar_month_dlink_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date_dlink_c a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month_dlink_c a19
on (a16.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_year_dlink_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date_dlink_c a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_year_dlink_c a110
on (a16.year_start_date_key = a110.row_key)
union
select 'ldb.d_change_request_caused_by_number_dlink_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request_caused_by_number_dlink_c a111
on (a11.u_caused_by_change_number_c_key = a111.row_key)
union
select 'ldb.d_problem_opened_by_dlink_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_opened_by_dlink_c a112
on (a11.opened_by_key = a112.row_key)
union
select 'ldb.d_problem_priority_dlink_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority_dlink_c a113
on (a11.priority_src_key = a113.row_key)
union
select 'ldb.d_problem_state_dlink_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_state_dlink_c a114
on (a11.state_src_key = a114.row_key)
union
select 'ldb.d_lov_segment_type_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a115
on (a12.segment_type_c_key = a115.row_key)
union
select 'ldb.d_tribe_dlink_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_tribe_dlink_c a116
on (a11.tribe_c_key = a116.row_key)
union
select 'ldb.d_incident_priority_dlink_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident_dlink_c a18
on (a11.incident_key = a18.row_key)
join ldb.d_incident_priority_dlink_c a117
on (a18.priority_src_key = a117.row_key)
union
select 'ldb.d_lov_incident_status_dlink_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident_dlink_c a18
on (a11.incident_key = a18.row_key)
join ldb.d_lov_incident_status_dlink_c a118
on (a18.incident_status_c_key = a118.row_key)
union
select 'ldb.d_internal_organization_group_rca_approval_group_dlink_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
join ldb.d_internal_organization_group_rca_approval_group_dlink_c a119
on (a17.rca_approval_group_problem_c_key = a119.row_key)
union
select 'ldb.d_problem_root_cause_codes_dlink_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
join ldb.d_problem_root_cause_codes_dlink_c a120
on (a17.root_cause_codes_src_c_key = a120.row_key)
union
select 'ldb.d_lov_problem_root_cause_sub_category_dlink_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
join ldb.d_lov_problem_root_cause_sub_category_dlink_c a121
on (a17.root_cause_sub_category_src_c_key = a121.row_key)
union
select 'ldb.d_lov_problem_status_dlink_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
join ldb.d_lov_problem_status_dlink_c a122
on (a17.status_src_c_key = a122.row_key)
union
select 'ldb.d_parent_problem_dlink_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_dlink_c a17
on (a11.problem_key = a17.row_key)
join ldb.d_parent_problem_dlink_c a123
on (a17.parent_problem_c_key = a123.row_key)
