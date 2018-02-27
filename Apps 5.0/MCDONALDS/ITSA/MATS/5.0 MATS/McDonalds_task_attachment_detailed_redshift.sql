select 'ldb.f_sys_attachment_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sys_attachment_c a11 
union
select 'ldb.d_sys_attachment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sys_attachment_c a11 
join ldb.d_sys_attachment_c a12 
on (a11.sys_attachment_c_key = a12.row_key) 
union
select 'ldb.d_macm_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_sys_attachment_c a11 
join ldb.d_macm_c a13 
on (a11.macm_c_key = a13.row_key) 