select 'ldb.f_change_rel_cmdb_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_change_request a16 
on (a11.change_request_c_key = a16.row_key) 
union
select 'ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a17 
on (a11.configuration_item_c_key = a17.row_key) 
union
select 'ldb.d_calendar_fiscal_year a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.created_on_c_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a18 
on (a14.year_start_date_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
join ldb.d_calendar_month a19 
on (a12.month_start_date_key = a19.row_key) 
union
select 'ldb.d_internal_contact_configuration_item_cat_representative_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
join ldb.d_internal_contact_configuration_item_cat_representative_c a110 
on (a15.cat_representative_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_ci_director_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
join ldb.d_internal_contact_ci_director_c a111 
on (a15.director_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_ci_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
join ldb.d_internal_contact_ci_manager_c a112 
on (a15.manager_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact_ci_vp_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
join ldb.d_internal_contact_ci_vp_c a113 
on (a15.vp_c_key = a113.row_key) 
union
select 'ldb.d_internal_contact_level_5_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_c_key = a15.row_key) 
join ldb.d_internal_contact_level_5_c a114 
on (a15.cah_level_5_c_key = a114.row_key) 