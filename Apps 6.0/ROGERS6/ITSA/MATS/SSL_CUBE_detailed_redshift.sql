select 'ldb.f_ssl_certificate_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 union
select 'ldb.d_ssl_certificate_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
	on (a11.ssl_certificate_c_key = a12.row_key)  
 union
select 'ldb.d_lov_fact_source_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_lov_fact_source_c a13 
	on (a11.fact_source_c_key = a13.row_key)  
 union
select 'ldb.d_ssl_certificate_category_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c	a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_ssl_certificate_category_c a14 
	on (a12.ssl_certificate_category_c_key = a14.row_key)  
 union
select 'ldb.d_internal_contact_ssl_certificate_director_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_internal_contact_ssl_certificate_director_c a15 
	on (a12.ssl_certificate_director_c_key = a15.row_key)  
 union
select 'ldb.d_internal_contact_ssl_certificate_manager_owner_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_internal_contact_ssl_certificate_manager_owner_c a16 
	on (a12.ssl_certificate_manager_owner_c_key = a16.row_key)  
 union
select 'ldb.d_ssl_certificate_u_status_c a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_ssl_certificate_u_status_c a17 
	on (a12.ssl_certificate_u_status_c_key = a17.row_key)  
 union
select 'ldb.d_ssl_certificate_sub_category_c a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_ssl_certificate_sub_category_c a18 
	on (a12.ssl_certificate_sub_category_c_key = a18.row_key)  
 union
select 'ldb.d_ssl_certificate_u_sub_status_c a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_ssl_certificate_c a11 
 join ldb.d_ssl_certificate_c a12 
 on (a11.ssl_certificate_c_key = a12.row_key) 
	join ldb.d_ssl_certificate_u_sub_status_c a19 
	on (a12.ssl_certificate_u_sub_status_c_key = a19.row_key)  

