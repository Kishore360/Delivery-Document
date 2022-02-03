select 'ldb.f_change_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a12 
	on (a11.change_request_key = a12.row_key)  
 union
select 'ldb.d_change_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) 
	join ldb.d_change_configuration_item a13 
	on (a12.configuration_item_key = a13.row_key)  
 union
select 'ldb.d_lov_change_failure_reason_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) 
	join ldb.d_lov_change_failure_reason_c a14 
	on (a12.change_failure_reason_c_key = a14.row_key)  
 union
select 'ldb.d_change_request_close_code a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) 
	join ldb.d_change_request_close_code a15 
	on (a12.close_code_src_key = a15.row_key)  
 union
select 'ldb.d_change_configuration_item_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) join ldb.d_change_configuration_item a13 
 on (a12.configuration_item_key = a13.row_key) 
	join ldb.d_change_configuration_item_mdm a16 
	on (a13.mdm_key = a16.row_key) 

