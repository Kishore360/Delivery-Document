select 'ldb."f_incident" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a14
on (a13.mdm_key = a14.ROW_KEY)
union
select 'ldb."D_INCIDENT" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
union
select 'ldb."d_incident_assignment_group_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_assignment_group_c" a16
on (a15.ASSIGNMENT_GROUP_C_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_month" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a17
on (a12.month_start_date_key = a17.ROW_KEY)
union
select 'ldb."d_lov_incident_discovery_method_c" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_lov_incident_discovery_method_c" a18
on (a15.DISCOVERY_METHOD_SRC_C_KEY = a18.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a19
on (a15.ENVIRONMENT_SRC_C_KEY = a19.ROW_KEY)
union
select 'ldb."d_incident_priority" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_priority" a110
on (a15.PRIORITY_SRC_KEY = a110.ROW_KEY)