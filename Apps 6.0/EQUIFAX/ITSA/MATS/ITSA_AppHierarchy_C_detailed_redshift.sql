select 'ldb.f_appl_hierarchies_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key)  
union
select 'ldb.d_application a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
 join ldb.d_application a13 
 on (a11.application_key = a13.row_key)  
union
select 'ldb.d_configuration_item_location_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_configuration_item_location_c a14 
 on (a12.location_key = a14.row_key)  
union
select 'ldb.d_ci_model_id_c a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_model_id_c a15 
 on (a12.ci_model_id_c_key = a15.row_key)  
union
select 'ldb.d_ci_operational_status_c a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_appl_hierarchies_c a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
 join ldb.d_ci_operational_status_c a16 
 on (a12.ci_operational_status_c = a16.row_key)  

