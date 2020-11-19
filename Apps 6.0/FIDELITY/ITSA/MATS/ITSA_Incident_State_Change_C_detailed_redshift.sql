select 'ldb."f_incident_state" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
union
select 'ldb."d_incident_activity_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_activity_date" a12
on (a11.incident_activity_date_key = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
union
select 'ldb."d_incident_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_assigned_to" a14
on (a13.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_incident_assignment_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_assignment_group" a15
on (a13.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_configuration_item_incident" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_incident" a16
on (a13.CONFIGURATION_ITEM_KEY = a16.ROW_KEY)
union
select 'ldb."d_parent_incident" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_parent_incident" a17
on (a13.PARENT_INCIDENT_KEY = a17.ROW_KEY)
union
select 'ldb."d_incident_activity_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_activity_date" a12
on (a11.incident_activity_date_key = a12.ROW_KEY)
join "ldb"."d_incident_activity_calendar_month" a18
on (a12.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_incident_state_from" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_state_from" a19
on (a11.from_state_src_key = a19.ROW_KEY)
union
select 'ldb."d_incident_state_to" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_state_to" a110
on (a11.to_state_src_key = a110.ROW_KEY)
union
select 'ldb."d_incident_configuration_item_mdm" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY) join "ldb"."d_configuration_item_incident" a16
on (a13.CONFIGURATION_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_incident_configuration_item_mdm" a111
on (a16.mdm_key = a111.ROW_KEY)
union
select 'ldb."d_incident_priority" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."d_incident_priority" a112
on (a11.PRIORITY_SRC_KEY = a112.ROW_KEY)
union
select 'ldb."d_incident_state" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_state" a113
on (a13.STATE_SRC_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_assignment_group_manager" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_state" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY) join "ldb"."d_incident_assignment_group" a15
on (a13.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
join "ldb"."d_incident_assignment_group_manager" a114
on (a15.manager_key = a114.ROW_KEY)