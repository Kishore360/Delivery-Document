select 'ldb."f_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."d_configuration_item" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_configuration_item" a14
on (a11.CONFIGURATION_ITEM_KEY = a14.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_configuration_item" a14
on (a11.CONFIGURATION_ITEM_KEY = a14.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a15
on (a14.mdm_key = a15.ROW_KEY)
union
select 'ldb."D_INCIDENT" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
union
select 'ldb."d_incident_application_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_application_c" a17
on (a16.APPLICATION_C_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a13.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_application_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a19
on (a12.mdm_key = a19.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a110
on (a16.ENVIRONMENT_SRC_C_KEY = a110.ROW_KEY)
union
select 'ldb."d_incident_priority" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_priority" a111
on (a16.PRIORITY_SRC_KEY = a111.ROW_KEY)