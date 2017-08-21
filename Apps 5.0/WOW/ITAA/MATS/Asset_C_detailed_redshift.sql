select 'ldb.f_asset a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_assetasset_class a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_class a13 
on (a12.asset_class_key = a13.row_key) 
union
select 'ldb.d_lov_asset_status_view a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_status_view a14 
on (a11.asset_status_key = a14.row_key) 
union
select 'ldb.d_asset_product_model a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_product_model a15 
on (a12.product_model_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a16 
on (a11.asset_created_on_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact a18 
on (a11.asset_assigned_to_key = a18.row_key) 
union
select 'ldb.d_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_location a19 
on (a11.location_key = a19.row_key) 
union
select 'ldb.d_storage_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a110 
on (a11.storage_location_key = a110.row_key) 
union
select 'ldb.d_domain a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_domain a111 
on (a11.domain_key = a111.row_key) 
union
select 'ldb.d_lov_asset_acquisition_method_view a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_lov_asset_acquisition_method_view a112 
on (a12.acquisition_method_src_key = a112.row_key) 
union
select 'ldb.d_lov_asset_age_year_view a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_lov_asset_age_year_view a113 
on (a12.asset_age_year_bucket_key = a113.row_key) 
union
select 'ldb.d_asset_employee_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_employee_c a114 
on (a12.asset_assigned_to_key = a114.row_key) 
union
select 'ldb.d_lov_asset_substatus_view a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_substatus_view a115 
on (a11.asset_substatus_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a16 
on (a11.asset_created_on_key = a16.row_key) 
join ldb.d_calendar_month a116 
on (a16.month_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_week a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a16 
on (a11.asset_created_on_key = a16.row_key) 
join ldb.d_calendar_week a117 
on (a16.week_start_date_key = a117.row_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_organization_department a118 
on (a11.department_key = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact a18 
on (a11.asset_assigned_to_key = a18.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a18.row_current_key = a119.row_current_key) 
union
select 'ldb.d_product_model a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a120 
on (a11.product_model_key = a120.row_key) 
union
select 'ldb.d_model_category a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_model_category a121 
on (a11.model_category_key = a121.row_key) 
union
select 'ldb.d_lov_mobile_phone_provider_view_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_lov_mobile_phone_provider_view_c a122 
on (a17.provider_c_key = a122.row_key) 
union
select 'ldb.d_supplier a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_supplier a123 
on (a11.supplier_key = a123.row_key) 
union
select 'ldb.d_lov_asset_warranty_bucket_view a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_lov_asset_warranty_bucket_view a124 
on (a12.warranty_days_bucket_key = a124.row_key) 
union
select 'ldb.d_calendar_quarter a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a16 
on (a11.asset_created_on_key = a16.row_key) 
join ldb.d_calendar_quarter a125 
on (a16.quarter_start_date_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a110 
on (a11.storage_location_key = a110.row_key) 
join ldb.d_location a126 
on (a110.location_key = a126.row_key) 
