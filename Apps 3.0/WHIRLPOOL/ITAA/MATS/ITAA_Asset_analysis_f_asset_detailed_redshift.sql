select 'ldb.f_asset a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset_class a12 
on (a11.asset_class_key = a12.row_key) 
union
select 'ldb.d_asset_region_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_region_c a13 
on (a12.lkp_region_c_key = a13.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_domain a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_domain a12 
on (a11.domain_key = a12.row_key)
union
select 'ldb.d_internal_organization_asset_support_group_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_internal_organization_asset_support_group_c a13 
on (a12.support_group_c_key = a13.row_key) 
union
select 'ldb.d_internal_organization_asset_support_vendor_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_internal_organization_asset_support_vendor_c a13 
on (a12.support_vendor_c_key = a13.row_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_organization_department a12 
on (a11.department_key = a12.row_key)
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key)
union
select 'ldb.d_storage_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a12 
on (a11.storage_location_key = a12.row_key) 
union
select 'ldb.d_storage_location_d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a12 
on (a11.storage_location_key = a12.row_key) 
join ldb.d_location a13 
on (a12.location_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_status_view a13 
on (a11.asset_status_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_substatus_view a13 
on (a11.asset_substatus_key = a13.row_key)
union
select 'ldb.d_model_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_model_category a12 
on (a11.model_category_key = a12.row_key) 
union
select 'ldb.d_product_model a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a12 
on (a11.product_model_key = a12.row_key)
union
select 'ldb.d_supplier a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_supplier a12 
on (a11.supplier_key = a12.row_key)

