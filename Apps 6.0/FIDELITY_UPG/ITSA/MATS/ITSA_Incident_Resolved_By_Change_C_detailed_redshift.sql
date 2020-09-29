select 'ldb."F_INCIDENT_RESOLVED_BY_CHANGE_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_RESOLVED_BY_CHANGE_C" a11
union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_RESOLVED_BY_CHANGE_C" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_RESOLVED_BY_CHANGE_C" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
union
select 'ldb."d_lov_incident_environment_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_RESOLVED_BY_CHANGE_C" a11
join "ldb"."D_INCIDENT" a13
on (a11.INCIDENT_KEY = a13.ROW_KEY)
join "ldb"."d_lov_incident_environment_c" a14
on (a13.ENVIRONMENT_SRC_C_KEY = a14.ROW_KEY)