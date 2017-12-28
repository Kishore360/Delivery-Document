select 'ldb.f_cmdb_relationship_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
union
select'ldb.d_child_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
join ldb.d_child_configuration_item_c       a12
on (a11.child_configuration_item_c_key=a12.row_key)
union
select'ldb.d_parent_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
join ldb.d_parent_configuration_item_c       a13
on (a11.parent_configuration_item_c_key=a13.row_key)
union
select'ldb.d_configuration_item_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
join ldb.d_configuration_item_type_c       a14
on (a11.configuration_item_type_c_key=a14.row_key)
union
select'ldb.d_application_child_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_child_configuration_item_c       a12
on (a11.child_configuration_item_c_key=a12.row_key)
join ldb.d_application_child_c       a15
on (a12.application_c_key=a15.row_key)
union
select'ldb.d_location_configuration_item_child_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_child_configuration_item_c       a12
on (a11.child_configuration_item_c_key=a12.row_key)
join ldb.d_location_configuration_item_child_c       a16
on (a12.location_key=a16.row_key)
union
select'ldb.d_lov_cmdb_status_child_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_child_configuration_item_c       a12
on (a11.child_configuration_item_c_key=a12.row_key)
join ldb.d_lov_cmdb_status_child_c       a17
on (a12.status_src_c_key=a17.row_key)
union
select'ldb.d_lov_cmdb_substatus_child_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11
 join ldb.d_child_configuration_item_c       a12
on (a11.child_configuration_item_c_key=a12.row_key)
join ldb.d_lov_cmdb_substatus_child_c       a18
on (a12.substatus_src_c_key=a18.row_key)
union
select'ldb.d_application_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_parent_configuration_item_c       a13
on (a11.parent_configuration_item_c_key=a13.row_key)
join ldb.d_application_parent_c       a19
on (a13.application_c_key=a19.row_key)
union
select'ldb.d_location_configuration_item_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_parent_configuration_item_c       a13
on (a11.parent_configuration_item_c_key=a13.row_key)
join ldb.d_location_configuration_item_parent_c       a110
on (a13.location_key=a110.row_key)
union
select'ldb.d_lov_cmdb_status_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11 
 join ldb.d_parent_configuration_item_c       a13
on (a11.parent_configuration_item_c_key=a13.row_key)
join ldb.d_lov_cmdb_status_parent_c       a111
on (a13.status_src_c_key=a111.row_key)
union
select'ldb.d_lov_cmdb_substatus_parent_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_cmdb_relationship_c       a11
 join ldb.d_parent_configuration_item_c       a13
on (a11.parent_configuration_item_c_key=a13.row_key)
join ldb.d_lov_cmdb_substatus_parent_c       a112
on (a13.substatus_src_c_key=a112.row_key)


