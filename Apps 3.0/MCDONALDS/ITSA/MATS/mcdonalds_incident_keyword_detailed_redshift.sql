


select'f_incident_keyword' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 union
  select'd_incident_category' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_category         a12
on a11.category_src_key = a12.row_key
union
  select'd_incident_close_code' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_close_code         a12
on a11.close_code_src_key = a12.row_key
union
  select'd_incident_severity' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_severity         a12
on a11.severity_src_key = a12.row_key
union
  select'd_incident_state' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_state         a12
on a11.state_src_key = a12.row_key
union
  select'd_incident_subcategory' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_subcategory         a12
on a11.sub_category_src_key = a12.row_key

