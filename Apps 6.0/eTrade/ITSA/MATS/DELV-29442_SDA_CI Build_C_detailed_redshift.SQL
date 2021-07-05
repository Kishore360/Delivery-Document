select 'ldb."f_build_run" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
union
select 'ldb."d_build_run" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_run" a12
on (a11.build_run_key = a12.ROW_KEY)
union
select 'ldb."d_build_project" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
union
select 'ldb."d_ci_build_date" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_ci_build_date" a14
on (a11.ci_build_date_key = a14.ROW_KEY)
union
select 'ldb."d_ci_build_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_ci_build_date" a14
on (a11.ci_build_date_key = a14.ROW_KEY)
join "ldb"."d_ci_build_calendar_month" a15
on (a14.month_start_date_key = a15.ROW_KEY)
union
select 'ldb."d_ci_build_calendar_quarter" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_ci_build_date" a14
on (a11.ci_build_date_key = a14.ROW_KEY) join "ldb"."d_ci_build_calendar_month" a15
on (a14.month_start_date_key = a15.ROW_KEY)
join "ldb"."d_ci_build_calendar_quarter" a16
on (a15.quarter_start_date_key = a16.ROW_KEY)
union
select 'ldb."d_build_project_class" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_build_project_class" a17
on (a13.buildproject_class_key = a17.ROW_KEY)
union
select 'ldb."d_build_run_result" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_run" a12
on (a11.build_run_key = a12.ROW_KEY)
join "ldb"."d_build_run_result" a18
on (a12.build_result_src_key = a18.ROW_KEY)
union
select 'ldb."d_build_run_class" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_run" a12
on (a11.build_run_key = a12.ROW_KEY)
join "ldb"."d_build_run_class" a19
on (a12.build_class_key = a19.ROW_KEY)
union
select 'ldb."d_build_run_state" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_run" a12
on (a11.build_run_key = a12.ROW_KEY)
join "ldb"."d_build_run_state" a110
on (a12.build_state_src_key = a110.ROW_KEY)
union
select 'ldb."d_ci_build_calendar_week" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_ci_build_date" a14
on (a11.ci_build_date_key = a14.ROW_KEY)
join "ldb"."d_ci_build_calendar_week" a111
on (a14.week_start_date_key = a111.ROW_KEY)
union
select 'ldb."d_last_build_run" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_build_run" a112
on (a13.last_build_run_key = a112.ROW_KEY)
union
select 'ldb."d_last_completed_build_run" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_completed_build_run" a113
on (a13.last_completed_build_run_key = a113.ROW_KEY)
union
select 'ldb."d_last_failed_build_run" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_failed_build_run" a114
on (a13.last_failed_build_run_key = a114.ROW_KEY)
union
select 'ldb."d_last_stable_build_run" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_stable_build_run" a115
on (a13.last_stable_build_run_key = a115.ROW_KEY)
union
select 'ldb."d_last_successful_build_run" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_successful_build_run" a116
on (a13.last_successful_build_run_key = a116.ROW_KEY)
union
select 'ldb."d_last_unstable_build_run" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_unstable_build_run" a117
on (a13.last_unstable_build_run_key = a117.ROW_KEY)
union
select 'ldb."d_last_unsuccessful_build" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_build_project" a13
on (a11.build_project_key = a13.ROW_KEY)
join "ldb"."d_last_unsuccessful_build" a118
on (a13.last_unsuccessful_build_run_key = a118.ROW_KEY)
union
select 'ldb."d_ci_build_calendar_year" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_build_run" a11
join "ldb"."d_ci_build_date" a14
on (a11.ci_build_date_key = a14.ROW_KEY) join "ldb"."d_ci_build_calendar_month" a15
on (a14.month_start_date_key = a15.ROW_KEY) join "ldb"."d_ci_build_calendar_quarter" a16
on (a15.quarter_start_date_key = a16.ROW_KEY)
join "ldb"."d_ci_build_calendar_year" a119
on (a16.year_start_date_key = a119.ROW_KEY)





