select 'ldb.f_configuration_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_location       a13
on (a11.location_c_key=a13.row_key)
union
select'ldb.d_location_parent_location_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_location       a13
on (a11.location_c_key=a13.row_key)
join ldb.d_location_parent_location_c       a14
on (a13.parent_location_c_key=a14.row_key)
union
select'ldb.d_internal_organization_manufacturer_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_manufacturer_c       a15
on (a11.manufacturer_c_key=a15.row_key)
union
select'ldb.d_product_model' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_product_model       a16
on (a11.model_id_c_key=a16.row_key)
union
select'ldb.d_service_business_function_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_service_business_function_c       a17
on (a11.business_function_c_key=a17.row_key)
union
select'ldb.d_internal_contact_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_contact_director_c       a18
on (a11.application_director_c_key=a18.row_key)
union
select'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_contact_manager_c       a19
on (a11.application_manager_c_key=a19.row_key)
union
select'ldb.d_internal_contact_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_contact_vp_c       a110
on (a11.application_vp_c_key=a110.row_key)
union
select'ldb.d_internal_organization_change_control_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_change_control_c       a111
on (a11.change_control_c_key=a111.row_key)
union
select'ldb.d_internal_contact_used_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_contact_used_by_c       a112
on (a11.used_by_c_key=a112.row_key)
union
select'ldb.d_internal_organization_support_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_support_group_c       a113
on (a11.support_group_c_key=a113.row_key)
union
select'ldb.d_internal_organization_used_by_department_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_used_by_department_c       a114
on (a11.used_by_department_c_key=a114.row_key)
union
select'ldb.d_internal_organization_used_by_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
join ldb.d_internal_organization_used_by_group_c       a115
on (a11.used_by_group_c_key=a115.row_key)
union
select'ldb.d_lov_configuration_item_priority_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_priority_c       a116
on (a12.priority_c_key=a116.row_key)
union
select'ldb.d_lov_configuration_item_wing_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_wing_c       a117
on (a12.wing_c_key=a117.row_key)
union
select'ldb.d_lov_configuration_item_device_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_device_type_c       a118
on (a12.device_type_c_key=a118.row_key)
union
select'ldb.d_lov_configuration_item_hardware_substatus_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_hardware_substatus_c       a119
on (a12.hardware_substatus_c_key=a119.row_key)
union
select'ldb.d_lov_configuration_item_usage_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_usage_status_c       a120
on (a12.usage_status_c_key=a120.row_key)
union
select'ldb.d_lov_configuration_item_vendor_supported_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_c       a11 
 join ldb.d_configuration_item       a12
on (a11.configuration_item_key=a12.row_key)
join ldb.d_lov_configuration_item_vendor_supported_c       a121
on (a12.vendor_supported_c_key=a121.row_key)

