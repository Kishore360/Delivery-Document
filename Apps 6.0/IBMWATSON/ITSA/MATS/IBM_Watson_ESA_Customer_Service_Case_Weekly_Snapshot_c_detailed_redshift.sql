select 'ldb.n_case_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
union
select 'ldb.d_case a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
union
select 'ldb.d_case_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
join ldb.d_case_configuration_item a13
on (a12.configuration_item_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
union
select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_calendar_week a18
on (a11.n_key = a18.row_key)
union
select 'ldb.d_case_assigned_to_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
join ldb.d_case_assigned_to_c a19
on (a12.assigned_to_c_key = a19.row_key)
union
select 'ldb.d_case_assignment_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
join ldb.d_case_assignment_group a110
on (a12.assignment_group_key = a110.row_key)
union
select 'ldb.d_case_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_calendar_week a111
on (a11.n_key = a111.row_key)
union
select 'ldb.d_case_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key) join ldb.d_case_configuration_item a13
on (a12.configuration_item_key = a13.row_key)
join ldb.d_case_configuration_item_mdm a112
on (a13.mdm_key = a112.row_key)
union
select 'ldb.d_case_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_priority a113
on (a11.priority_src_key = a113.row_key)
union
select 'ldb.d_case_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_state a114
on (a11.state_src_key = a114.row_key)
union
select 'ldb.d_case_tribe_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
join ldb.d_case_tribe_c a115
on (a12.case_tribe_c_key = a115.row_key)
union
select 'ldb.d_configuration_item_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_configuration_item_mdm a116
on (a14.mdm_key = a116.row_key)
union
select 'ldb.d_lov_segment_type_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a117
on (a15.segment_type_c_key = a117.row_key)
