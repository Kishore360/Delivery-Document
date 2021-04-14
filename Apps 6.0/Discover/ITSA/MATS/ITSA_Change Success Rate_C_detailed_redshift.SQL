/* Tables Accessed:
d_change_assignment_group_c
d_change_configuration_item_c
d_change_request
d_lov_change_state_c
d_lov_change_type_c
f_change_success_rate_detailed_c */


select 'ldb."f_change_success_rate_detailed_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 union
select 'ldb."d_change_request" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
	on (a11.change_request_key = a12.row_key)  
 union
select 'ldb."d_change_assignment_group_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
 on (a11.change_request_key = a12.row_key) 
	join "ldb"."d_change_assignment_group_c" a13 
	on (a12.change_assignment_group_c_key = a13.row_key)  
 union
select 'ldb."d_change_configuration_item_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
 on (a11.change_request_key = a12.row_key) 
	join "ldb"."d_change_configuration_item_c" a14 
	on (a12.change_configuration_item_c_key = a14.row_key)  
 union
select 'ldb."d_lov_change_state_c" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
 on (a11.change_request_key = a12.row_key) 
	join "ldb"."d_lov_change_state_c" a15 
	on (a12.change_state_c_key = a15.row_key)  
 union
select 'ldb."d_lov_change_type_c" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_success_rate_detailed_c" a11 
 join "ldb"."d_change_request" a12 
 on (a11.change_request_key = a12.row_key) 
	join "ldb"."d_lov_change_type_c" a16 
	on (a12.change_type_c_key = a16.row_key) 

