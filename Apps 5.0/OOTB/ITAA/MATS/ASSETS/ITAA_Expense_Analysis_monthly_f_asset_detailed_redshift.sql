select 'ldb.f_asset' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
union
select 'ldb.d_asset_class' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_asset_class a12
on (a11.asset_class_key=a12.row_key)
union
select 'ldb.d_product_model' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_product_model a12
on (a11.product_model_key=a12.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_configuration_item a12
on (a11.configuration_item_key=a12.row_key)
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_internal_organization_department a12
on (a11.department_key=a12.row_key)
union
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_location a12
on (a11.location_key=a12.row_key)
union
select 'ldb.d_model_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset a11 
join ldb.d_model_category a12
on (a11.model_category_key=a12.row_key)