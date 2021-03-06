select 'ldb.f_ama_inventory_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_ama_inventory_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
union
select 'ldb.d_ama_inventory_ext_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_ama_inventory_ext_c a14
on (a13.ama_inventory_ext_c_key = a14.row_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
union
select 'ldb.d_internal_organization_ama_owning_organization_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_internal_organization_ama_owning_organization_c a17
on (a11.ama_owning_organization_c_key = a17.row_key)
union
select 'ldb.d_lov_ama_data_breach_response_status_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_data_breach_response_status_c a18
on (a13.ama_data_breach_response_status_c_key = a18.row_key)
union
select 'ldb.d_lov_ama_data_transfer_status_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_data_transfer_status_c a19
on (a13.data_localization_data_transfer_status_c_key = a19.row_key)
union
select 'ldb.d_lov_ama_data_retention_status_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_data_retention_status_c a110
on (a13.ama_data_retention_status_c_key = a110.row_key)
union
select 'ldb.d_lov_ama_data_subject_rights_status_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_data_subject_rights_status_c a111
on (a13.ama_data_subject_rights_status_c_key = a111.row_key)
union
select 'ldb.d_lov_ama_inventory_status_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_inventory_status_c a112
on (a13.ama_inventory_status_c_key = a112.row_key)
union
select 'ldb.d_lov_ama_lawfulness_basis_status_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_lawfulness_basis_status_c a113
on (a13.ama_lawfulness_basis_status_c_key = a113.row_key)
union
select 'ldb.d_lov_ama_life_cycle_status_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_life_cycle_status_c a114
on (a13.ama_life_cycle_status_c_key = a114.row_key)
union
select 'ldb.d_lov_ama_minimization_status_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_minimization_status_c a115
on (a13.ama_minimization_status_c_key = a115.row_key)
union
select 'ldb.d_lov_ama_notice_status_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_notice_status_c a116
on (a13.ama_notice_status_c_key = a116.row_key)
union
select 'ldb.d_lov_ama_reasonable_infosecstatus_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_reasonable_infosecstatus_c a117
on (a13.ama_reasonable_infosecstatus_c_key = a117.row_key)
union
select 'ldb.d_lov_ama_vendor_qualification_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_vendor_qualification_c a118
on (a13.vendor_qualification_c_key = a118.row_key)
union
select 'ldb.d_lov_ama_vendors_status_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_ama_inventory_c a13
on (a11.ama_inventory_c_key = a13.row_key)
join ldb.d_lov_ama_vendors_status_c a119
on (a13.ama_vendors_status_c_key = a119.row_key)
union
select 'ldb.d_calendar_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ama_inventory_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16
on (a15.quarter_start_date_key = a16.row_key)
join ldb.d_calendar_year a120
on (a16.year_start_date_key = a120.row_key)


