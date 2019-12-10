select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
  on (a11.problem_key = a12.row_key)
union
select 'ldb.d_application a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a122
  on (a11.application_key = a122.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
  on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
  on (a11.employee_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
  on (a11.time_key = a15.row_key)
union
select 'ldb.d_problem_requester_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_requester_c a124
  on (a11.requester_c_key = a124.row_key)
union
select 'ldb.d_affected_services_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_affected_services_c a123
  on (a11.affected_services_c_key = a123.row_key)
union
select 'ldb.d_lov_problem_type_of_issue_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
  on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_type_of_issue_c a144
  on (a12.problem_type_of_issue_c_key = a144.row_key)