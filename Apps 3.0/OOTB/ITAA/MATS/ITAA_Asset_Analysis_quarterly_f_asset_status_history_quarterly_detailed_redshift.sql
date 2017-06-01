select 'ldb.f_n_asset_status_history_quarterly' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_status_history_quarterly a11 
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_status_history_quarterly a11 
join ldb.d_calendar_quarter a12
on (a11.n_key=a12.row_key)
union
select 'ldb.d_lov_asset_status_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_status_history_quarterly a11 
join ldb.d_lov_asset_status_view a12
on (a11.asset_status_key=a12.row_key)
union
select 'ldb.d_lov_asset_substatus_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_status_history_quarterly a11 
join ldb.d_lov_asset_substatus_view a12
on (a11.asset_substatus_key=a12.row_key)