select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_configuration_item_incident_service_offering_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_incident_service_offering_c       a12
on (a11.service_offering_c_key = a12.row_key)
union
select'ldb.d_parent_location_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a12
on (a11.location_key = a12.row_key)
join ldb.d_parent_location_c a13
on (a12.parent_location_c_key=a13.row_key)