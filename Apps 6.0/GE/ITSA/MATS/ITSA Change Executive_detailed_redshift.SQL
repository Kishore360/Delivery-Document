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
select 'ldb.d_assignment_group_manager a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key)
union
select 'ldb.d_h_ag_manager a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key)
join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
union
select 'ldb.d_application_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a16
on (a12.mdm_key = a16.row_key)
union
select 'ldb.d_ag_manager_level_1 a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key) join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
join ldb.d_ag_manager_level_1 a17
on (a15.assignment_group_manager_level_1_key = a17.row_key)
union
select 'ldb.d_ag_manager_level_2 a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key) join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
join ldb.d_ag_manager_level_2 a18
on (a15.assignment_group_manager_level_2_key = a18.row_key)
union
select 'ldb.d_ag_manager_level_3 a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key) join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
join ldb.d_ag_manager_level_3 a19
on (a15.assignment_group_manager_level_3_key = a19.row_key)
union
select 'ldb.d_ag_manager_level_4 a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key) join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
join ldb.d_ag_manager_level_4 a110
on (a15.assignment_group_manager_level_4_key = a110.row_key)
union
select 'ldb.d_ag_manager_level_5 a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key) join ldb.d_assignment_group_manager a14
on (a13.assignment_group_manager_key = a14.row_key) join ldb.d_h_ag_manager a15
on (a14.assignment_group_manager_hierarchy_key = a15.row_key)
join ldb.d_ag_manager_level_5 a111
on (a15.assignment_group_manager_level_5_key = a111.row_key)
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_calendar_month a112
on (a11.aggr_month_key = a112.row_key)
union
select 'ldb.d_internal_organization_department a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.n_change_credit_score_monthly a11
join ldb.d_internal_organization_department a113
on (a11.department_key = a113.row_key)