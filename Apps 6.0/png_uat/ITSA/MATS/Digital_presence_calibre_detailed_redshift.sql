select 'ldb.f_dgtl_calibre_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
union
select 'ldb.d_dgtl_calibre_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_dgtl_calibre_c a12
on (a11.dgtl_calibre_report_c_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date_fiscal a14
on (a11.fiscal_date_key_c = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date a15
on (a11.date_key_c = a15.row_key)
union
select 'ldb.d_calendar_fiscal_period a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date_fiscal a14
on (a11.fiscal_date_key_c = a14.row_key)
join ldb.d_calendar_fiscal_period a16
on (a14.period_start_date_key = a16.row_key)
union
select 'ldb.d_configitem_location_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configitem_location_c a17
on (a13.location_key = a17.row_key)
union
select 'ldb.d_lov_install_status_website_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_lov_install_status_website_c a18
on (a11.website_install_status_c_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date a15
on (a11.date_key_c = a15.row_key)
join ldb.d_calendar_month a19
on (a15.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_fiscal_week a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date_fiscal a14
on (a11.fiscal_date_key_c = a14.row_key)
join ldb.d_calendar_fiscal_week a110
on (a14.week_start_date_key = a110.row_key)
union
select 'ldb.d_website_vendor_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_website_vendor_c a111
on (a13.website_vendor_key = a111.row_key)
union
select 'ldb.d_calendar_fiscal_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date_fiscal a14
on (a11.fiscal_date_key_c = a14.row_key)
join ldb.d_calendar_fiscal_quarter a112
on (a14.quarter_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_fiscal_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_calibre_c a11
join ldb.d_calendar_date_fiscal a14
on (a11.fiscal_date_key_c = a14.row_key)
join ldb.d_calendar_fiscal_year a113
on (a14.year_start_date_key = a113.row_key)