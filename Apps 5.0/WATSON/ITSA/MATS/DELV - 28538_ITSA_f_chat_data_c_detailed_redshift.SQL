select 'ldb.f_chat_data_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_chat_data_c a11
union
select 'ldb.d_chat_data_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_chat_data_c a11
join ldb.d_chat_data_c a12
on (a11.chat_data_c_key = a12.row_key)




