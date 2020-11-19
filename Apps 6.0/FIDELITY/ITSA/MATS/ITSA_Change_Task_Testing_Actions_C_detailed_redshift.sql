select 'ldb."f_testing_actions_c" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_testing_actions_c" a11
union
select 'ldb."d_change_task" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_testing_actions_c" a11
join "ldb"."d_change_task" a12
on (a11.change_task_key = a12.ROW_KEY)
union
select 'ldb."d_u_testing_actions_c" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_testing_actions_c" a11
join "ldb"."d_u_testing_actions_c" a13
on (a11.u_testing_actions_c_key = a13.ROW_KEY)