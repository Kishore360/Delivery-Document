 select'f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed             a11 
union
 select'f_incident_resolved' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_resolved             a11 
 union