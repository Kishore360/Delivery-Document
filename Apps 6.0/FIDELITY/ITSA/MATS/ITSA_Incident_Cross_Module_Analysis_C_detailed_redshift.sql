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
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
union
select 'ldb."d_incident_application_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_incident_application_c" a15
on (a14.APPLICATION_C_KEY = a15.ROW_KEY)
union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a16
on (a12.month_start_date_key = a16.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_internal_organization_group" a17
on (a11.ASSIGNMENT_GROUP_KEY = a17.ROW_KEY)
union
select 'ldb."d_change_request_caused_by" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_change_request_caused_by" a18
on (a11.CAUSED_BY_CHANGE_KEY = a18.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_incident_contacttype" a19
on (a11.REPORTED_TYPE_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_incident_impact" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_incident_impact" a110
on (a11.IMPACT_SRC_KEY = a110.ROW_KEY)
union
select 'ldb."d_incident_urgency" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_incident_urgency" a111
on (a11.URGENCY_SRC_KEY = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."d_lov_incident_discovery_method_c" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_lov_incident_discovery_method_c" a113
on (a14.DISCOVERY_METHOD_SRC_C_KEY = a113.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a114
on (a14.ENVIRONMENT_SRC_C_KEY = a114.ROW_KEY)
union
select 'ldb."d_lov_incident_impacted_audience_c" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_lov_incident_impacted_audience_c" a115
on (a14.IMPACTED_AUDIENCE_SRC_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_incident_state" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_incident_state" a116
on (a14.STATE_SRC_KEY = a116.ROW_KEY)