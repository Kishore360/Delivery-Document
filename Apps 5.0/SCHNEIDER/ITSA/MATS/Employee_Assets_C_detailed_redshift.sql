select 'ldb.f_asset_people_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
union
select 'ldb.d_asset a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_internal_contact_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a14 
on (a13.row_current_key = a14.row_current_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_configuration_item a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_lov_asset_person_role_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_lov_asset_person_role_c a16 
on (a11.asset_person_role_c_key = a16.row_key) 
union
select 'ldb.d_lov_asset_life_cycle_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_lov_asset_life_cycle_c a17 
on (a12.asset_status_key = a17.row_key) 
union
select 'ldb.d_internal_organization_department a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_organization_department a18 
on (a13.department_key = a18.row_key) 
union
select 'ldb.d_asset_master_asset_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_asset a12 
on (a11.asset_key = a12.row_key) 
join ldb.d_asset_master_asset_c a19 
on (a12.bmc_asset_c_key = a19.row_key) 
union
select 'ldb.d_employee_location a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) join ldb.d_internal_contact_mdm a14 
on (a13.row_current_key = a14.row_current_key) 
join ldb.d_employee_location a110 
on (a14.location_key = a110.row_key) 
union
select 'ldb.d_internal_contact_master_employee_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_asset_people_c a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_master_employee_c a111 
on (a13.bmc_row_key_c = a111.row_key) 
