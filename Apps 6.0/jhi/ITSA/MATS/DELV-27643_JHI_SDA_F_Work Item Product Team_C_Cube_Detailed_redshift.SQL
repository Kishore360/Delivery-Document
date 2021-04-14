/* select count(a11.work_item_key)
from	"ldb"."F_WORK_ITEM"	a11
	join	"ldb"."D_WORK_ITEM"	a12
	  on 	(a11.WORK_ITEM_KEY = a12.ROW_KEY)
	join	"ldb"."D_PRODUCT_MANAGER_C"	a13
	  on 	(a12.PRODUCT_MANAGER_C_KEY = a13.ROW_KEY)
	join	"ldb"."D_SYSTEM_JIRA_PROJECT_C"	a14
	  on 	(a12.SYSTEM_JIRA_PROJECT_C_KEY = a14.ROW_KEY)
	join	"ldb"."D_WI_PRODT_TEAM_DOMAIN_C"	a15
	  on 	(a12.WI_PRODT_TEAM_DOMAIN_C_KEY = a15.ROW_KEY)
	join	"ldb"."D_WI_PRODT_TEAM_SUB_DOMAIN_C"	a16
	  on 	(a12.WI_PRODT_TEAM_SUB_DOMAIN_C_KEY = a16.ROW_KEY)
	join	"ldb"."d_work_item_type"	a17
	  on 	(a12.WORK_ITEM_TYPE_SRC_KEY = a17.ROW_KEY)
	join	"ldb"."D_WI_PRODT_TEAM_SDLC_CONF_PHASE_C"	a18
	  on 	(a12.WI_PRODT_TEAM_SDLC_CONF_PHASE_C_KEY = a18.ROW_KEY)
where	a17.SOURCE_DIMENSION_NAME = 'Product'; */


select 'ldb."F_WORK_ITEM" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 union
select 'ldb."D_WORK_ITEM" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
	on (a11.WORK_ITEM_KEY = a12.ROW_KEY)  
 union
select 'ldb."D_PRODUCT_MANAGER_C" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."D_PRODUCT_MANAGER_C" a13 
	on (a12.PRODUCT_MANAGER_C_KEY = a13.ROW_KEY)  
 union
select 'ldb."D_SYSTEM_JIRA_PROJECT_C" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."D_SYSTEM_JIRA_PROJECT_C" a14 
	on (a12.SYSTEM_JIRA_PROJECT_C_KEY = a14.ROW_KEY)  
 union
select 'ldb."D_WI_PRODT_TEAM_DOMAIN_C" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."D_WI_PRODT_TEAM_DOMAIN_C" a15 
	on (a12.WI_PRODT_TEAM_DOMAIN_C_KEY = a15.ROW_KEY)  
 union
select 'ldb."D_WI_PRODT_TEAM_SUB_DOMAIN_C" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."D_WI_PRODT_TEAM_SUB_DOMAIN_C" a16 
	on (a12.WI_PRODT_TEAM_SUB_DOMAIN_C_KEY = a16.ROW_KEY)  
 union
select 'ldb."d_work_item_type" a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."d_work_item_type" a17 
	on (a12.WORK_ITEM_TYPE_SRC_KEY = a17.ROW_KEY)  
 union
select 'ldb."D_WI_PRODT_TEAM_SDLC_CONF_PHASE_C" a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_WORK_ITEM" a11 
 join "ldb"."D_WORK_ITEM" a12 
 on (a11.WORK_ITEM_KEY = a12.ROW_KEY) 
	join "ldb"."D_WI_PRODT_TEAM_SDLC_CONF_PHASE_C" a18 
	on (a12.WI_PRODT_TEAM_SDLC_CONF_PHASE_C_KEY = a18.ROW_KEY) 

