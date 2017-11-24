

select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customerservice_case_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customerservice_case_c a12 
on (a11.customerservice_case_c_key = a12.row_key) 
union
select 'ldb.d_tribe_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_tribe_c a12 
on (a11.tribe_c_key = a12.row_key) 