select 'ldb.f_change_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_internal_organization_group a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'ldb.d_assignment_group_manager a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
	join ldb.d_assignment_group_manager a13 
	on (a12.assignment_group_manager_key = a13.row_key)  
 union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a14 
	on (a11.change_request_key = a14.row_key)  
 union
select 'ldb.d_lov_change_failure_reason_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
	join ldb.d_lov_change_failure_reason_c a15 
	on (a14.change_failure_reason_c_key = a15.row_key)  
 union
select 'ldb.d_change_request_state a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request_state a16 
	on (a11.state_src_key = a16.row_key)  
 union
select 'ldb.d_change_request_close_code a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
	join ldb.d_change_request_close_code a17 
	on (a14.close_code_src_key = a17.row_key)  
 union
select 'ldb.d_internal_contact_change_req_requested_by_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
	join ldb.d_internal_contact_change_req_requested_by_c a18 
	on (a14.change_requested_by_c_key = a18.row_key)  
 union
select 'ldb.d_change_request_category_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_credit_score_detail a11 
 join ldb.d_change_request a14 
 on (a11.change_request_key = a14.row_key) 
	join ldb.d_change_request_category_c a19 
	on (a14.change_category_src_c_key = a19.row_key) 

