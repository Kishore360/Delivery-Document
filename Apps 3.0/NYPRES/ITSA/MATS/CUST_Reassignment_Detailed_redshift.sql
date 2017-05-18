select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.f_incident a12 on a12.incident_key=a11.incident_key
join ldb.d_location a13
on a12.location_key=a13.row_key
join ldb.d_location a14
on a13.parent_location_c_key=a14.row_key
