select 'ldb.f_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_configuration_item_ext_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
union
select 'ldb.d_ci_asset_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_ci_asset_c a14
on (a11.ci_asset_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_ci_cost_center_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_ci_cost_center_c a17
on (a11.ci_cost_center_c_key = a17.row_key)
union
select 'ldb.d_support_group_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_support_group_c a18
on (a11.support_group_c_key = a18.row_key)
union
select 'ldb.d_ci_computer_ics_firewall_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_ics_firewall_c a19
on (a13.pg_ics_firewall_c_key = a19.row_key)
union
select 'ldb.d_ci_pg_data_classification_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_pg_data_classification_c a110
on (a12.ci_pg_data_classification_c_key = a110.row_key)
union
select 'ldb.d_configitem_location_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configitem_location_c a111
on (a12.location_key = a111.row_key)
union
select 'ldb.d_ci_computer_cpu_manufacturer_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_cpu_manufacturer_c a112
on (a13.cpu_manufacturer_c_key = a112.row_key)
union
select 'ldb.d_configuration_item_criticality_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_criticality_c a113
on (a12.business_critical_c_key = a113.row_key)
union
select 'ldb.d_config_item_owned_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_config_item_owned_by_c a114
on (a12.owned_by_key = a114.row_key)
union
select 'ldb.d_ci_pg_evp_service_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_pg_evp_service_c a115
on (a12.ci_pg_evp_service_c_key = a115.row_key)
union
select 'ldb.d_ci_pg_evp_solution_provider_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_pg_evp_solution_provider_c a116
on (a12.ci_pg_evp_solution_provider_c_key = a116.row_key)
union
select 'ldb.d_ci_pg_environment_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_pg_environment_c a117
on (a12.ci_pg_environment_c_key = a117.row_key)
union
select 'ldb.d_ci_pg_fda_status_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_pg_fda_status_c a118
on (a12.ci_pg_fda_status_c_key = a118.row_key)
union
select 'ldb.d_ci_computer_iq_oq_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_iq_oq_c a119
on (a13.pg_iq_oq_c_key = a119.row_key)
union
select 'ldb.d_ci_computer_byod_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_byod_c a120
on (a13.pg_byod_c_key = a120.row_key)
union
select 'ldb.d_ci_hardware_pg_network_connected_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_hardware_pg_network_connected_c a121
on (a12.hardware_pg_network_connected_c_key = a121.row_key)
union
select 'ldb.d_ci_computer_os_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_os_c a122
on (a13.os_c_key = a122.row_key)
union
select 'ldb.d_ci_computer_os_vendor_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_os_vendor_c a123
on (a13.os_vendor_c_key = a123.row_key)
union
select 'ldb.d_ci_operational_status_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_ci_operational_status_c a124
on (a12.ci_operational_status_c_key = a124.row_key)
union
select 'ldb.d_ci_computer_data_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key) join ldb.d_configuration_item_ext_c a13
on (a12.configuration_item_ext_c_key = a13.row_key)
join ldb.d_ci_computer_data_type_c a125
on (a13.pg_data_type_c_key = a125.row_key)
union
select 'ldb.d_product_model_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_product_model_c a126
on (a12.product_model_c_key = a126.row_key)
union
select 'ldb.d_lov_cmdb_ci_discovery_source_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_discovery_source_c a127
on (a12.cmdb_ci_discovery_source_c_key = a127.row_key)
union
select 'ldb.d_lov_cmdb_ci_hardware_status_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_hardware_status_c a128
on (a12.cmdb_ci_hardware_status_c_key = a128.row_key)
union
select 'ldb.d_lov_cmdb_ci_install_status_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_install_status_c a129
on (a12.cmdb_ci_install_status_c_key = a129.row_key)


 

