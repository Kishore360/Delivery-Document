

select 'ldb.f_configuration_item_aggregator_c' as Table_name, count(1) Row_Count
from ldb.f_configuration_item_aggregator_c a11 
union
select 'ldb.d_lov_cmdb_operational_status_c' as Table_name, count(1) Row_Count
from ldb.f_configuration_item_aggregator_c a11 
join ldb.d_lov_cmdb_operational_status_c a12 
on a12.row_key=a11.operational_status_src_c_key


