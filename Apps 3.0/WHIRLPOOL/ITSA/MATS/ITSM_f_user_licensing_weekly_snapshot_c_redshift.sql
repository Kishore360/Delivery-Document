select 'ldb.f_user_licensing_weekly_snapshot_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
union
select 'ldb.d_calendar_week a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
join ldb.d_calendar_week a13 
on (a11.week_start_c_key = a13.row_key) 
union
select 'ldb.d_country_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
join ldb.d_country_c a14 
on (a11.country_c_key = a14.row_key) 
union
select 'ldb.d_region_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
join ldb.d_region_c a15 
on (a11.region_c_key = a15.row_key) 
union
select 'ldb.d_internal_organization_vendor_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
join ldb.d_internal_organization_vendor_c a16 
on (a11.vendor_c_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_user_licensing_weekly_snapshot_c a11 
join ldb.d_calendar_week a13 
on (a11.week_start_c_key = a13.row_key) 
join ldb.d_calendar_month a17 
on (a13.month_start_date_key = a17.row_key) 

