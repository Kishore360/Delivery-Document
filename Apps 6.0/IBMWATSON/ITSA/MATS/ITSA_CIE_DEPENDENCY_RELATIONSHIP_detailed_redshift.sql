select 'ldb.f_cie_relationship_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_calendar_date a12
on (a11.parent_incident_cie_opened_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_calendar_date a12
on (a11.parent_incident_cie_opened_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_calendar_date a12
on (a11.parent_incident_cie_opened_on_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_year a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_calendar_date a12
on (a11.parent_incident_cie_opened_on_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a15
on (a14.year_start_date_key = a15.row_key)
union
select 'ldb.d_segment_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_segment_c a16
on (a11.segment_cie_c_key = a16.row_key)
union
select 'ldb.d_incident_cie_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_cie_c a17
on (a11.incident_cie_c_key = a17.row_key)
union
select 'ldb.d_problem_cie_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_cie_c a18
on (a11.problem_cie_c_key = a18.row_key)
union
select 'ldb.d_problem_group_cie_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_group_cie_c a19
on (a11.problem_group_cie_c_key = a19.row_key)
union
select 'ldb.d_incident_parent_cie_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_parent_cie_c a110
on (a11.parent_incident_cie_c_key = a110.row_key)
union
select 'ldb.d_problem_parent_cie_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_parent_cie_c a111
on (a11.parent_problem_cie_c_key = a111.row_key)
union
select 'ldb.d_customerservice_case_cie_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_customerservice_case_cie_c a112
on (a11.case_cie_c_key = a112.row_key)
union
select 'ldb.d_customerservice_case_parent_cie_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_customerservice_case_parent_cie_c a113
on (a11.parent_case_cie_c_key = a113.row_key)
union
select 'ldb.d_lov_segment_type_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_segment_c a16
on (a11.segment_cie_c_key = a16.row_key)
join ldb.d_lov_segment_type_c a114
on (a16.segment_type_c_key = a114.row_key)
union
select 'ldb.d_configuration_item_cie_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_cie_c a17
on (a11.incident_cie_c_key = a17.row_key)
join ldb.d_configuration_item_cie_c a115
on (a17.configuration_item_key = a115.row_key)
union
select 'ldb.d_lov_incident_cie_priority_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_cie_c a17
on (a11.incident_cie_c_key = a17.row_key)
join ldb.d_lov_incident_cie_priority_c a116
on (a17.priority_src_key = a116.row_key)
union
select 'ldb.d_lov_incident_cie_state_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_cie_c a17
on (a11.incident_cie_c_key = a17.row_key)
join ldb.d_lov_incident_cie_state_c a117
on (a17.state_src_key = a117.row_key)
union
select 'ldb.d_tribe_cie_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_cie_c a17
on (a11.incident_cie_c_key = a17.row_key)
join ldb.d_tribe_cie_c a118
on (a17.tribe_c_key = a118.row_key)
union
select 'ldb.d_change_request_cie_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_cie_c a18
on (a11.problem_cie_c_key = a18.row_key)
join ldb.d_change_request_cie_c a119
on (a18.u_caused_by_change_number_c_key = a119.row_key)
union
select 'ldb.d_lov_problem_root_cause_code_cie_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_cie_c a18
on (a11.problem_cie_c_key = a18.row_key)
join ldb.d_lov_problem_root_cause_code_cie_c a120
on (a18.root_cause_codes_src_c_key = a120.row_key)
union
select 'ldb.d_lov_problem_state_cie_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_cie_c a18
on (a11.problem_cie_c_key = a18.row_key)
join ldb.d_lov_problem_state_cie_c a121
on (a18.state_src_key = a121.row_key)
union
select 'ldb.d_lov_problem_status_cie_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_problem_cie_c a18
on (a11.problem_cie_c_key = a18.row_key)
join ldb.d_lov_problem_status_cie_c a122
on (a18.status_src_c_key = a122.row_key)
union
select 'ldb.d_lov_parent_incident_cie_priority_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cie_relationship_c a11
join ldb.d_incident_parent_cie_c a110
on (a11.parent_incident_cie_c_key = a110.row_key)
join ldb.d_lov_parent_incident_cie_priority_c a123
on (a110.priority_src_key = a123.row_key)