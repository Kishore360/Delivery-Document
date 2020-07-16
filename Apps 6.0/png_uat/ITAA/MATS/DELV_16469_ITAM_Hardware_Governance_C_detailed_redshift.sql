/* Tables Accessed:
d_calendar_date- done 
d_calendar_month - done 
d_configuration_item
d_internal_organization_group- done 
d_location- done 
d_lov_cmdb_ci_discovery_source_c
d_lov_cmdb_ci_hardware_status_c
d_lov_cmdb_ci_install_status_c
d_organization_manager_c
d_owned_by
d_owned_by_department
f_configuration_item
 */
 
select 'ldb.f_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_configitem_location_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configitem_location_c a13
on (a12.location_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_calendar_date a14
on (a11.date_key_c = a14.row_key)
union
select 'ldb.d_owned_by a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_owned_by a15
on (a11.owned_by_key = a15.row_key)
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
union
select 'ldb.d_organization_manager_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_internal_organization_group a16
on (a11.assignment_group_key = a16.row_key)
join ldb.d_organization_manager_c a17
on (a16.organization_manager_c_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_calendar_date a14
on (a11.date_key_c = a14.row_key)
join ldb.d_calendar_month a18
on (a14.month_start_date_key = a18.row_key)
union
select 'ldb.d_owned_by_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_owned_by a15
on (a11.owned_by_key = a15.row_key)
join ldb.d_owned_by_department a19
on (a15.owned_by_department = a19.row_key)
union
select 'ldb.d_product_model_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_product_model_c a110
on (a12.product_model_c_key = a110.row_key)
union
select 'ldb.d_lov_cmdb_ci_discovery_source_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_discovery_source_c a111
on (a12.cmdb_ci_discovery_source_c_key = a111.row_key)
union
select 'ldb.d_lov_cmdb_ci_hardware_status_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_hardware_status_c a112
on (a12.cmdb_ci_hardware_status_c_key = a112.row_key)
union
select 'ldb.d_lov_cmdb_ci_install_status_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_lov_cmdb_ci_install_status_c a113
on (a12.cmdb_ci_install_status_c_key = a113.row_key)
