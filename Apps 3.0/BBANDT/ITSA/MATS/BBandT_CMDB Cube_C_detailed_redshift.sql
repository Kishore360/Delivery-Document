select 'ldb.d_configuration_item a116 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
union
select 'ldb.d_lov_configuration_item_chassis_type_c a12 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_lov_configuration_item_chassis_type_c a12 
on (a116.chassis_type_src_c_key = a12.row_key) 
union
select 'ldb.d_internal_organization_cpu_manufacturer_c a13 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_internal_organization_cpu_manufacturer_c a13 
on (a116.cpu_manufacturer_c_key = a13.row_key) 
union
select 'ldb.d_lov_configuration_item_dns_domain_c a18 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_lov_configuration_item_dns_domain_c a18 
on (a116.dns_domain_src_c_key = a18.row_key) 
union
select 'ldb.d_lov_configuration_item_device_type_c a19 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_lov_configuration_item_device_type_c a19 
on (a116.device_type_src_c_key = a19.row_key) 
union
select 'ldb.d_lov_configuration_item_os_domain_c a113 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_lov_configuration_item_os_domain_c a113 
on (a116.os_domain_src_c_key = a113.row_key) 
union
select 'ldb.d_server_c a117 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
union
select 'ldb.d_configuration_item_cost_center_c a118 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_configuration_item_cost_center_c a118 
on (a116.cost_center_c_key = a118.row_key) 
union
select 'ldb.d_configuration_item_role_c a119 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 

join ldb.d_configuration_item_role_c a119 
on (a116.role_c_key = a119.row_key) 
union
select 'ldb.d_lov_server_environment_c a120 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_lov_server_environment_c a120 
on (a117.environment_key = a120.row_key) 
union
select 'ldb.d_location_server_location_c a121 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_location_server_location_c a121 
on (a117.location_key = a121.row_key) 
union
select 'ldb.d_lov_server_os_c a122 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_lov_server_os_c a122 
on (a117.operating_system_key = a122.row_key) 
union
select 'ldb.d_lov_server_operational_status_c a123 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_lov_server_operational_status_c a123 
on (a117.operational_status_key = a123.row_key) 
union
select 'ldb.d_lov_server_install_status_c a124 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_lov_server_install_status_c a124 
on (a117.install_status_key = a124.row_key) 
union
select 'ldb.d_intl_org_server_support_group_c a125 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_intl_org_server_support_group_c a125 
on (a117.support_group_key = a125.row_key) 
union
select 'ldb.d_lov_server_tier_rating_c a126 ' as Table_name, count(1) Row_Count
from ldb.d_configuration_item a116 
join ldb.d_server_c a117 
on (a116.server_c_key = a117.row_key) 
join ldb.d_lov_server_tier_rating_c a126 
on (a117.tier_rating_key = a126.row_key) 
