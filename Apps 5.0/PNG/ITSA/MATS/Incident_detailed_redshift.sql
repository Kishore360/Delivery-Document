select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_incident       a11 
union
select'ldb.d_lov_incident_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_incident       a11 
join ldb.d_lov_incident_incident_type_c       a12
on (a11.incident_type_src_c_key = a12.row_key)
union
select'ldb.d_lov_incident_service_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_incident       a11 
join ldb.d_lov_incident_service_type_c       a12
on (a11.service_type_src_c_key = a12.row_key)

union
select'ldb.d_lov_incident_why_not_cwt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_incident       a11 
join ldb.d_lov_incident_why_not_cwt_c       a12
on (a11.why_now_cwt_src_c_key = a12.row_key)


union
select'ldb.d_internal_contact_incident_opened_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.d_incident       a11 
join ldb.d_internal_contact_incident_opened_for_c       a12
on (a11.opened_for_key = a12.row_key)


