select 'ldb.f_appl_hierarchies_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
union
select'ldb.d_business_application_appl_hierarchy_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_business_application_appl_hierarchy_c       a12
on (a11.business_application_c_key=a12.row_key)
union
select'ldb.d_configuration_item_appl_hierarchy_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key=a13.row_key)
union
select'ldb.d_dh_appl_hierarchies_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_dh_appl_hierarchies_c       a14
on (a11.appl_hierarchies_c_key=a14.row_key)
union
select'ldb.d_lov_business_application_operational_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_business_application_appl_hierarchy_c       a12
on (a11.business_application_c_key=a12.row_key)
join ldb.d_lov_business_application_operational_status_c       a15
on (a12.operational_status_business_src_c_key=a15.row_key)
union
select'ldb.d_internal_contact_owned_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_business_application_appl_hierarchy_c       a12
on (a11.business_application_c_key=a12.row_key)
join ldb.d_internal_contact_owned_by_c       a16
on (a12.owned_by_c_key=a16.row_key)
union
select'ldb.d_internal_contact_supported_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_business_application_appl_hierarchy_c       a12
on (a11.business_application_c_key=a12.row_key)
join ldb.d_internal_contact_supported_by_c       a17
on (a12.supported_by_c_key=a17.row_key)
union
select'ldb.d_lov_business_application_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11
 join ldb.d_business_application_appl_hierarchy_c       a12
on (a11.business_application_c_key=a12.row_key)
join ldb.d_lov_business_application_type_c       a18
on (a12.type_src_key=a18.row_key)
union
select'ldb.d_location_configuration_item_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_location_configuration_item_ci_c       a19
on (a13.location_key=a19.row_key)
union
select'ldb.d_product_model_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_product_model_c       a110
on (a13.model_c_key=a110.row_key)
union
select'ldb.d_lov_configuration_item_operation_status_src_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_lov_configuration_item_operation_status_src_c       a111
on (a13.operational_status_src_c_key=a111.row_key)


