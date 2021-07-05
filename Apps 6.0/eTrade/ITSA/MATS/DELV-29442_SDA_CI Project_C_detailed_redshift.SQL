select 'ldb."f_build_project" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
union
select 'ldb."d_build_project" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
union
select 'ldb."d_first_build_run" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_first_build_run" a13
on (a12.first_build_run_key = a13.ROW_KEY)
union
select 'ldb."d_last_build_run" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_build_run" a14
on (a12.last_build_run_key = a14.ROW_KEY)
union
select 'ldb."d_last_completed_build_run" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_completed_build_run" a15
on (a12.last_completed_build_run_key = a15.ROW_KEY)
union
select 'ldb."d_last_failed_build_run" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_failed_build_run" a16
on (a12.last_failed_build_run_key = a16.ROW_KEY)
union
select 'ldb."d_last_stable_build_run" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_stable_build_run" a17
on (a12.last_stable_build_run_key = a17.ROW_KEY)
union
select 'ldb."d_last_successful_build_run" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_successful_build_run" a18
on (a12.last_successful_build_run_key = a18.ROW_KEY)
union
select 'ldb."d_last_unstable_build_run" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_unstable_build_run" a19
on (a12.last_unstable_build_run_key = a19.ROW_KEY)
union
select 'ldb."d_last_unsuccessful_build" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_project" a11
join "ldb"."d_build_project" a12
on (a11.build_project_key = a12.ROW_KEY)
join "ldb"."d_last_unsuccessful_build" a110
on (a12.last_unsuccessful_build_run_key = a110.ROW_KEY)






