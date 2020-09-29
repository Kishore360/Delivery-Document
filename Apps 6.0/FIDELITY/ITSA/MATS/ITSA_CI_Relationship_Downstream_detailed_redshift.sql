select 'ldb."f_ci_relationship_downstream" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_ci_relationship_downstream" a11
union
select 'ldb."d_child_ci_downstream" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_ci_relationship_downstream" a11
join "ldb"."d_child_ci_downstream" a12
on (a11.child_ci_downstream_key = a12.ROW_KEY)
union
select 'ldb."d_parent_ci_downstream" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_ci_relationship_downstream" a11
join "ldb"."d_parent_ci_downstream" a13
on (a11.parent_ci_downstream_key = a13.ROW_KEY)
union
select 'ldb."d_child_ci_operational_status_downstream" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_ci_relationship_downstream" a11
join "ldb"."d_child_ci_downstream" a12
on (a11.child_ci_downstream_key = a12.ROW_KEY)
join "ldb"."d_child_ci_operational_status_downstream" a14
on (a12.operational_status_src_key = a14.ROW_KEY)
union
select 'ldb."d_parent_ci_operational_status_downstream" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_ci_relationship_downstream" a11
join "ldb"."d_parent_ci_downstream" a13
on (a11.parent_ci_downstream_key = a13.ROW_KEY)
join "ldb"."d_parent_ci_operational_status_downstream" a15
on (a13.operational_status_src_key = a15.ROW_KEY