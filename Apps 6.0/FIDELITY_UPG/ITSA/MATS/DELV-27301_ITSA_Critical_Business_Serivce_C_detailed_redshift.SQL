select 'ldb."F_CMDB_REL_CI_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CMDB_REL_CI_C" a11
union
select 'ldb."D_CHILD_CI_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from	"ldb"."F_CMDB_REL_CI_C"	a11
join	"ldb"."D_CHILD_CI_C"	a12
 on 	(a11.CHILD_CI_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_PARENT_CI_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from	"ldb"."F_CMDB_REL_CI_C"	a11
join	"ldb"."D_CHILD_CI_C"	a13
 on 	(a11.PARENT_CI_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_RELATIONSHIP_TYPE_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from	"ldb"."F_CMDB_REL_CI_C"	a11
join	"ldb"."D_RELATIONSHIP_TYPE_C"	a14
 on 	(a11.RELATIONSHIP_TYPE_C_KEY = a14.ROW_KEY)


 