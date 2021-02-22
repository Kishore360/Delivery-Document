select 'ldb.f_change_credit_score_detail_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11
union
select 'ldb.d_change_request a12 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11

join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_change_request_change_owner_c a13 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11

join ldb.d_change_request_change_owner_c a13
on (a11.change_request_change_owner_c_key = a13.row_key)
union
select 'ldb.d_change_request_approval a14 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11

join ldb.d_change_request_approval a14
on (a11.approval_state_src_key = a14.row_key)
union
select 'ldb.d_change_request_change_model_c a15 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11

join ldb.d_change_request_change_model_c a15
on (a11.change_model_c_key = a15.row_key)
union
select 'ldb.d_change_request_state a16 ' as Table_name, count(1) Row_Count
from ldb.f_change_credit_score_detail_c a11

join ldb.d_change_request_state a16
on (a11.state_src_key = a16.row_key)