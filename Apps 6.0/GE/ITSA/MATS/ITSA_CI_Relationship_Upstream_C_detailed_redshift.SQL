select 'ldb.f_ci_relationship_upstream a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
union
select 'ldb.d_child_ci_upstream a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_child_ci_upstream a12
on (a11.child_ci_upstream_key = a12.row_key)
union
select 'ldb.d_parent_ci_upstream a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_parent_ci_upstream a13
on (a11.parent_ci_upstream_key = a13.row_key)
union
select 'ldb.d_child_ci_operational_status_upstream a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_child_ci_upstream a12
on (a11.child_ci_upstream_key = a12.row_key)
join ldb.d_child_ci_operational_status_upstream a14
on (a12.operational_status_src_key = a14.row_key)
union
select 'ldb.d_upstream_child_company_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_child_ci_upstream a12
on (a11.child_ci_upstream_key = a12.row_key)
join ldb.d_upstream_child_company_c a15
on (a12.upstream_child_company_c_key = a15.row_key)
union
select 'ldb.d_parent_ci_operational_status_upstream a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_parent_ci_upstream a13
on (a11.parent_ci_upstream_key = a13.row_key)
join ldb.d_parent_ci_operational_status_upstream a16
on (a13.operational_status_src_key = a16.row_key)
union
select 'ldb.d_upstream_parent_company_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ci_relationship_upstream a11
join ldb.d_parent_ci_upstream a13
on (a11.parent_ci_upstream_key = a13.row_key)
join ldb.d_upstream_parent_company_c a17
on (a13.upstream_parent_company_c_key = a17.row_key)