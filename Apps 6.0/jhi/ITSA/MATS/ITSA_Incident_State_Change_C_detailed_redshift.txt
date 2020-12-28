select 'ldb."f_incident_state" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."D_INCIDENT" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
union
select 'ldb."d_parent_incident" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_parent_incident" a17
on (a16.PARENT_INCIDENT_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a12.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a19
on (a13.mdm_key = a19.ROW_KEY)
union
select 'ldb."d_incident_state_from" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_state_from" a110
on (a11.from_state_src_key = a110.ROW_KEY)
union
select 'ldb."d_incident_state_to" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_state_to" a111
on (a11.to_state_src_key = a111.ROW_KEY)
union
select 'ldb."d_incident_priority" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_priority" a112
on (a11.PRIORITY_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."d_incident_state" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_state" a113
on (a16.STATE_SRC_KEY = a113.ROW_KEY)