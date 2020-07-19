select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_archer_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_archer_software_c a13
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
on (a11.date_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key)
join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
union
select 'ldb.d_problem a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a19
on (a11.assigned_to_key = a19.row_key)
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a110
on (a11.assignment_group_key = a110.row_key)
union
select 'ldb.d_lov_problem_category_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_lov_problem_category_c a111
on (a11.category_src_key = a111.row_key)
union
select 'ldb.d_problem_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a112
on (a11.priority_src_key = a112.row_key)
union
select 'ldb.d_problem_vendor_reference_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_vendor_reference_c a113
on (a11.vendor_reference_c_key = a113.row_key)
union
select 'ldb.d_business_service_criticality a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_criticality a114
on (a14.criticality_key = a114.row_key)
union
select 'ldb.d_business_service_used_for a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_used_for a115
on (a14.used_for_src_key = a115.row_key)
union
select 'ldb.d_calendar_week a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_week a116
on (a15.week_start_date_key = a116.row_key)
union
select 'ldb.d_lov_problem_cause_code_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_cause_code_c a117
on (a18.cause_code_c_key = a117.row_key)
union
select 'ldb.d_lov_problem_itlc_poc_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_itlc_poc_c a118
on (a18.itlc_poc_c_key = a118.row_key)
union
select 'ldb.d_problem_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_state a119
on (a18.state_src_key = a119.row_key)
union
select 'ldb.d_lov_problem_sub_cause_code_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_sub_cause_code_c a120
on (a18.sub_cause_code_c_key = a120.row_key)
union
select 'ldb.d_lov_problem_tertiary_cause_code_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_tertiary_cause_code_c a121
on (a18.tertiary_cause_code_c_key = a121.row_key)
union
select 'ldb.d_calendar_year a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a16
on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
join ldb.d_calendar_year a122
on (a17.year_start_date_key = a122.row_key)