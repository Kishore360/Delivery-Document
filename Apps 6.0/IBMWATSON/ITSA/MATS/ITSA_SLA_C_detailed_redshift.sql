select 'ldb.f_sla_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
union
select 'ldb.d_sla_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_sla_c a15
on (a11.sla_c_key = a15.row_key)
union
select 'ldb.d_task_sla a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a16
on (a11.sla_key = a16.row_key)
union
select 'ldb.d_case a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_case a17
on (a11.case_key = a17.row_key)
union
select 'ldb.d_problem a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
union
select 'ldb.d_task_sla_stage a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla_stage a19
on (a11.stage_src_key = a19.row_key)
union
select 'ldb.d_lov_segment_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a110
on (a12.segment_type_c_key = a110.row_key)
union
select 'ldb.d_sla_case_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_sla_c a15
on (a11.sla_c_key = a15.row_key)
join ldb.d_sla_case_c a111
on (a15.case_c_key = a111.row_key)
union
select 'ldb.d_task_sla_name a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_task_sla a16
on (a11.sla_key = a16.row_key)
join ldb.d_task_sla_name a112
on (a16.sla_category_key = a112.row_key)
union
select 'ldb.d_sla_problem_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_sla_c a15
on (a11.sla_c_key = a15.row_key)
join ldb.d_sla_problem_c a113
on (a15.problem_c_key = a113.row_key)
union
select 'ldb.d_sla_tribe_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sla_c a11
join ldb.d_sla_c a15
on (a11.sla_c_key = a15.row_key)
join ldb.d_sla_tribe_c a114
on (a15.sla_tribe_c_key = a114.row_key)