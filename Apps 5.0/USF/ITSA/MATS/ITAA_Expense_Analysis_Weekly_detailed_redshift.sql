select 'ldb.f_asset a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
union
select 'ldb.d_model_category a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset a11 
join ldb.d_model_category a12 
on (a11.model_category_key = a12.row_key)
---------------------------------------------------------------------------------
select 'ldb.f_expense_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
union
select 'ldb.d_asset_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_employee a13
on (a12.asset_assigned_to_key = a13.row_key)
union
select 'ldb.d_lov_expense_category_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_lov_expense_category_view a12 
on (a11.expense_item_category_key = a12.row_key)
union
select 'ldb.d_lov_expense_summary_type_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_lov_expense_summary_type_view a12 
on (a11.expense_summary_type_key = a12.row_key)
union
select 'ldb.d_lov_expense_type_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_lov_expense_type_view a12 
on (a11.expense_type_key = a12.row_key)
union
select 'ldb.d_asset_class a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_class a13
on (a12.asset_class_key = a13.row_key)
union
select 'ldb.d_asset_product_model a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_asset_product_model a13
on (a12.product_model_key = a13.row_key)
union
select 'ldb.d_lov_asset_acquisition_method_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key)
join ldb.d_lov_asset_acquisition_method_view a13
on (a12.acquisition_method_src_key = a13.row_key)

---------------------------------------------------------------------------------------------------------
select 'ldb.f_n_asset_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_calendar_weekly a12 
on (a11.n_key = a12.row_key)
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_internal_contact a12 
on (a11.asset_assigned_to_key = a12.row_key)
union
select 'ldb.d_internal_contact_mdm a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_internal_contact a12 
on (a11.asset_assigned_to_key = a12.row_key)
join ldb.d_internal_contact_mdm a13
on (a12.row_current_key = a13.row_current_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_internal_organization_department a12 
on (a11.department_key = a12.row_key)
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key)
