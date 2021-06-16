select 'ldb.f_brazil_inventory_c_fact a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_brazil_inventory_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
join ldb.d_brazil_inventory_c a13
on (a11.brazil_inventory_c_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_inventory_c_fact a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a14
on (a12.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a16
on (a15.year_start_date_key = a16.row_key)