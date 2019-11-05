select 'ldb.d_configuration_item_portfolio_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_portfolio_c a11 
union
select 'ldb.f_cmdb_relationship_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_portfolio_c a11 
join ldb.f_cmdb_relationship_c a14 
on (a11.row_key = a14.portfolio_c_key) 
union
select 'ldb.d_configuration_item_child_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_portfolio_c a11 
join ldb.f_cmdb_relationship_c a14 
on (a11.row_key = a14.portfolio_c_key) 
join ldb.d_configuration_item_child_c a15 
on (a14.child_configuration_item_c_key = a15.row_key) 
union
select 'ldb.d_configuration_item_parent_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_portfolio_c a11 
join ldb.f_cmdb_relationship_c a14 
on (a11.row_key = a14.portfolio_c_key) 
join ldb.d_configuration_item_parent_c a16 
on (a14.parent_configuration_item_c_key = a16.row_key) 
union
select 'ldb.d_cmdb_rel_type_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_portfolio_c a11 
join ldb.f_cmdb_relationship_c a14 
on (a11.row_key = a14.portfolio_c_key) 
join ldb.d_cmdb_rel_type_c a17 
on (a14.cmdb_rel_type_c_key = a17.row_key) 
