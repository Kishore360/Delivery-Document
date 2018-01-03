select 'ldb.f_appl_hierarchies_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
union
select'ldb.d_dh_appl_hierarchies_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_dh_appl_hierarchies_c       a12
on (a11.dh_appl_hierarchies_c_key = a12.row_key)
union
select'ldb.d_application_appl_hierarchy_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_application_appl_hierarchy_c       a13
on (a11.application_key = a13.row_key)
union
select'ldb.d_configuration_item_appl_hierarchy_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
join ldb.d_configuration_item_appl_hierarchy_c       a14
on (a11.configuration_item_key = a14.row_key)
union
select'ldb.d_lov_cmdb_ci_appl_status_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_application_appl_hierarchy_c       a13
on (a11.application_key = a13.row_key)
join ldb.d_lov_cmdb_ci_appl_status_c       a15
on (a13.status_src_c_key = a15.row_key)
union
select'ldb.d_lov_cmdb_ci_appl_substatus_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11
 join ldb.d_application_appl_hierarchy_c       a13
on (a11.application_key = a13.row_key)
join ldb.d_lov_cmdb_ci_appl_substatus_c       a16
on (a13.substatus_src_c_key = a16.row_key)
union
select'ldb.d_location_configuration_item_ci_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_location_configuration_item_ci_c       a17
on (a14.location_key = a17.row_key)
union
select'ldb.d_lov_configuration_ci_status_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_lov_configuration_ci_status_c       a18
on (a14.status_src_c_key = a18.row_key)
union
select'ldb.d_lov_configuration_ci_substatus_c' as Table_Name, count(a11.dh_appl_hierarchies_c_key) Row_Count
 from  ldb.f_appl_hierarchies_c       a11 
 join ldb.d_configuration_item_appl_hierarchy_c       a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_lov_configuration_ci_substatus_c       a19
on (a14.substatus_src_c_key = a19.row_key)


