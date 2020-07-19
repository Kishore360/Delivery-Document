select 'ldb.d_configuration_item_mdm a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
union
select 'ldb.d_lov_configuration_item_chassis_type_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_chassis_type_c a12
on (a11.chassis_type_src_c_key = a12.row_key)
union
select 'ldb.d_lov_configuration_item_environment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_environment_c a13
on (a11.environment_c_key = a13.row_key)
union
select 'ldb.d_lov_configuration_item_install_status_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_install_status_c a14
on (a11.install_status_c_key = a14.row_key)
union
select 'ldb.d_lov_configuration_item_role_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_role_c a15
on (a11.role_c_key = a15.row_key)
union
select 'ldb.d_internal_organization_cpu_manufacturer_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_internal_organization_cpu_manufacturer_c a16
on (a11.cpu_manufacturer_c_key = a16.row_key)
union
select 'ldb.d_lov_configuration_item_tier_rating_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_tier_rating_c a17
on (a11.tier_rating_c_key = a17.row_key)
union
select 'ldb.d_configuration_item_cost_center_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_configuration_item_cost_center_c a18
on (a11.cost_center_c_key = a18.row_key)
union
select 'ldb.d_lov_configuration_item_dns_domain_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_dns_domain_c a19
on (a11.dns_domain_src_c_key = a19.row_key)
union
select 'ldb.d_lov_configuration_item_device_type_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_device_type_c a110
on (a11.device_type_src_c_key = a110.row_key)
union
select 'ldb.d_lov_configuration_item_os_domain_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_os_domain_c a111
on (a11.os_domain_src_c_key = a111.row_key)
union
select 'ldb.d_location_configuration_item_location_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_location_configuration_item_location_c a112
on (a11.location_key = a112.row_key)
union
select 'ldb.d_lov_configuration_item_os_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_os_c a113
on (a11.os_src_c_key = a113.row_key)
union
select 'ldb.d_lov_configuration_item_operational_status_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_lov_configuration_item_operational_status_c a114
on (a11.operational_status_c_key = a114.row_key)
union
select 'ldb.d_internal_organization_support_group_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_configuration_item_mdm a11
join ldb.d_internal_organization_support_group_c a115
on (a11.support_group_c_key = a115.row_key)