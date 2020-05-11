select 'ldb.n_case_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_calendar_week a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_calendar_week a16
on (a11.n_key = a16.row_key)
union
select 'ldb.d_case a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case a17
on (a11.case_key = a17.row_key)
union
select 'ldb.d_case_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_priority a18
on (a11.priority_src_key = a18.row_key)
union
select 'ldb.d_case_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_state a19
on (a11.state_src_key = a19.row_key)
union
select 'ldb.d_case_weekly_tribe_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_case_weekly_tribe_c a110
on (a11.tribe_c_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a111
on (a12.mdm_key = a111.row_key)
union
select 'ldb.d_lov_segment_type_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_case_weekly_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a112
on (a13.segment_type_c_key = a112.row_key)
