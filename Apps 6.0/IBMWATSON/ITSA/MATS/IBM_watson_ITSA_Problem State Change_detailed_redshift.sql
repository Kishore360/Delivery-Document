select 'ldb.f_problem_state_activity a11 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_calendar_date a12
on (a11.state_on_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_change_request a15 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
union
select 'ldb.d_problem a16 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
union
select 'ldb.d_tribe_c a17 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_tribe_c a17
on (a11.tribe_c_key = a17.row_key)
union
select 'ldb.d_segment_c a18 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_tribe_c a17
on (a11.tribe_c_key = a17.row_key)
join ldb.d_segment_c a18
on (a17.segment_c_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_calendar_date a12
on (a11.state_on_key = a12.row_key)
join ldb.d_calendar_month a19
on (a12.month_start_date_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_problem_from_state a111 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_from_state a111
on (a11.from_state_key = a111.row_key)
union
select 'ldb.d_problem_impact a112 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_impact a112
on (a11.impact_src_key = a112.row_key)
union
select 'ldb.d_problem_priority a113 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_priority a113
on (a11.priority_src_key = a113.row_key)
union
select 'ldb.d_problem_to_state a114 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_to_state a114
on (a11.to_state_key = a114.row_key)
union
select 'ldb.d_problem_urgency a115 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_urgency a115
on (a11.urgency_src_key = a115.row_key)
union
select 'ldb.d_problem_state a116 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_state a116
on (a11.current_problem_state_key = a116.row_key)
union
select 'ldb.d_lov_segment_type_c a117 ' as Table_name, count(1) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_tribe_c a17
on (a11.tribe_c_key = a17.row_key) join ldb.d_segment_c a18
on (a17.segment_c_key = a18.row_key)
join ldb.d_lov_segment_type_c a117
on (a18.segment_type_c_key = a117.row_key)
