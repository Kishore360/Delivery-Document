select 'ldb.f_vending_machine_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
union
select 'ldb.d_calendar_time a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
join ldb.d_calendar_time a12 
on (a11.transaction_time_c_key = a12.row_key) 
union
select 'ldb.d_vending_machine_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
join ldb.d_vending_machine_c a13 
on (a11.vendiing_machine_c_key = a13.row_key) 
union
select 'ldb.d_vendiing_product_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
join ldb.d_vendiing_product_c a14 
on (a11.product_c_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
join ldb.d_calendar_date a15 
on (a11.transaction_date_c_key = a15.row_key) 
union
select 'ldb.d_calendar_time_hour a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_vending_machine_c a11 
join ldb.d_calendar_time a12 
on (a11.transaction_time_c_key = a12.row_key) 
join ldb.d_calendar_time_hour a16 
on (a12.hour_24_format_num = a16.hour_24_format_num) 
