

 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
 select'd_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident         a12
on (a11.incident_key = a12.row_key)

 union
 select'd_incident_class_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_class_c         a12
on (a11.class_c_key  = a12.row_key)


 union
 select'd_incident_lob_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_lob_c         a12
on (a11.line_of_business_c_key  = a12.row_key)

 union
 select'd_incident_call_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_call_category_c        a12
on (a11.call_categroy_c_key   = a12.row_key)

 union
 select'd_incident_call_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident_call_category_c        a12
on (a11.call_categroy_c_key   = a12.row_key)