select 'ldb.f_sweep_nodes_c' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_sweep_nodes_c a 
union
select 'ldb.d_incident' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_sweep_nodes_c a 
join ldb.d_incident b
on (a.maintenance_sweep_nodes_c_key =b.row_key)

