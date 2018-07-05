


select 'ldb.f_rel_incident_c' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_rel_incident_c a 
union
select 'ldb.d_incident' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_rel_incident_c a 
join ldb.d_incident b
on (a.maintenance_rel_incident_c_key =b.row_key)

