/* Tables Accessed:
d_calendar_month
f_time_transform_c */

select 'ldb."f_time_transform_c" a11 ' as Table_name, count(1) Row_Count
from ldb."f_time_transform_c" a11 
union
select 'ldb."d_calendar_month" a12 ' as Table_name, count(1) Row_Count
from ldb."f_time_transform_c" a11 
join "ldb"."d_calendar_month" a12 
on (a11.month_start_date_key = a12.row_key)