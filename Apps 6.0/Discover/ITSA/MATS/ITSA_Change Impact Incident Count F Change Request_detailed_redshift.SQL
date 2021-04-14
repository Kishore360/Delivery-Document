select 'ldb."f_change_request" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 UNION
 select 'ldb."d_application" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_request" a11 
 JOIN ldb.d_application a12 ON a11.application_key=a12.row_key 
 