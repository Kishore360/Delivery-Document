select 'ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
union
select 'ldb."D_LOV_INCIDENT_SNAPSHOT_AGE_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_LOV_INCIDENT_SNAPSHOT_AGE_C" a12
on (a11.INCIDENT_SNAPSHOT_AGE_C_KEY = a12.row_key)
union
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_SNAPSHOT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_SNAPSHOT" a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb."D_INCIDENT_SNAPSHOT_MONTH_START_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_INCIDENT_SNAPSHOT_MONTH_START_C" a14
on (a11.INCIDENT_SNAPSHOT_MONTH_START_C_KEY = a14.row_key)
union
select 'ldb."D_INCIDENT_BUSINESS_SERVICE_SNAPSHOT" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_INCIDENT_BUSINESS_SERVICE_SNAPSHOT" a15
on (a11.business_service_key = a15.row_key)
union
select 'ldb."D_INCIDENT_SNAPSHOT_GROUPED_VENDOR_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_INCIDENT_SNAPSHOT_GROUPED_VENDOR_C" a16
on (a11.INCIDENT_SNAPSHOT_GROUPED_VENDOR_C_KEY = a16.row_key)
union
select 'ldb."D_INCIDENT_SNAPSHOT_PRIORITY_C" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_INCIDENT_IO_SNAPSHOT_MONTHLY_C" a11
join "ldb"."D_INCIDENT_SNAPSHOT_PRIORITY_C" a17
on (a11.priority_src_key = a17.row_key)