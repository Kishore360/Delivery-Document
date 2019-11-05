select 'ldb.f_chg_failure_deduction_detailed_c a11 ' as Table_name, count(a11.change_request_key) Row_Count
from ldb.f_chg_failure_deduction_detailed_c a11
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.change_request_key) Row_Count
from ldb.f_chg_failure_deduction_detailed_c a11
join ldb.d_internal_organization_group a12
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_chg_req_failure_deduction_c a13 ' as Table_name, count(a11.change_request_key) Row_Count
from ldb.f_chg_failure_deduction_detailed_c a11
join ldb.d_chg_req_failure_deduction_c a13
on (a11.change_request_key = a13.row_key)
union
select 'ldb.d_group_bu_c a14 ' as Table_name, count(a11.change_request_key) Row_Count
from ldb.f_chg_failure_deduction_detailed_c a11
join ldb.d_internal_organization_group a12
on (a11.assignment_group_key = a12.row_key)
join ldb.d_group_bu_c a14
on (a12.group_bu_c_key = a14.row_key)
union
select 'ldb.d_change_request_close_code a15 ' as Table_name, count(a11.change_request_key) Row_Count
from ldb.f_chg_failure_deduction_detailed_c a11
join ldb.d_chg_req_failure_deduction_c a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_request_close_code a15
on (a13.close_code_src_key = a15.row_key)