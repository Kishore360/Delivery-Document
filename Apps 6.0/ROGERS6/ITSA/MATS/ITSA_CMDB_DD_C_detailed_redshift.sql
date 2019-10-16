select 'ldb.f_configuration_item_cmdb_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
union
select 'ldb.d_application_event_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_application_event_c a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key= a14.row_key )
union
select 'ldb.d_internal_contact_director_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key= a14.row_key )
join ldb.d_internal_contact_director_c a15
on (a14.support_director_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_manager_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key= a14.row_key )
join ldb.d_internal_contact_manager_c a16
on (a14.managed_by_c_key = a16.row_key)
union
select 'ldb.d_internal_contact_vp_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a14
on (a11.configuration_item_key= a14.row_key )
join ldb.d_internal_contact_vp_c a17
on (a14.vp_c_key = a17.row_key)
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_calendar_date a19
on (a11.created_on_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_calendar_date a19
on (a11.created_on_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_calendar_date a19
on (a11.created_on_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_calendar_date a19
on (a11.created_on_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a112
on (a111.year_start_date_key = a112.row_key)
union
select 'ldb.d_internal_organization_configuration_item_support_group_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_internal_organization_configuration_item_support_group_c a113
on (a18.support_group_c_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_calendar_date a19
on (a11.created_on_key = a19.row_key)
join ldb.d_calendar_week a114
on (a19.week_start_date_key = a114.row_key)
union
select 'ldb.d_ci_managed_by a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_ci_managed_by a115
on (a18.managed_by_key = a115.row_key)
union
select 'ldb.d_ci_supported_by a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_configuration_item_cmdb_c a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
join ldb.d_ci_supported_by a116
on (a18.supported_by_key = a116.row_key)
