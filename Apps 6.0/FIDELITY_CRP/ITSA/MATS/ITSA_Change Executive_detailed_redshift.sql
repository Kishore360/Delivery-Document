select 'ldb.n_change_credit_score_monthly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_application_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a14
on (a12.mdm_key = a14.row_key)
union
select 'ldb.d_assignment_group_leader a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
join ldb.d_assignment_group_leader a15
on (a13.assignment_group_leader_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_calendar_month a16
on (a11.aggr_month_key = a16.row_key)
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_department a17
on (a11.department_key = a17.row_key)