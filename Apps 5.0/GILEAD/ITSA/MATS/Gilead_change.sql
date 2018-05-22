select 'ldb.d_lov_change_request_outcome_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_request_outcome_c a129 
on (a17.change_outcome_src_c_key = a129.row_key) 
union
select 'ldb.d_lov_change_request_outcome_reason_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_request_outcome_reason_c a130 
on (a17.outcome_reason_src_c_key = a130.row_key) 

