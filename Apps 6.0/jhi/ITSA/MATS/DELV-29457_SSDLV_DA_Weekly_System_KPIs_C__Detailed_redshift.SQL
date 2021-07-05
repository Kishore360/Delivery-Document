select 'ldb."F_N_SDA_WORK_ITEM_SYSTEM_WEEKLY_SNAPSHOT_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_SDA_WORK_ITEM_SYSTEM_WEEKLY_SNAPSHOT_C" a11
union
select 'ldb."d_calendar_week" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_SDA_WORK_ITEM_SYSTEM_WEEKLY_SNAPSHOT_C" a11
join "ldb"."d_calendar_week" a12
on (a11.WEEKLY_SYSTEM_SNAPSHOT_WEEK_C_KEY = a12.ROW_KEY)