select 'ldb.f_incident_keyword' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword       a11 
union
select'ldb.d_configuration_item_incident_service_offering_c' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_configuration_item_incident_service_offering_c       a12
on (a11.service_offering_c_key = a12.row_key)
union
select'ldb.d_business_service' as Table_Name, count(1) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_business_service       a12
on (a11.business_service_key = a12.row_key)