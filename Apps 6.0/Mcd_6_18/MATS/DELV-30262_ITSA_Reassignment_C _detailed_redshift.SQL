Tables Accessed:
D_INCIDENT_ASSIGNMENT_GROUP_MANAGER
D_INCIDENT_BUSINESS_SERVICE
D_INTERNAL_CONTACT_FROM
D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C
D_INTERNAL_CONTACT_TO
D_INTERNAL_ORGANIZATION_GROUP_FROM
D_INTERNAL_ORGANIZATION_GROUP_TO
D_INTERNAL_ORGANIZATION_NEW_VENDOR_C
D_INTERNAL_ORGANIZATION_OLD_VENDOR_C
D_INTERNAL_ORGANIZATION_VENDOR_C
D_SCAFE_CORE_REALM_C
D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C
d_incident
d_incident_activity_calendar_month
d_incident_activity_date
d_incident_assignment_group
d_incident_priority
d_incident_state
f_incident_activity

select 'ldb."f_incident_activity" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
union
select 'ldb."d_incident_activity_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident_activity_date" a12 on (a11.incident_activity_date_key = a12.row_key)  
union
select 'ldb."d_incident_activity_calendar_month" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident_activity_date" a12 on (a11.incident_activity_date_key = a12.row_key) 
join "ldb"."d_incident_activity_calendar_month" a13 on (a12.month_start_date_key = a13.row_key) 
UNION 
select 'ldb."d_incident" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
UNION 
select 'ldb."d_incident_priority" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a13 ON a12.priority_src_key=a13.row_key
UNION 
select 'ldb."d_incident_state" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a13 ON a12.state_src_key=a13.row_key
UNION 
select 'ldb."d_incident_assignment_group" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.d_incident_assignment_group a13 ON a12.assignment_group_key=a13.row_key
UNION 
select 'ldb."D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.D_SERVICE_INCIDENT_NEVA_SUBCATEGORY_C a13 ON a12.INCIDENT_NEVA_SUBCATEGORY_C_KEY=a13.row_key
UNION 

select 'ldb."D_SCAFE_CORE_REALM_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.D_SCAFE_CORE_REALM_C a13 ON a12.SCAFE_CORE_REALM_C_KEY=a13.row_key

UNION 
select 'ldb."D_INTERNAL_ORGANIZATION_VENDOR_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.d_incident_assignment_group a13 ON a12.assignment_group_key=a13.row_key
join ldb.D_INTERNAL_ORGANIZATION_VENDOR_C c ON a13.VENDOR_C_KEY=c.row_key 
UNION 
select 'ldb."d_incident" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.D_INCIDENT_BUSINESS_SERVICE a13 ON a12.business_service_key=a13.row_key 
UNION 
select 'ldb."d_incident" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_activity" a11 
join "ldb"."d_incident" a12  on (a11.incident_key = a12.row_key)
join ldb.D_INCIDENT_BUSINESS_SERVICE a13 ON a12.business_service_key=a13.row_key 
join ldb.D_INTERNAL_CONTACT_SERVICE_OWNED_BY_C a14 ON a13.SERVICE_OWNED_BY_C_KEY=a14.row_key  



