select 'ldb.f_brazil_validation_control_c_fact a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
union
select 'ldb.d_brazil_validation_control_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_brazil_validation_control_c a12
on (a11.brazil_validation_control_c_key = a12.row_key)
union
select 'ldb.d_brazil_inventory_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_brazil_inventory_c a13
on (a11.brazil_inventory_c_key = a13.row_key)
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
union
select 'ldb.d_brazil_privacy_compliance_control_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_brazil_privacy_compliance_control_c a15
on (a11.brazil_privacy_compliance_control_c_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key)
join ldb.d_calendar_month a16
on (a14.month_start_date_key = a16.row_key)
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a16
on (a14.month_start_date_key = a16.row_key)
join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
union
select 'ldb.d_lov_brazil_life_cycle_status_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_brazil_inventory_c a13
on (a11.brazil_inventory_c_key = a13.row_key)
join ldb.d_lov_brazil_life_cycle_status_c a18
on (a13.brazil_life_cycle_status_c_key = a18.row_key)
union
select 'ldb.d_internal_organization_brazil_owning_organization_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_internal_organization_brazil_owning_organization_c a19
on (a11.brazil_owning_organization_c_key = a19.row_key)
union
select 'ldb.d_lov_brazil_data_subject_rights_status_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_brazil_inventory_c a13
on (a11.brazil_inventory_c_key = a13.row_key)
join ldb.d_lov_brazil_data_subject_rights_status_c a110
on (a13.brazil_data_subject_rights_status_c_key = a110.row_key)
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_brazil_validation_control_c_fact a11
join ldb.d_calendar_date a14
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a16
on (a14.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17
on (a16.quarter_start_date_key = a17.row_key)
join ldb.d_calendar_year a111
on (a17.year_start_date_key = a111.row_key)