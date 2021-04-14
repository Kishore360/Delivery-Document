/* Tables Accessed:
d_application_allowed_downtime_c
d_business_application_c
d_calendar_year_start_date_c */

select 'ldb."d_application_allowed_downtime_c" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_allowed_downtime_c" a11 
union
select 'ldb."d_business_application_c" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_allowed_downtime_c" a11 
join "ldb"."d_business_application_c" a12 
on (a11.business_application_c_key = a12.row_key) 
union
select 'ldb."d_calendar_year_start_date_c" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_application_allowed_downtime_c" a11 
join "ldb"."d_calendar_year_start_date_c" a13 
on (a11.year_start_date_c_key = a13.row_key)

