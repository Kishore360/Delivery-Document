select 'ldb."f_incident_resolved" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
union
select 'ldb."d_incident_employee" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_incident_employee" a12
on (a11.incident_employee_key = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
union
select 'ldb."d_incident_assignment_group" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_assignment_group" a14
on (a13.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
union
select 'ldb."d_incident_date" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_incident_date" a15
on (a11.incident_date_key = a15.ROW_KEY)
union
select 'ldb."d_incident_employee_mdm" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_incident_employee" a12
on (a11.incident_employee_key = a12.ROW_KEY)
join "ldb"."d_incident_employee_mdm" a16
on (a12.employee_mdm_key = a16.ROW_KEY)
union
select 'ldb."d_incident_priority" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_priority" a17
on (a13.PRIORITY_SRC_KEY = a17.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_incident_contacttype" a18
on (a11.REPORTED_TYPE_SRC_KEY = a18.ROW_KEY)
union
select 'ldb."d_incident_assigned_to" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_assigned_to" a19
on (a13.ASSIGNED_TO_KEY = a19.ROW_KEY)
union
select 'ldb."d_incident_category" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_category" a110
on (a13.CATEGORY_SRC_KEY = a110.ROW_KEY)
union
select 'ldb."d_incident_employee_location" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."d_incident_employee" a12
on (a11.incident_employee_key = a12.ROW_KEY) join "ldb"."d_incident_employee_mdm" a16
on (a12.employee_mdm_key = a16.ROW_KEY)
join "ldb"."d_incident_employee_location" a111
on (a16.LOCATION_KEY = a111.ROW_KEY)
union
select 'ldb."d_task_sla_resolution_flag" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_task_sla_resolution_flag" a112
on (a13.MET_RESOLUTION_SLA_FLAG_KEY = a112.ROW_KEY)
union
select 'ldb."d_task_sla_response_flag" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_task_sla_response_flag" a113
on (a13.MET_RESPONSE_SLA_FLAG_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_state" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_state" a114
on (a13.STATE_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_resolved" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_incident_subcategory" a115
on (a13.SUB_CATEGORY_SRC_KEY = a115.ROW_KEY)