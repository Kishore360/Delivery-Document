select'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_category       a122
on (a12.category_src_key=a122.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_close_code       a123
on (a12.close_code_src_key=a123.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_severity       a124
on (a12.severity_src_key=a124.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_state       a125
on (a12.state_src_key=a125.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_keyword       a11 
join ldb.d_incident_subcategory       a126
on (a12.sub_category_src_key=a126.row_key)
