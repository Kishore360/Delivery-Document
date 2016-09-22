select 'f_change_request' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'd_change_request_close_code_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join        ldb.d_change_request  a116
                  on   a11.change_request_key=a116.row_key
join        ldb.d_change_request_close_code_c     a138
                  on         (a116.close_code_c_key = a138.row_key)
				  