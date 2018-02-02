select 'ldb.f_appl_hierarchies_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
union
select'ldb.d_application_appl_hierarchy_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
union
select'ldb.d_configuration_item_appl_hierarchy_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key = a13.row_key)
union
select'ldb.d_dh_appl_hierarchies_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_dh_appl_hierarchies_c       a14
on (a11.dh_appl_hierarchies_c_key = a14.row_key)
union
select'ldb.d_lov_cmdb_ci_agebucket_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_lov_cmdb_ci_agebucket_c       a15
on (a11.age_key = a15.row_key)
union
select'ldb.d_lov_cmdb_dr_enabled_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_lov_cmdb_dr_enabled_c       a16
on (a12.application_dr_enabled_c_key = a16.row_key)
union
select'ldb.d_internal_contact_app_development_manager_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_internal_contact_app_development_manager_c       a17
on (a12.application_development_manager_c_key = a17.row_key)
union
select'ldb.d_internal_contact_app_development_prime_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_internal_contact_app_development_prime_c       a18
on (a12.application_development_prime_c_key = a18.row_key)
union
select'ldb.d_lov_cmdb_sox_senstive_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_lov_cmdb_sox_senstive_c       a19
on (a12.application_sox_sensitive_c_key = a19.row_key)
union
select'ldb.d_lov_cmdb_ci_appl_status_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_lov_cmdb_ci_appl_status_c       a110
on (a12.status_src_c_key = a110.row_key)
union
select'ldb.d_lov_cmdb_ci_appl_substatus_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_lov_cmdb_ci_appl_substatus_c       a111
on (a12.substatus_src_c_key = a111.row_key)
union
select'ldb.d_internal_contact_app_support_director_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_internal_contact_app_support_director_c       a112
on (a12.application_support_director_c_key = a112.row_key)
union
select'ldb.d_internal_contact_app_support_manager_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a12
on (a11.application_key = a12.row_key)
join ldb.d_internal_contact_app_support_manager_c       a113
on (a12.application_support_manager_c_key = a113.row_key)
union
select'ldb.d_location_configuration_item_ci_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_location_configuration_item_ci_c       a114
on (a13.location_key = a114.row_key)
union
select'ldb.d_lov_configuration_ci_status_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_lov_configuration_ci_status_c       a115
on (a13.status_src_c_key = a115.row_key)
union
select'ldb.d_lov_configuration_ci_substatus_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_lov_configuration_ci_substatus_c       a116
on (a13.substatus_src_c_key = a116.row_key)


