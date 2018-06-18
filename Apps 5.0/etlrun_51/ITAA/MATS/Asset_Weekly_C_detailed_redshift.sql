select 'ldb.f_n_asset_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_class a13 
on (a12.asset_class_key = a13.row_key) 
union
select 'ldb.d_lov_asset_status_view a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_lov_asset_status_view a14 
on (a11.asset_status_key = a14.row_key) 
union
select 'ldb.d_asset_product_model a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_product_model a15 
on (a12.product_model_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_location a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_location a17 
on (a11.location_key = a17.row_key) 
union
select 'ldb.d_storage_location a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_storage_location a18 
on (a11.storage_location_key = a18.row_key) 
union
select 'ldb.d_calendar_week a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_calendar_week a19 
on (a11.n_key = a19.row_key) 
union
select 'ldb.d_domain a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_domain a110 
on (a11.domain_key = a110.row_key) 
union
select 'ldb.d_lov_asset_substatus_view a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_lov_asset_substatus_view a111 
on (a11.asset_substatus_key = a111.row_key) 
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_internal_organization_department a112 
on (a11.department_key = a112.row_key) 
union
select 'ldb.d_product_model a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_product_model a113 
on (a11.product_model_key = a113.row_key) 
union
select 'ldb.d_model_category a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_model_category a114 
on (a11.model_category_key = a114.row_key) 
union
select 'ldb.d_lov_mobile_phone_provider_view_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
join ldb.d_lov_mobile_phone_provider_view_c a115 
on (a16.provider_c_key = a115.row_key) 
union
select 'ldb.d_supplier a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_supplier a116 
on (a11.supplier_key = a116.row_key) 
union
select 'ldb.d_location a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_storage_location a18 
on (a11.storage_location_key = a18.row_key) 
join ldb.d_location a117 
on (a18.location_key = a117.row_key) 
