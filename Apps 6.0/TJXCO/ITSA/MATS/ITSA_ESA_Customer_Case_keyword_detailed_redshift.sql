select 'ldb.f_case_keyword_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_keyword_c a11
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_keyword_c a11
join ldb.d_case          a12
on (a11.case_key = a12.row_key)



               
