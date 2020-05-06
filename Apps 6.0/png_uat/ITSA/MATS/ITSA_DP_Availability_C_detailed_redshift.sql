select 'ldb.f_dgtl_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
UNION 
select 'ldb.d_dgtl_availability_report_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_dgtl_availability_report_c a12 ON a11.dgtl_availability_report_c_key=a12.row_key 
UNION 
select 'ldb.d_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_configuration_item a12 ON a11.configuration_item_key=a12.row_key 
UNION 
select 'ldb.d_calendar_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date a12 ON a11.date_key_c=a12.row_key 
UNION 
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key_c=a12.row_key 
UNION 
select 'ldb.d_calendar_fiscal_period a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key_c=a12.row_key 
JOIN ldb.d_calendar_fiscal_period a13 ON a12.period_start_date_key=a13.row_key 
UNION 
select 'ldb.d_location a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_configuration_item a12 ON a11.configuration_item_key=a12.row_key
JOIN ldb.d_location a13 ON a12.location_key=a13.row_key 
UNION 
select 'ldb.d_lov_install_status_website_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_lov_install_status_website_c a12 ON a11.cmdb_ci_install_status_c_key=a12.row_key 
UNION 
select 'ldb.d_calendar_month a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date a12 ON a11.date_key_c=a12.row_key 
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key
UNION 
select 'ldb.d_calendar_fiscal_week a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key_c=a12.row_key 
JOIN ldb.d_calendar_fiscal_week a14 ON a12.week_start_date_key=a14.row_key 
UNION 
select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key_c=a12.row_key 
JOIN ldb.d_calendar_fiscal_quarter a13 ON a12.quarter_start_date_key=a13.row_key

UNION 
select 'ldb.d_calendar_fiscal_year a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_dgtl_availability_c a11
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key_c=a12.row_key 
JOIN ldb.d_calendar_fiscal_quarter a13 ON a12.quarter_start_date_key=a13.row_key
JOIN ldb.d_calendar_fiscal_year a14 ON a12.year_start_date_key=a14.row_key 

