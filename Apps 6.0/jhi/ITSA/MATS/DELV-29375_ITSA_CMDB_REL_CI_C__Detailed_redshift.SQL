select 'ldb."D_CMDB_CI_REL_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_CMDB_CI_REL_C" a11
union
select 'ldb."D_CMDB_CI_REL_TYPE_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_CMDB_CI_REL_C" a11
join "ldb"."D_CMDB_CI_REL_TYPE_C" a12
on (a11.RELATIONSHIP_TYPE_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_CHILD_CMDB_CI_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_CMDB_CI_REL_C" a11
join "ldb"."D_CHILD_CMDB_CI_C" a13
on (a11.CHILD_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_PARENT_CMDB_CI_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_CMDB_CI_REL_C" a11
join "ldb"."D_PARENT_CMDB_CI_C" a14
on (a11.PARENT_C_KEY = a14.ROW_KEY)
union
select 'ldb."D_CMDB_CI_REL_CONNECTION_STRENGTH_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_CMDB_CI_REL_C" a11
join "ldb"."D_CMDB_CI_REL_CONNECTION_STRENGTH_C" a15
on (a11.CONNECTION_STRENGTH_C_KEY = a15.ROW_KEY)