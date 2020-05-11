select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_software_c a13
on (a11.archer_id_c_key = a13.row_key)
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.opened_on_key = a15.row_key)
union
select 'ldb.d_problem a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month a17
on (a15.month_start_date_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a19
on (a11.assignment_group_key = a19.row_key)
union
select 'ldb.d_lov_problem_category_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_lov_problem_category_c a110
on (a11.category_src_key = a110.row_key)
union
select 'ldb.d_problem_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a111
on (a11.priority_src_key = a111.row_key)
union
select 'ldb.d_problem_vendor_reference_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_vendor_reference_c a112
on (a11.vendor_reference_c_key = a112.row_key)
union
select 'ldb.d_business_service_criticality a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_criticality a113
on (a14.criticality_key = a113.row_key)
union
select 'ldb.d_business_service_used_for a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_used_for a114
on (a14.used_for_src_key = a114.row_key)
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_week a115
on (a15.week_start_date_key = a115.row_key)
union
select 'ldb.d_lov_problem_cause_code_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_cause_code_c a116
on (a16.cause_code_c_key = a116.row_key)
union
select 'ldb.d_lov_problem_itlc_poc_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_itlc_poc_c a117
on (a16.itlc_poc_c_key = a117.row_key)
union
select 'ldb.d_problem_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_problem_state a118
on (a16.state_src_key = a118.row_key)
union
select 'ldb.d_lov_problem_sub_cause_code_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_sub_cause_code_c a119
on (a16.sub_cause_code_c_key = a119.row_key)
union
select 'ldb.d_lov_problem_tertiary_cause_code_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_tertiary_cause_code_c a120
on (a16.tertiary_cause_code_c_key = a120.row_key)
union
select 'ldb.d_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_quarter a121
on (a15.quarter_start_date_key = a121.row_key)
union
select 'ldb.d_calendar_year a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_year a122
on (a15.year_start_date_key = a122.row_key)