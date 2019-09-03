select 'ldb.f_cmdb_relationship_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
union
select 'ldb.d_configuration_item_portfolio_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_configuration_item_portfolio_c a12 
on (a11.portfolio_c_key = a12.row_key)
union
select 'ldb.d_configuration_item_parent_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_configuration_item_parent_c a12 
on (a11.parent_configuration_item_c_key = a12.row_key)
union
select 'ldb.d_lov_cmdb_operational_status_parent_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_configuration_item_parent_c a12 
on (a11.parent_configuration_item_c_key = a12.row_key)
join ldb.d_lov_cmdb_operational_status_parent_c a13
on (a12.operational_status_src_c_key = a13.row_key)
union
select 'ldb.d_configuration_item_child_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_configuration_item_child_c a12 
on (a11.child_configuration_item_c_key = a12.row_key)
union
select 'ldb.d_lov_cmdb_operational_status_child_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_configuration_item_child_c a12 
on (a11.child_configuration_item_c_key = a12.row_key)
join ldb.d_lov_cmdb_operational_status_child_c a13
on (a12.operational_status_src_c_key = a13.row_key)
union
select 'ldb.d_cmdb_rel_type_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_relationship_c a11 
join ldb.d_cmdb_rel_type_c a12 
on (a11.cmdb_rel_type_c_key = a12.row_key)