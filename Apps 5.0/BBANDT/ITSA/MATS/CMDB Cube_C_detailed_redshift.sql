select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
union
select 'ldb.d_lov_configuration_item_chassis_type_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_chassis_type_c a12
on (a117.chassis_type_src_c_key = a12.row_key)
union
select 'ldb.d_internal_organization_cpu_manufacturer_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_internal_organization_cpu_manufacturer_c a13
on (a117.cpu_manufacturer_c_key = a13.row_key)
union
select 'ldb.d_lov_configuration_item_dns_domain_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_dns_domain_c a19
on (a117.dns_domain_src_c_key = a19.row_key)
union
select 'ldb.d_lov_configuration_item_device_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_device_type_c a110
on (a117.device_type_src_c_key = a110.row_key)
union
select 'ldb.d_lov_configuration_item_os_domain_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_os_domain_c a114
on (a117.os_domain_src_c_key = a114.row_key)
union
select 'ldb.d_lov_configuration_item_tier_rating_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_tier_rating_c a118
on (a117.tier_rating_c_key = a118.row_key)
union
select 'ldb.d_configuration_item_cost_center_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_configuration_item_cost_center_c a119
on (a117.cost_center_c_key = a119.row_key)
union
select 'ldb.d_lov_configuration_item_environment_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_environment_c a120
on (a117.environment_c_key = a120.row_key)
union
select 'ldb.d_lov_configuration_item_install_status_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_install_status_c a121
on (a117.install_status_c_key = a121.row_key)
union
select 'ldb.d_lov_configuration_item_role_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_role_c a122
on (a117.role_c_key = a122.row_key)
union
select 'ldb.d_location_configuration_item_location_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_location_configuration_item_location_c a123
on (a117.location_key = a123.row_key)
union
select 'ldb.d_lov_configuration_item_os_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_os_c a124
on (a117.os_src_c_key = a124.row_key)
union
select 'ldb.d_lov_configuration_item_operational_status_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117
join ldb.d_lov_configuration_item_operational_status_c a125
on (a117.operational_status_c_key = a125.row_key)
union
select 'ldb.d_internal_organization_support_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item a117fa
join ldb.d_internal_organization_support_group_c a126
on (a117.support_group_c_key = a126.row_key)