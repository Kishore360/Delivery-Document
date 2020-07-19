select 'ldb.f_technical_health_check_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_archer_application_c a12
on (a11.archer_application_c_key = a12.row_key)
union
select 'ldb.d_eit_application_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_eit_application_c a13
on (a11.eit_application_c_key = a13.row_key)
union
select 'ldb.d_technical_health_check_execution_status_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_technical_health_check_execution_status_c a14
on (a11.execution_status_c_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_calendar_month a15
on (a11.month_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_division_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_eit_application_c a13
on (a11.eit_application_c_key = a13.row_key)
join ldb.d_internal_contact_division_manager_c a16
on (a13.division_manager_key = a16.row_key)
union
select 'ldb.d_lov_software_tier_rating_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_technical_health_check_c a11
join ldb.d_eit_application_c a13
on (a11.eit_application_c_key = a13.row_key)
join ldb.d_lov_software_tier_rating_c a17
on (a13.software_tier_rating_src_c_key = a17.row_key)