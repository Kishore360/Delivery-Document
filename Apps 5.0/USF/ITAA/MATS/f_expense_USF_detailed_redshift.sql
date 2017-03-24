select 'ldb.f_expense_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.f_asset a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
union
select 'ldb.d_asset_class a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
join ldb.d_asset_class a14 
on (a13.asset_class_key = a14.row_key) 
union
select 'ldb.d_product_model a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
join ldb.d_product_model a15 
on (a13.product_model_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_internal_organization_department a17 
on (a11.department_key = a17.row_key) 
union
select 'ldb.d_lov_expense_category_view a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_category_view a18 
on (a11.expense_item_category_key = a18.row_key) 
union
select 'ldb.d_lov_expense_summary_type_view a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_summary_type_view a19 
on (a11.expense_summary_type_key = a19.row_key) 
union
select 'ldb.d_lov_expense_type_view a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_type_view a110 
on (a11.expense_type_key = a110.row_key) 
union
select 'ldb.d_location a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_location a111 
on (a11.location_key = a111.row_key) 
union
select 'ldb.d_model_category a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.f_asset a13 
on (a11.asset_key = a13.asset_key) 
join ldb.d_model_category a112 
on (a13.model_category_key = a112.row_key) 
