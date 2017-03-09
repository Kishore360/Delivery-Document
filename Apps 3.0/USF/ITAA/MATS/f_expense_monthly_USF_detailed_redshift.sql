select 'ldb.f_n_asset_monthly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_asset_class a13 
on (a11.asset_class_key = a13.row_key) 
union
select 'ldb.d_product_model a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_product_model a14 
on (a11.product_model_key = a14.row_key) 
union
select 'ldb.f_expense_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.f_expense_item a15 
on (a11.asset_key = a15.asset_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_calendar_month a16 
on (a11.n_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_internal_organization_department a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_internal_organization_department a18 
on (a11.department_key = a18.row_key) 
union
select 'ldb.d_lov_expense_category_view a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.f_expense_item a15 
on (a11.asset_key = a15.asset_key) 
join ldb.d_lov_expense_category_view a19 
on (a15.expense_item_category_key = a19.row_key) 
union
select 'ldb.d_lov_expense_summary_type_view a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.f_expense_item a15 
on (a11.asset_key = a15.asset_key) 
join ldb.d_lov_expense_summary_type_view a110 
on (a15.expense_summary_type_key = a110.row_key) 
union
select 'ldb.d_lov_expense_type_view a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.f_expense_item a15 
on (a11.asset_key = a15.asset_key) 
join ldb.d_lov_expense_type_view a111 
on (a15.expense_type_key = a111.row_key) 
union
select 'ldb.d_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_location a112 
on (a11.location_key = a112.row_key) 
union
select 'ldb.d_model_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_monthly a11 
join ldb.d_model_category a113 
on (a11.model_category_key = a113.row_key) 
