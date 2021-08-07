select 'ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
union
select 'ldb."D_PROJECT_YTD_SEGMENT_GROUP_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_PROJECT_YTD_SEGMENT_GROUP_C" a12
on (a11.PROJECT_YTD_SEGMENT_GROUP_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_CALENDAR_MONTH" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_CALENDAR_MONTH" a13
on (a11.AGGR_YTD_MONTH_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_PROJECT_YTD_DEPARTMENT_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_PROJECT_YTD_DEPARTMENT_C" a14
on (a11.PLANVIEW_PROJECT_DEPARTMENT_C_KEY = a14.ROW_KEY)
union
select 'ldb."D_LOV_PROJECT_PHASE_SNAPSHOT_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_LOV_PROJECT_PHASE_SNAPSHOT_C" a15
on (a11.PROJECT_PHASE_SNAPSHOT_C_KEY = a15.ROW_KEY)
union
select 'ldb."D_LOV_PROJECT_YTD_SEGMENT_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_LOV_PROJECT_YTD_SEGMENT_C" a16
on (a11.PROJECT_SEGMENT_C_KEY = a16.ROW_KEY)
union
select 'ldb."D_LOV_PROJECT_YTD_STATE_SRC_C" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_PROJECT_YTD_MONTHLY_SNAPSHOT_C" a11
join "ldb"."D_LOV_PROJECT_YTD_STATE_SRC_C" a17
on (a11.PROJECT_STATE_SRC_KEY = a17.ROW_KEY)

 