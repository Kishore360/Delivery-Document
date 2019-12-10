select 'ldb.f_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
union
select 'ldb.d_change_failure a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_failure a12
on (a11.change_failure_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_configuration_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_configuration_item a14
on (a11.ci_key = a14.row_key)
union
select 'ldb.d_configuration_item_mdm a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_configuration_item a14
on (a11.ci_key = a14.row_key)
join ldb.d_configuration_item_mdm a15
on (a14.mdm_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a18
on (a13.month_start_date_key = a18.row_key)
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_internal_contact_assigned_to a19
on (a11.assigned_to_key = a19.row_key)
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_internal_organization_group a110
on (a11.assignment_group_key = a110.row_key)
union
select 'ldb.d_change_request_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request_state a111
on (a11.change_state_src_key = a111.row_key)
union
select 'ldb.d_service_prb_owner_group_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_service_prb_owner_group_c a112
on (a16.service_prb_owner_group_c_key = a112.row_key)
union
select 'ldb.d_change_request_close_code a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
join ldb.d_change_request_close_code a113
on (a17.close_code_src_key = a113.row_key)