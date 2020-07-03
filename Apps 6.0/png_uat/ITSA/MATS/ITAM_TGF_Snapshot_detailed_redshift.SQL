select 'ldb.f_n_configuration_item_monthly_tgf_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_configuration_item_monthly_tgf_c a11
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_configuration_item_monthly_tgf_c a11
join ldb.d_internal_organization_group a12
on (a11.assignment_group_key = a12.row_key)
union
select 'ldb.d_configitem_location_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_configuration_item_monthly_tgf_c a11
join ldb.d_configitem_location_c a13
on (a11.location_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_configuration_item_monthly_tgf_c a11
join ldb.d_calendar_month a14
on (a11.month_start_date_snapshot_key_c = a14.row_key)
union
select 'ldb.d_lov_cmdb_ci_discovery_source_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_configuration_item_monthly_tgf_c a11
join ldb.d_lov_cmdb_ci_discovery_source_c a15
on (a11.cmdb_ci_discovery_source_c_key = a15.row_key)


