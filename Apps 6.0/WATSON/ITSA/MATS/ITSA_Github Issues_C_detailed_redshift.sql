select 'ldb.f_github_issues_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
union
select 'ldb.d_segment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
union
select 'ldb.d_github_issues_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_github_issues_c a13
on (a11.github_issue_c_key = a13.row_key)
union
select 'ldb.d_case a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_case a14
on (a11.case_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_incident a15
on (a11.incident_c_key = a15.row_key)
union
select 'ldb.d_problem a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_problem a16
on (a11.problem_c_key = a16.row_key)
union
select 'ldb.d_problem_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_problem_task a17
on (a11.problem_task_c_key = a17.row_key)
union
select 'ldb.d_github_issues_problem_task_parent_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_github_issues_problem_task_parent_c a18
on (a11.problem_task_parent_key = a18.row_key)
union
select 'ldb.d_github_issues_tribe_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_github_issues_tribe_c a19
on (a11.tribe_c_key = a19.row_key)
union
select 'ldb.d_lov_segment_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_segment_c a12
on (a11.segment_c_key = a12.row_key)
join ldb.d_lov_segment_type_c a110
on (a12.segment_type_c_key = a110.row_key)
union
select 'ldb.d_github_service_map_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_github_issues_c a11
join ldb.d_github_issues_c a13
on (a11.github_issue_c_key = a13.row_key)
join ldb.d_github_service_map_c a111
on (a13.service_c_key = a111.row_key)

