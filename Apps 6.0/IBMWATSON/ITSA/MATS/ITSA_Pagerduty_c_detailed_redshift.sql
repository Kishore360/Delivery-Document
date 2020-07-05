select 'ldb.f_pagerduty_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_pagerduty_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
union
select 'ldb.d_pagerduty_configuration_item_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_pagerduty_configuration_item_c a15
on (a14.configuration_item_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_case a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_case a17
on (a11.case_key = a17.row_key)
union
select 'ldb.d_configuration_item_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a18
on (a12.mdm_key = a18.row_key)
union
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_incident a19
on (a11.incident_key = a19.row_key)
union
select 'ldb.d_lov_segment_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a110
on (a13.segment_type_c_key = a110.row_key)
union
select 'ldb.d_pagerduty_assignment_group_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_pagerduty_assignment_group_c a111
on (a14.assignment_group_key = a111.row_key)
union
select 'ldb.d_pagerduty_case_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_pagerduty_case_c a112
on (a14.case_key = a112.row_key)
union
select 'ldb.d_pagerduty_incident_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_pagerduty_incident_c a113
on (a14.incident_key = a113.row_key)
union
select 'ldb.d_lov_pagerduty_priority_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_lov_pagerduty_priority_c a114
on (a14.priority_src_key = a114.row_key)
union
select 'ldb.d_pagerduty_services_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_pagerduty_services_c a115
on (a14.pagerduty_services_c_key = a115.row_key)
union
select 'ldb.d_lov_pagerduty_state_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key)
join ldb.d_lov_pagerduty_state_c a116
on (a14.state_src_key = a116.row_key)
union
select 'ldb.d_pagerduty_tribe_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pagerduty_c a11
join ldb.d_pagerduty_c a14
on (a11.pagerduty_c_key = a14.row_key) join ldb.d_pagerduty_configuration_item_c a15
on (a14.configuration_item_key = a15.row_key)
join ldb.d_pagerduty_tribe_c a117
on (a15.pagerduty_tribe_c_key = a117.row_key)