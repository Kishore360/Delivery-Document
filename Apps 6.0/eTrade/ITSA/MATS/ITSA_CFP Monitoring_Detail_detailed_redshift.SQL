select 'ldb."d_change_success_model_monitor" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_change_success_model_monitor" a11 
 union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_change_success_model_monitor" a11 
 join "ldb"."D_CHANGE_REQUEST" a12 
	on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)  
 union
select 'ldb."d_change_request_state" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."d_change_success_model_monitor" a11 
 join "ldb"."d_change_request_state" a13 
	on (a11.change_state_src_key = a13.ROW_KEY) 

