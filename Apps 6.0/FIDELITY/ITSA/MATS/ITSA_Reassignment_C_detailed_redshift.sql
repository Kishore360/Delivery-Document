select 'ldb."f_incident_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
union
select 'ldb."d_internal_organization_group" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_organization_group" a12
on (a11.current_assignment_group_key = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."D_INCIDENT" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_contact_to" a15
on (a11.to_assigned_to_key = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group_to" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_organization_group_to" a16
on (a11.to_assignment_group_key = a16.ROW_KEY)
union
select 'ldb."d_internal_contact_from" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_contact_from" a17
on (a11.from_assigned_to_key = a17.ROW_KEY)
union
select 'ldb."d_internal_organization_group_from" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_organization_group_from" a18
on (a11.from_assignment_group_key = a18.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_internal_organization_group" a12
on (a11.current_assignment_group_key = a12.ROW_KEY)
join "ldb"."d_assignment_group_manager" a19
on (a12.assignment_group_manager_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a110
on (a13.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_incident_priority" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_incident_priority" a111
on (a14.PRIORITY_SRC_KEY = a111.ROW_KEY)
union
select 'ldb."d_incident_state" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11
join "ldb"."D_INCIDENT" a14
on (a11.INCIDENT_KEY = a14.ROW_KEY)
join "ldb"."d_incident_state" a112
on (a14.STATE_SRC_KEY = a112.ROW_KEY)

