select 'ldb.f_change_request_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_segment_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_segment_c a14
on (a11.segment_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a18
on (a12.month_start_date_key = a18.row_key)
union
select 'ldb.d_change_request_from_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_from_state a19
on (a11.from_state_key = a19.row_key)
union
select 'ldb.d_change_request_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_priority a110
on (a11.priority_src_key = a110.row_key)
union
select 'ldb.d_change_request_state_activity_tribe_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_state_activity_tribe_c a111
on (a11.tribe_c_key = a111.row_key)
union
select 'ldb.d_change_request_risk a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_risk a112
on (a11.change_risk_key = a112.row_key)
union
select 'ldb.d_change_request_state a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_state a113
on (a11.current_state_key = a113.row_key)
union
select 'ldb.d_change_request_to_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_to_state a114
on (a11.to_state_key = a114.row_key)
union
select 'ldb.d_change_request_type a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_change_request_type a115
on (a11.change_type_key = a115.row_key)
union
select 'ldb.d_configuration_item_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a116
on (a13.mdm_key = a116.row_key)
union
select 'ldb.d_lov_segment_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_state_activity a11
join ldb.d_segment_c a14
on (a11.segment_c_key = a14.row_key)
join ldb.d_lov_segment_type_c a117
on (a14.segment_type_c_key = a117.row_key)


