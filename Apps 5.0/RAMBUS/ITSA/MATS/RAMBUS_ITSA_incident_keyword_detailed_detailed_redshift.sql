<<<<<<< HEAD
select 'ldb.f_incident_keyword_keyword a11 ' as Table_name, count(a11.table_row_key) Row_Count
from ldb.f_incident_keyword a11 
union
select 'ldb.d_lov_incident_category_c a13 ' as Table_name, count(a11.table_row_key) Row_Count
=======
select 'ldb.f_incident_keyword_keyword a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
union
select 'ldb.d_lov_incident_category_c a13 ' as Table_name, count(1) Row_Count
>>>>>>> 8ed622b7cab8cd9ce560f6f91438c90fff6d436b
from ldb.f_incident_keyword a11 
join ldb.d_lov_incident_category_c a13 
on (a11.category_src_key = a13.row_key) 
union
<<<<<<< HEAD
select 'ldb.d_incident_priority a13 ' as Table_name, count(a11.table_row_key) Row_Count
=======
select 'ldb.d_incident_priority a13 ' as Table_name, count(1) Row_Count
>>>>>>> 8ed622b7cab8cd9ce560f6f91438c90fff6d436b
from ldb.f_incident_keyword a11 
join ldb.d_incident_priority a13 
on (a11.priority_src_key = a13.row_key) 
union
<<<<<<< HEAD
select 'ldb.d_incident_severity a13 ' as Table_name, count(a11.table_row_key) Row_Count
=======
select 'ldb.d_incident_severity a13 ' as Table_name, count(1) Row_Count
>>>>>>> 8ed622b7cab8cd9ce560f6f91438c90fff6d436b
from ldb.f_incident_keyword a11 
join ldb.d_incident_severity a13 
on (a11.severity_src_key = a13.row_key) 
union
<<<<<<< HEAD
select 'ldb.d_lov_incident_state_c a13 ' as Table_name, count(a11.table_row_key) Row_Count
=======
select 'ldb.d_lov_incident_state_c a13 ' as Table_name, count(1) Row_Count
>>>>>>> 8ed622b7cab8cd9ce560f6f91438c90fff6d436b
from ldb.f_incident_keyword a11 
join ldb.d_lov_incident_state_c a13 
on (a11.state_src_key = a13.row_key) 
