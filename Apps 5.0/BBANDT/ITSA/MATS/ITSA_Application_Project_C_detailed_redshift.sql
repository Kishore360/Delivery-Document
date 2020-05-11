select 'ldb.f_application_project_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_project_c a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_project_c a11
join ldb.d_archer_application_c a12
on (a11.archer_application_c_key = a12.row_key)
union
select 'ldb.d_application_project_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_project_c a11
join ldb.d_application_project_c a13
on (a11.application_project_key = a13.row_key)
union
select 'ldb.d_clarity_project_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_project_c a11
join ldb.d_clarity_project_c a14
on (a11.investment_c_key = a14.row_key)
union
select 'ldb.d_clarity_project_qtrr_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_project_c a11
join ldb.d_clarity_project_qtrr_c a15
on (a11.qtrr_investment_c_key = a15.row_key)