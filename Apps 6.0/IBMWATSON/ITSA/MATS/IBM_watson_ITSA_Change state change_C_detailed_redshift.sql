select 'ldb.f_change_request_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_change_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_internal_contact_assigned_to a17
on (a16.assigned_to_key = a17.row_key)
union
select 'ldb.d_change_request_assignment_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_assignment_group a18
on (a16.assignment_group_key = a18.row_key)
union
select 'ldb.d_change_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_configuration_item a19
on (a16.configuration_item_key = a19.row_key)
union
select 'ldb.d_change_configuration_item_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key) join ldb.d_change_configuration_item a19
on (a16.configuration_item_key = a19.row_key)
join ldb.d_change_configuration_item_mdm a110
on (a19.mdm_key = a110.row_key)
union
select 'ldb.d_change_request_from_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_from_state a111
on (a11.from_state_key = a111.row_key)
union
select 'ldb.d_change_request_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_priority a112
on (a11.priority_src_key = a112.row_key)
union
select 'ldb.d_change_request_risk a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_risk a113
on (a11.change_risk_key = a113.row_key)
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_state a114
on (a11.current_state_key = a114.row_key)
union
select 'ldb.d_change_request_to_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_to_state a115
on (a11.to_state_key = a115.row_key)
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_type a116
on (a11.change_type_key = a116.row_key)
union
select 'ldb.d_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a117
on (a12.mdm_key = a117.row_key)
union
select 'ldb.d_lov_segment_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a118
on (a13.segment_type_c_key = a118.row_key)
union
select 'ldb.d_change_request_tribe_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key) join ldb.d_change_configuration_item a19
on (a16.configuration_item_key = a19.row_key) join ldb.d_change_configuration_item_mdm a110
on (a19.mdm_key = a110.row_key)
join ldb.d_change_request_tribe_c a119
on (a110.change_request_tribe_c_key = a119.row_key)
