select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_configuration_item_incident_service_offering_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item_incident_service_offering_c       a12
on (a11.service_offering_c_key = a12.row_key)