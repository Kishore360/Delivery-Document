select 'ldb.f_asset a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset_class a13 
on (a11.asset_class_key = a13.row_key) 
union
select 'ldb.d_lov_asset_status_view a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_status_view a14 
on (a11.asset_status_key = a14.row_key) 
union
select 'ldb.d_product_model a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a15 
on (a11.product_model_key = a15.row_key) 
union
select 'ldb.d_lov_model_asset_type_view_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a15 
on (a11.product_model_key = a15.row_key) 
join ldb.d_lov_model_asset_type_view_c a16 
on (a15.asset_type_c_key = a16.row_key) 
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
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a110 
on (a11.asset_created_on_key = a110.row_key) 
union
select 'ldb.d_storage_location a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a111 
on (a11.storage_location_key = a111.row_key) 
union
select 'ldb.d_lov_asset_age_year_view a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_age_year_view a112 
on (a11.year_bucket_key = a112.row_key) 
union
select 'ldb.d_lov_asset_warranty_bucket_view a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_warranty_bucket_view a113 
on (a11.warranty_days_bucket = a113.row_key) 
union
select 'ldb.d_lov_asset_funding_view_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_funding_view_c a114 
on (a11.asset_funding_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_asset_owned_by a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact_asset_owned_by a115 
on (a11.asset_owned_by_key = a115.row_key) 
union
select 'ldb.d_lov_asset_rp_status_view_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_rp_status_view_c a116 
on (a11.asset_rp_status_c_key = a116.row_key) 
union
select 'ldb.d_lov_asset_substatus_view a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_substatus_view a117 
on (a11.asset_substatus_key = a117.row_key) 
union
select 'ldb.d_cost_center a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_cost_center a118 
on (a11.cost_center_key = a118.row_key) 
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_organization_department a119 
on (a11.department_key = a119.row_key) 
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_domain a120 
on (a11.domain_key = a120.row_key) 
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact a18 
on (a11.asset_assigned_to_key = a18.row_key) 
join ldb.d_internal_contact_mdm a121 
on (a18.row_current_key = a121.row_current_key) 
union
select 'ldb.d_model_category a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_model_category a122 
on (a11.model_category_key = a122.row_key) 
union
select 'ldb.d_supplier a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_supplier a123 
on (a11.supplier_key = a123.row_key) 
union
select 'ldb.d_calendar_month a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a110 
on (a11.asset_created_on_key = a110.row_key) 
join ldb.d_calendar_month a124 
on (a110.month_start_date_key = a124.row_key) 
union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_storage_location a111 
on (a11.storage_location_key = a111.row_key) 
join ldb.d_location a125 
on (a111.location_key = a125.row_key) 
union
select 'ldb.d_calendar_week a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a110 
on (a11.asset_created_on_key = a110.row_key) 
join ldb.d_calendar_week a126 
on (a110.week_start_date_key = a126.row_key) 
union
select 'ldb.d_calendar_quarter a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a110 
on (a11.asset_created_on_key = a110.row_key) 
join ldb.d_calendar_quarter a127 
on (a110.quarter_start_date_key = a127.row_key) 
