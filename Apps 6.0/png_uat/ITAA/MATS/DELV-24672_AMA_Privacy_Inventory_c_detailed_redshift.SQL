select 'ldb.f_ama_validation_control_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
union
select 'ldb.d_ama_validation_control_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_validation_control_c a12
on (a11.ama_validation_control_c_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_ama_inventory_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_inventory_c a14
on (a11.ama_inventory_c_key = a14.row_key)
union
select 'ldb.d_ama_inventory_ext_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_inventory_c a14
on (a11.ama_inventory_c_key = a14.row_key)
join ldb.d_ama_inventory_ext_c a15
on (a14.ama_inventory_ext_c_key = a15.row_key)
union
select 'ldb.d_ama_privacy_compliance_control_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_privacy_compliance_control_c a16
on (a11.ama_privacy_compliance_control_c_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a17
on (a13.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a17
on (a13.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_internal_organization_ama_owning_organization_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_internal_organization_ama_owning_organization_c a19
on (a11.ama_owning_organization_c_key = a19.row_key)
union
select 'ldb.d_lov_ama_age_class_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_inventory_c a14
on (a11.ama_inventory_c_key = a14.row_key) join ldb.d_ama_inventory_ext_c a15
on (a14.ama_inventory_ext_c_key = a15.row_key)
join ldb.d_lov_ama_age_class_c a110
on (a15.ama_age_class_c_key = a110.row_key)
union
select 'ldb.d_lov_ama_life_cycle_status_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_ama_inventory_c a14
on (a11.ama_inventory_c_key = a14.row_key)
join ldb.d_lov_ama_life_cycle_status_c a111
on (a14.ama_life_cycle_status_c_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_validation_control_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a17
on (a13.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a112
on (a18.year_start_date_key = a112.row_key)


