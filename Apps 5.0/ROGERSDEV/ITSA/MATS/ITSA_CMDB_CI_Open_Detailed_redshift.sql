select 'ldb.f_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
union
select'ldb.d_application' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_application       a12
on (a11.application_key=a12.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
union
select'ldb.d_lov_cmdb_ci_agebucket_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_lov_cmdb_ci_agebucket_c       a14
on (a11.age_key=a14.row_key)
union
select'ldb.d_location_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_location_configuration_item_c       a15
on (a13.location_key=a15.row_key)
union
select'ldb.d_lov_cmdb_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_lov_cmdb_status_c       a16
on (a13.status_src_c_key=a16.row_key)
union
select'ldb.d_lov_cmdb_substatus_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a13
on (a11.configuration_item_key=a13.row_key)
join ldb.d_lov_cmdb_substatus_c       a17
on (a13.substatus_src_c_key=a17.row_key)

