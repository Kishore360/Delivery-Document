select 'ldb.f_cmdb_ci_hierarchies_c a11 ' as Table_name, count(a11.configuration_item_key) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
union
select 'ldb.d_application_hierarchy_configuration_item_c a12 ' as Table_name, count(a11.configuration_item_key) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_application_hierarchy_configuration_item_c a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_configuration_item_hierarchy_application_c a13 ' as Table_name, count(a11.configuration_item_key) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_configuration_item_hierarchy_application_c a13 
on (a11.dh_cmdb_ci_hierarchies_c_key = a13.row_key)

