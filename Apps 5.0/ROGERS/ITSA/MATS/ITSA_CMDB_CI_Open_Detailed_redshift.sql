select 'ldb.f_configuration_item_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
union
select'ldb.d_application' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_application       a12
on (a11.application_key=a12.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
union
select'ldb.d_lov_cmdb_dr_enabled_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_lov_cmdb_dr_enabled_c       a14
on (a12.application_dr_enabled_c_key=a14.row_key)
union
select'ldb.d_internal_contact_app_development_manager_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_internal_contact_app_development_manager_c       a15
on (a12.application_development_manager_c_key=a15.row_key)
union
select'ldb.d_internal_contact_app_development_prime_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_internal_contact_app_development_prime_c       a16
on (a12.application_development_prime_c_key=a16.row_key)
union
select'ldb.d_lov_cmdb_sox_senstive_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_lov_cmdb_sox_senstive_c       a17
on (a12.application_sox_sensitive_c_key=a17.row_key)
union
select'ldb.d_internal_contact_app_support_director_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_internal_contact_app_support_director_c       a18
on (a12.application_support_director_c_key=a18.row_key)
union
select'ldb.d_internal_contact_app_support_manager_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_application       a12
on (a11.application_key=a12.row_key)
join ldb.d_internal_contact_app_support_manager_c       a19
on (a12.application_support_manager_c_key=a19.row_key)
union
select'ldb.d_lov_cmdb_ci_agebucket_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_lov_cmdb_ci_agebucket_c       a110
on (a11.age_key=a110.row_key)
union
select'ldb.d_location_configuration_item_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_location_configuration_item_c       a111
on (a13.location_key=a111.row_key)
union
select'ldb.d_lov_cmdb_status_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_lov_cmdb_status_c       a112
on (a13.status_src_c_key=a112.row_key)
union
select'ldb.d_lov_cmdb_substatus_c' as Table_Name, count(1) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_lov_cmdb_substatus_c       a113
on (a13.substatus_src_c_key=a113.row_key)



