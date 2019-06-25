select 'ldb.f_problem_ci_outage_day_lev_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_calendar_date a13 
on (a11.calendar_date_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_calendar_date a13 
on (a11.calendar_date_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_calendar_date a13 
on (a11.calendar_date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
union
select 'ldb.d_business_service_criticality a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key) 
join ldb.d_business_service_criticality a16 
on (a12.criticality_key = a16.row_key) 
union
select 'ldb.d_internal_contact_business_service_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_business_service a12 
on (a11.business_service_key = a12.row_key) 
join ldb.d_internal_contact_business_service_c a17 
on (a12.owner_c_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_problem a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_problem a19 
on (a11.problem_key = a19.row_key) 
union
select 'ldb.d_calendar_year a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_ci_outage_day_lev_c a11 
join ldb.d_calendar_date a13 
on (a11.calendar_date_key = a13.row_key) join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15 
on (a14.quarter_start_date_key = a15.row_key) 
join ldb.d_calendar_year a110 
on (a15.year_start_date_key = a110.row_key) 