select 'ldb.f_cmdb_ci_hierarchies_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
union
select 'ldb.d_configuration_item_hierarchy_c a12 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_configuration_item_hierarchy_c a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_dh_cmdb_ci_hierarchies_c a13 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_dh_cmdb_ci_hierarchies_c a13 
on (a11.dh_cmdb_ci_hierarchies_c_key = a13.row_key) 
union
select 'ldb.d_business_service_hierarchy_c a14 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_business_service_hierarchy_c a14 
on (a11.business_service_key = a14.row_key) 
union
select 'ldb.d_internal_contact_cmdb_ci_child_owned_by_c a15 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_configuration_item_hierarchy_c a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_internal_contact_cmdb_ci_child_owned_by_c a15 
on (a12.owned_by_key = a15.row_key) 
union
select 'ldb.d_configuration_item_child_region_lkp_c a16 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_configuration_item_hierarchy_c a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_configuration_item_child_region_lkp_c a16 
on (a12.region_c_key = a16.row_key) 
union
select 'ldb.d_internal_contact_cmdb_ci_parent_owned_by_c a17 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_business_service_hierarchy_c a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_internal_contact_cmdb_ci_parent_owned_by_c a17 
on (a14.owned_by_key = a17.row_key) 
union
select 'ldb.d_configuration_item_parent_region_lkp_c a18 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_business_service_hierarchy_c a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_configuration_item_parent_region_lkp_c a18 
on (a14.region_c_key = a18.row_key) 
union
select 'ldb.d_lov_cmdb_ci_web_server_type_c a19 ' as Table_name, count(1) Row_Count
from ldb.f_cmdb_ci_hierarchies_c a11 
join ldb.d_configuration_item_hierarchy_c a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_lov_cmdb_ci_web_server_type_c a19 
on (a12.type_src_c_key = a19.row_key) 
