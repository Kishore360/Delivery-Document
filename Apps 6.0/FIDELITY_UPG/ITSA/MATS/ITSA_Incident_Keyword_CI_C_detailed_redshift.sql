select 'ldb."f_incident_keyword" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
union
select 'ldb."d_configuration_item" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."d_configuration_item" a12
on (a11.CONFIGURATION_ITEM_KEY = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."D_INCIDENT" a14
on (a11.table_row_key = a14.ROW_KEY)
union
select 'ldb."d_calendar_month" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a15
on (a13.month_start_date_key = a15.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."D_INCIDENT" a14
on (a11.table_row_key = a14.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a16
on (a14.ENVIRONMENT_SRC_C_KEY = a16.ROW_KEY)
union
select 'ldb."d_lov_incident_discovery_method_c " a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."D_INCIDENT" a14
on (a11.table_row_key = a14.ROW_KEY)
join "ldb"."d_lov_incident_discovery_method_c" a17
on (a14.DISCOVERY_METHOD_SRC_C_KEY  = a17.ROW_KEY)
