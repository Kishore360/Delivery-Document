select 'ldb.f_n_asset_quarterly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
union
select 'ldb.d_asset_class a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_asset_class a12 
on (a11.asset_class_key = a12.row_key) 
union
select 'ldb.f_asset a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
union
select 'ldb.d_lov_asset_status_view a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_status_view a14 
on (a11.asset_status_key = a14.row_key) 
union
select 'ldb.d_asset a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_asset a15 
on (a11.asset_key = a15.row_key) 
union
select 'ldb.d_product_model a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_product_model a16 
on (a11.product_model_key = a16.row_key) 
union
select 'ldb.d_lov_model_asset_type_view_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_product_model a16 
on (a11.product_model_key = a16.row_key) 
join ldb.d_lov_model_asset_type_view_c a17 
on (a16.asset_type_c_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_location a19 
on (a11.location_key = a19.row_key) 
union
select 'ldb.d_storage_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_storage_location a110 
on (a11.storage_location_key = a110.row_key) 
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_calendar_quarter a111 
on (a11.n_key = a111.row_key) 
union
select 'ldb.d_lov_asset_funding_view_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_funding_view_c a112 
on (a11.asset_funding_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact_asset_owned_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
join ldb.d_internal_contact_asset_owned_by a113 
on (a13.asset_owned_by_key = a113.row_key) 
union
select 'ldb.d_lov_asset_rp_status_view_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_rp_status_view_c a114 
on (a11.asset_rp_status_c_key = a114.row_key) 
union
select 'ldb.d_lov_asset_substatus_view a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_substatus_view a115 
on (a11.asset_substatus_key = a115.row_key) 
union
select 'ldb.d_cost_center a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_cost_center a116 
on (a11.cost_center_key = a116.row_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_internal_organization_department a117 
on (a11.department_key = a117.row_key) 
union
select 'ldb.d_domain a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_domain a118 
on (a11.domain_key = a118.row_key) 
union
select 'ldb.d_model_category a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_model_category a119 
on (a11.model_category_key = a119.row_key) 
union
select 'ldb.d_supplier a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_supplier a120 
on (a11.supplier_key = a120.row_key) 
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_quarterly a11 
join ldb.d_storage_location a110 
on (a11.storage_location_key = a110.row_key) 
join ldb.d_location a121 
on (a110.location_key = a121.row_key) 
