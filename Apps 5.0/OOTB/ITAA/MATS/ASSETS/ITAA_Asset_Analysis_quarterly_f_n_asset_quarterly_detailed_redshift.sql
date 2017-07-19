select 'ldb.f_n_asset_quarterly' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_calendar_quarter a12
on (a11.n_key=a12.row_key)
union
select 'ldb.d_lov_asset_status_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_status_view a12
on (a11.asset_status_key=a12.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_internal_contact a12
on (a11.asset_assigned_to_key=a12.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_internal_contact a12
on (a11.asset_assigned_to_key=a12.row_key)
join ldb.d_internal_contact_mdm a13
on (a12.row_current_key=a13.row_current_key)
union
select 'ldb.d_lov_asset_substatus_view' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_lov_asset_substatus_view a12
on (a11.asset_substatus_key=a12.row_key)
union
select 'ldb.d_asset' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_n_asset_quarterly a11 
join ldb.d_asset a12
on (a11.asset_key=a12.row_key)
