select 'ldb.f_asset_status_history' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset_status_history a11 
union
select 'ldb.d_lov_asset_status_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset_status_history a11 
join ldb.d_lov_asset_status_view a12
on (a11.asset_status_key=a12.row_key)
union
select 'ldb.d_lov_asset_substatus_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_asset_status_history a11 
join ldb.d_lov_asset_substatus_view a12
on (a11.asset_substatus_key=a12.row_key)