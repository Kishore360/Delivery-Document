select 'ldb.f_n_asset_weekly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_asset_class a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset_class a12 
on (a11.asset_class_key = a12.row_key)
union
select 'ldb.d_asset_region_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_region_c a13 
on (a12.lkp_region_c_key = a13.row_key) 
union
select 'ldb.d_calendar_week a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_calendar_week a12 
on (a11.n_key = a12.row_key)
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key)
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
select 'ldb.d_internal_organization_asset_support_group_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_internal_organization_asset_support_group_c a13 
on (a12.support_group_c_key = a13.row_key) 
union
select 'ldb.d_internal_organization_asset_support_vendor_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_internal_organization_asset_support_vendor_c a13 
on (a12.support_vendor_c_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11  
join ldb.d_lov_asset_status_view a13 
on (a11.asset_status_key = a13.row_key)
union
select 'ldb.d_lov_asset_status_view a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_asset_weekly a11 
join ldb.d_lov_asset_substatus_view a13 
on (a11.asset_substatus_key = a13.row_key)