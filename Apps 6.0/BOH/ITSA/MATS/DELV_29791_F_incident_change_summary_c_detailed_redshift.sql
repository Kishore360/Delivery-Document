select 'dw."F_INCIDENT_CHANGE_SUMMARY_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
union
select 'dw."d_calendar_month" a12 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."d_calendar_month" a12
on (a11.INC_CHG_DT_SUMMARY_C_KEY = a12.ROW_KEY)
union
select 'dw."d_calendar_quarter" a13 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."d_calendar_month" a12
on (a11.INC_CHG_DT_SUMMARY_C_KEY = a12.ROW_KEY)
join "dw"."d_calendar_quarter" a13
on (a12.quarter_start_date_key = a13.ROW_KEY)
union
select 'dw."D_INCIDENT_CHANGE_SS_ASSIGNED_TO" a14 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."D_INCIDENT_CHANGE_SS_ASSIGNED_TO" a14
on (a11.CHANGE_SNAPSHOT_ASSIGNED_TO_C_KEY = a14.ROW_KEY)
union
select 'dw."D_INCIDENT_CHANGE_SS_ASSIGNMENT_GROUP_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."D_INCIDENT_CHANGE_SS_ASSIGNMENT_GROUP_C" a15
on (a11.CHANGE_SNAPSHOT_ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'dw."D_INCIDENT_CHANGE_SNAPSHOT_DEPARTMENT_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."D_INCIDENT_CHANGE_SNAPSHOT_DEPARTMENT_C" a16
on (a11.CHANGE_SNAPSHOT_DEPARTMENT_C_KEY = a16.ROW_KEY)
union
select 'dw."d_calendar_year" a17 ' as Table_name, count(a11.row_key) Row_Count
from dw."F_INCIDENT_CHANGE_SUMMARY_C" a11
join "dw"."d_calendar_month" a12
on (a11.INC_CHG_DT_SUMMARY_C_KEY = a12.ROW_KEY) join "dw"."d_calendar_quarter" a13
on (a12.quarter_start_date_key = a13.ROW_KEY)
join "dw"."d_calendar_year" a17
on (a13.year_start_date_key = a17.ROW_KEY)