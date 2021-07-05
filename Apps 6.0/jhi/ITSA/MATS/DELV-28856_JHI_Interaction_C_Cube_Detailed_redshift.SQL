select 'ldb."F_INTERACTION_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
union
select 'ldb."D_INTERACTION_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_INTERACTION_SCOPE_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_SCOPE_C" a13
on (a12.APPLICATION_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_INTERACTION_OPENED_FOR_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_OPENED_FOR_C" a14
on (a12.OPENED_FOR_C_KEY = a14.ROW_KEY)
union
select 'ldb."D_INTERACTION_ASSIGNED_TO_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_ASSIGNED_TO_C" a15
on (a12.ASSIGNED_TO_C_KEY = a15.ROW_KEY)
union
select 'ldb."D_INTERACTION_ASSIGNMENT_GROUP_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_ASSIGNMENT_GROUP_C" a16
on (a12.ASSIGNMENT_GROUP_C_KEY = a16.ROW_KEY)
union
select 'ldb."D_INTERACTION_COMPANY_C" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_COMPANY_C" a17
on (a12.COMPANY_C_KEY = a17.ROW_KEY)
union
select 'ldb."D_INTERACTION_CREATED_BY_C" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_CREATED_BY_C" a18
on (a12.CREATED_BY_C_KEY = a18.ROW_KEY)
union
select 'ldb."D_INTERACTION_LOCATION_C" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_LOCATION_C" a19
on (a12.LOCATION_C_KEY = a19.ROW_KEY)
union
select 'ldb."D_LOV_INTERACTION_STATE_C" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_LOV_INTERACTION_STATE_C" a110
on (a12.STATE_C_KEY = a110.ROW_KEY)
union
select 'ldb."D_LOV_INTERACTION_TYPE_C" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_LOV_INTERACTION_TYPE_C" a111
on (a12.TYPE_C_KEY = a111.ROW_KEY)
union
select 'ldb."D_INTERACTION_UPDATED_BY_C" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_UPDATED_BY_C" a112
on (a12.UPDATED_BY_C_KEY = a112.ROW_KEY)
union
select 'ldb."D_INTERACTION_CLOSED_BY_C" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY)
join "ldb"."D_INTERACTION_CLOSED_BY_C" a113
on (a12.CLOSED_BY_C_KEY = a113.ROW_KEY)
union
select 'ldb."D_INTERACTION_OPENED_FOR_LOCATION_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INTERACTION_C" a11
join "ldb"."D_INTERACTION_C" a12
on (a11.INTERACTION_C_KEY = a12.ROW_KEY) join "ldb"."D_INTERACTION_OPENED_FOR_C" a14
on (a12.OPENED_FOR_C_KEY = a14.ROW_KEY)
join "ldb"."D_INTERACTION_OPENED_FOR_LOCATION_C" a114
on (a14.INTERACTION_OPENED_FOR_LOCATION_C_KEY = a114.ROW_KEY)