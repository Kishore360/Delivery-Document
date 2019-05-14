select 'ldb.f_problem_ci_outage_day_lev_c a11 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_business_service a12
       on (a11.business_service_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_calendar_date a13
       on (a11.calendar_date_key = a13.row_key) 
union
select 'ldb.d_business_service_criticality a14 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_business_service a12
 on (a11.business_service_key = a12.row_key)
       join ldb.d_business_service_criticality a14
       on (a12.criticality_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_business_service a12
 on (a11.business_service_key = a12.row_key)
       join ldb.d_internal_contact a15
       on (a12.owner_c_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_configuration_item a16
       on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_problem a17 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_problem a17
       on (a11.problem_key = a17.row_key) 
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_calendar_date a13
 on (a11.calendar_date_key = a13.row_key)
       join ldb.d_calendar_year a18
       on (a13.year_start_date_key = a18.row_key)
       union
select 'ldb.d_lov_problem_severity_level_c a18 ' as Table_name, count(a11.problem_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11
 join ldb.d_lov_problem_severity_level_c a13
 on (a11.severity_level_c_key = a13.row_key)

