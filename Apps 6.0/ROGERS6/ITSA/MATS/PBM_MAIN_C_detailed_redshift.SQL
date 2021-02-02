select 'ldb.f_pbm_main_c_fact a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pbm_main_c_fact a11
union
select 'ldb.d_pbm_main_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pbm_main_c_fact a11
join ldb.d_pbm_main_c a12
on (a11.pbm_main_c_key = a12.row_key)
union
select 'ldb.d_lov_pbm_state_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pbm_main_c_fact a11
join ldb.d_pbm_main_c a12
on (a11.pbm_main_c_key = a12.row_key)
join ldb.d_lov_pbm_state_c a13
on (a12.state_c_key = a13.row_key)
union
select 'ldb.d_lov_pbm_ticket_aging_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pbm_main_c_fact a11
join ldb.d_pbm_main_c a12
on (a11.pbm_main_c_key = a12.row_key)
join ldb.d_lov_pbm_ticket_aging_c a14
on (a12.pbm_ticket_aging_days_bucket_c_key = a14.row_key)
union
select 'ldb.d_lov_pbm_ticket_stale_aging_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_pbm_main_c_fact a11
join ldb.d_pbm_main_c a12
on (a11.pbm_main_c_key = a12.row_key)
join ldb.d_lov_pbm_ticket_stale_aging_c a15
on (a12.pbm_ticket_stale_aging_days_bucket_c_key = a15.row_key)

