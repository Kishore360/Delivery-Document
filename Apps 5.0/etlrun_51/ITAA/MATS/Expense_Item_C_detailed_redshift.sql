select 'ldb.f_expense_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_class a13 
on (a12.asset_class_key = a13.row_key) 
union
select 'ldb.d_asset_product_model a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_product_model a14 
on (a12.product_model_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_calendar_date a15 
on (a11.expense_created_on_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_lov_expense_category_view a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_category_view a17 
on (a11.expense_item_category_key = a17.row_key) 
union
select 'ldb.d_lov_expense_summary_type_view a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_summary_type_view a18 
on (a11.expense_summary_type_key = a18.row_key) 
union
select 'ldb.d_lov_expense_type_view a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_lov_expense_type_view a19 
on (a11.expense_type_key = a19.row_key) 
union
select 'ldb.d_lov_asset_acquisition_method_view a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_lov_asset_acquisition_method_view a110 
on (a12.acquisition_method_src_key = a110.row_key) 
union
select 'ldb.d_asset_department a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_department a111 
on (a12.department_key = a111.row_key) 
union
select 'ldb.d_asset_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_location a112 
on (a12.location_key = a112.row_key) 
union
select 'ldb.d_asset_model_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_model_category a113 
on (a12.model_category_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_calendar_date a15 
on (a11.expense_created_on_key = a15.row_key) 
join ldb.d_calendar_month a114 
on (a15.month_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_calendar_date a15 
on (a11.expense_created_on_key = a15.row_key) 
join ldb.d_calendar_week a115 
on (a15.week_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_quarter a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_expense_item a11 
join ldb.d_calendar_date a15 
on (a11.expense_created_on_key = a15.row_key) 
join ldb.d_calendar_quarter a116 
on (a15.quarter_start_date_key = a116.row_key) 
