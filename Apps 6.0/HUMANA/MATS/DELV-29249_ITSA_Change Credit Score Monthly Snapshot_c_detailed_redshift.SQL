select 'ldb.n_change_credit_score_monthly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
union
select 'ldb.d_lov_change_credit_score_type_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_lov_change_credit_score_type_c a12
on (a11.change_credit_score_type_c_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_assignment_group_manager a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
union
select 'ldb.d_configuration_item_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a16
on (a13.mdm_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_calendar_month a17
on (a11.aggr_month_key = a17.row_key)
union
select 'ldb.d_ci_owned_by a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_ci_owned_by a18
on (a13.owned_by_key = a18.row_key)