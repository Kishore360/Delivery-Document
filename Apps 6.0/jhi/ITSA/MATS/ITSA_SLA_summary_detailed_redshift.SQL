select 'ldb."f_incident_task_sla" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_internal_organization_group" a12
on (a11.ASSIGNMENT_GROUP_KEY = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY)
join "ldb"."d_calendar_quarter" a15
on (a14.quarter_start_date_key = a15.ROW_KEY)
union
select 'ldb."D_INCIDENT" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
union
select 'ldb."d_task_sla" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_task_sla" a17
on (a11.sla_key = a17.ROW_KEY)
union
select 'ldb."d_task_sla_stage" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_task_sla_stage" a18
on (a11.stage_src_key = a18.ROW_KEY)
union
select 'ldb."d_incident_priority" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_priority" a19
on (a16.PRIORITY_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_task_sla_name" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_task_sla" a17
on (a11.sla_key = a17.ROW_KEY)
join "ldb"."d_task_sla_name" a110
on (a17.sla_category_key = a110.ROW_KEY)
union
select 'ldb."d_calendar_year" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_task_sla" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY) join "ldb"."d_calendar_quarter" a15
on (a14.quarter_start_date_key = a15.ROW_KEY)
join "ldb"."d_calendar_year" a111
on (a15.year_start_date_key = a111.ROW_KEY)