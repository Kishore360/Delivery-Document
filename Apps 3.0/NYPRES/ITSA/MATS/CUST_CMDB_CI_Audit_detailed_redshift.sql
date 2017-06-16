select 'ldb.f_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
union
select 'ldb.d_internal_contact_director_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_contact_director_c a12 on a11.application_director_c_key=a12.row_key
union
select 'ldb.d_internal_contact_manager_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_contact_manager_c a12 on a11.application_manager_c_key=a12.row_key
union
select 'ldb.d_internal_contact_vp_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_contact_vp_c a12 on a11.application_vp_c_key=a12.row_key
union
select 'ldb.d_internal_organization_change_control_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_organization_change_control_c a12 on a11.change_control_c_key=a12.row_key
union
select 'ldb.d_service_business_function_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_service_business_function_c a12 on a11.business_function_c_key=a12.row_key
union
select 'ldb.d_location a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_location a12 on a11.location_c_key=a12.row_key
union
select 'ldb.d_intrenal_organization_manufacturer_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_organization_manufacturer_c a12 on a11.manufacturer_c_key=a12.row_key
union
select 'ldb.d_internal_organization_support_group_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_organization_support_group_c a12 on a11.support_group_c_key=a12.row_key
union
select 'ldb.d_intrenal_organization_manufacturer_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_contact_used_by_c a12 on a11.used_by_c_key=a12.row_key
union
select 'ldb.d_internal_organization_used_by_department_c_key_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_organization_used_by_department_c a12 on a11.used_by_department_c_key=a12.row_key
union
select 'ldb.d_internal_organization_used_by_group_c_key_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_internal_organization_used_by_group_c a12 on a11.used_by_group_c_key=a12.row_key
union
select 'ldb.d_location_parent_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_c a11 
join ldb.d_location a12 on a11.location_c_key=a12.row_key
join ldb.d_location_parent_c a13 on a12.parent_location_c_key=a13.row_key



