select 'ldb.f_avail_psat_art_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_configitem_location_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_configitem_location_c a13 
on (a12.location_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_lov_install_status_website_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
join ldb.d_lov_install_status_website_c a15 
on (a11.cmdb_ci_install_status_c_key = a15.row_key) 
union
select 'ldb.d_website_vendor_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_avail_psat_art_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_website_vendor_c a16 
on (a12.website_vendor_key = a16.row_key) 