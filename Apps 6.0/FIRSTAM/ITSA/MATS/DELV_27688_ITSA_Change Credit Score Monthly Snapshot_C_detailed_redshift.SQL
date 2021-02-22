select 'ldb.n_change_credit_score_monthly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly_c a11
union
select 'ldb.d_change_request_change_owner_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly_c a11

join ldb.d_change_request_change_owner_c a12
on (a11.change_request_change_owner_c_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly_c a11

join ldb.d_calendar_month a13
on (a11.date_key = a13.row_key)

