select 'ldb."F_INCIDENT_CLOSED" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
union
select 'ldb."d_internal_contact" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_contact" a12
on (a11.EMPLOYEE_KEY = a12.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_organization_group" a13
on (a11.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_date" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_calendar_date" a14
on (a11.DATE_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_contact" a12
on (a11.EMPLOYEE_KEY = a12.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a15
on (a12.employee_mdm_key = a15.ROW_KEY)
union
select 'ldb."D_INCIDENT" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
union
select 'ldb."d_incident_priority" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_priority" a17
on (a16.PRIORITY_SRC_KEY = a17.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_contact_assigned_to" a18
on (a11.ASSIGNED_TO_KEY = a18.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_incident_contacttype" a19
on (a11.REPORTED_TYPE_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_employee_location" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_contact" a12
on (a11.EMPLOYEE_KEY = a12.ROW_KEY) join "ldb"."d_internal_contact_mdm" a15
on (a12.employee_mdm_key = a15.ROW_KEY)
join "ldb"."d_employee_location" a110
on (a15.LOCATION_KEY = a110.ROW_KEY)
union
select 'ldb."d_incident_category" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_category" a111
on (a16.CATEGORY_SRC_KEY = a111.ROW_KEY)
union
select 'ldb."d_task_sla_resolution_flag" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_task_sla_resolution_flag" a112
on (a16.MET_RESOLUTION_SLA_FLAG_KEY = a112.ROW_KEY)
union
select 'ldb."d_task_sla_response_flag" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_task_sla_response_flag" a113
on (a16.MET_RESPONSE_SLA_FLAG_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_state" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_state" a114
on (a16.STATE_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a16
on (a11.INCIDENT_KEY = a16.ROW_KEY)
join "ldb"."d_incident_subcategory" a115
on (a16.SUB_CATEGORY_SRC_KEY = a115.ROW_KEY)

