
-- union query for f_asset --
select 'ldb.f_asset a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
union
select 'ldb.d_asset_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_employee a13 
on (a12.asset_assigned_to_key = a13.row_key)
union
select 'ldb.d_lov_asset_acquisition_method_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_lov_asset_acquisition_method_view a13 
on (a12.acquisition_method_src_key = a13.row_key)
union
select 'ldb.d_asset_class a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_class a13 
on (a12.asset_class_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_status_view a12 
on (a11.asset_status_key = a12.row_key)
union
select 'ldb.d_asset_product_model a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_product_model a13 
on (a12.product_model_key = a13.row_key)
union
select 'ldb.d_product_model a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a12 
on (a11.product_model_key = a12.row_key)
union
select 'ldb.d_lov_model_asset_type_view_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_product_model a12 
on (a11.product_model_key = a12.row_key)
join ldb.d_lov_model_asset_type_view_c a13
on (a12.asset_type_c_key = a13.row_key)
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact a12 
on (a11.asset_assigned_to_key = a12.row_key)
union
select 'ldb.d_lov_asset_age_year_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_lov_asset_age_year_view a13 
on (a12.asset_age_year_bucket_key = a13.row_key)
union
select 'ldb.d_lov_asset_funding_view_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_funding_view_c a12 
on (a11.asset_funding_c_key = a12.row_key)
union
select 'ldb.d_internal_contact_asset_owned_by a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_contact_asset_owned_by a12 
on (a11.asset_owned_by_key = a12.row_key)
union
select 'ldb.d_lov_asset_rp_status_view_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_rp_status_view_c a12 
on (a11.asset_rp_status_c_key = a12.row_key)
union
select 'ldb.d_lov_asset_substatus_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_lov_asset_substatus_view a12 
on (a11.asset_substatus_key = a12.row_key)
union
select 'ldb.d_cost_center a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_cost_center a12 
on (a11.cost_center_key = a12.row_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_internal_organization_department a12 
on (a11.department_key = a12.row_key)
union
select 'ldb.d_domain a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_domain a12 
on (a11.domain_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11
join ldb.d_internal_contact a12 
on (a11.asset_assigned_to_key = a12.row_key)
join ldb.d_internal_contact_mdm a13
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_model_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_model_category a12 
on (a11.model_category_key = a12.row_key)
union
select 'ldb.d_supplier a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_supplier a12 
on (a11.supplier_key = a12.row_key)
union
select 'ldb.d_lov_asset_warranty_bucket_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_lov_asset_warranty_bucket_view a13
on (a12.warranty_days_bucket_key = a13.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)

union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
join ldb.d_calendar_week a13
on (a12.week_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
join ldb.d_calendar_quarter a13
on (a12.quarter_start_date_key = a13.row_key);

-- union query for f_asset_status_history --
select 'ldb.f_asset_status_history a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_status_history a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_status_history a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_status_history a11 
join ldb.d_calendar_date a12 
on (a11.asset_created_on_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_status_history a11 
join ldb.d_lov_asset_status_view a12 
on (a11.asset_status_key = a12.row_key)
union
select 'ldb.d_lov_asset_substatus_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_status_history a11 
join ldb.d_lov_asset_substatus_view a12 
on (a11.asset_substatus_key = a12.row_key)