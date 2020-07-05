select 'ldb.f_problem_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_problem a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key)
union
select 'ldb.d_problem_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key)
join ldb.d_problem_internal_contact_assigned_to a18
on (a17.assigned_to_key = a18.row_key)
union
select 'ldb.d_problem_assignment_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key)
join ldb.d_problem_assignment_group a19
on (a17.assignment_group_key = a19.row_key)
union
select 'ldb.d_problem_change a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key)
join ldb.d_problem_change a110
on (a17.change_key = a110.row_key)
union
select 'ldb.d_problem_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key)
join ldb.d_problem_configuration_item a111
on (a17.configuration_item_key = a111.row_key)
union
select 'ldb.d_problem_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key) join ldb.d_problem_configuration_item a111
on (a17.configuration_item_key = a111.row_key)
join ldb.d_problem_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
union
select 'ldb.d_configuration_item_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a113
on (a12.mdm_key = a113.row_key)
union
select 'ldb.d_problem_from_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_from_state a114
on (a11.from_state_key = a114.row_key)
union
select 'ldb.d_problem_impact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_impact a115
on (a11.impact_src_key = a115.row_key)
union
select 'ldb.d_problem_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_priority a116
on (a11.priority_src_key = a116.row_key)
union
select 'ldb.d_problem_to_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_to_state a117
on (a11.to_state_key = a117.row_key)
union
select 'ldb.d_problem_urgency a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_urgency a118
on (a11.urgency_src_key = a118.row_key)
union
select 'ldb.d_lov_segment_type_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a119
on (a13.segment_type_c_key = a119.row_key)
union
select 'ldb.d_problem_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem_state a120
on (a11.current_problem_state_key = a120.row_key)
union
select 'ldb.d_problem_state_activity_tribe_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key) join ldb.d_problem_configuration_item a111
on (a17.configuration_item_key = a111.row_key) join ldb.d_problem_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
join ldb.d_problem_state_activity_tribe_c a121
on (a112.tribe_configuration_item_c_key = a121.row_key)
union
select 'ldb.d_problem_tribe_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_state_activity a11
join ldb.d_problem a17
on (a11.problem_key = a17.row_key) join ldb.d_problem_configuration_item a111
on (a17.configuration_item_key = a111.row_key)
join ldb.d_problem_tribe_c a122
on (a111.problem_tribe_c_key = a122.row_key)
