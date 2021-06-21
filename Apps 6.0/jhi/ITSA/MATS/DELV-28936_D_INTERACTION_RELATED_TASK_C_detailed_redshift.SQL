select 'ldb."D_INTERACTION_RELATED_TASK_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_INTERACTION_RELATED_TASK_C" a11
union
select 'ldb."D_INTERACTION_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_INTERACTION_RELATED_TASK_C" a11
join "LDB"."D_INTERACTION_C" a12
on (a12.ROW_KEY = a11.INTERACTION_C_KEY)
union
select 'ldb."D_INTERACTION_TASK_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_INTERACTION_RELATED_TASK_C" a11
join "LDB"."D_INTERACTION_TASK_C" a13
on (a11.INTERACTION_TASK_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_LOV_INTERACTION_TASK_TYPE_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."D_INTERACTION_RELATED_TASK_C" a11
join "LDB"."D_INTERACTION_TASK_C" a13
on (a11.INTERACTION_TASK_C_KEY = a13.ROW_KEY)
join "LDB"."D_LOV_INTERACTION_TASK_TYPE_C" a14
on (a13.INTERACTION_TASK_TYPE_SRC_C_KEY = a14.ROW_KEY)
      
	  
	  


