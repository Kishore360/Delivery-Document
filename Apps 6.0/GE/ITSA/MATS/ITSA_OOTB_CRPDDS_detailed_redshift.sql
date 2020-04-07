select 'ldb.f_change_failure_opened a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_configuration_item a13
on (a11.ci_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_change_failure a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_failure a17
on (a11.change_failure_key = a17.row_key)
union
select 'ldb.d_configuration_item_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_configuration_item a13
on (a11.ci_key = a13.row_key)
join ldb.d_configuration_item_mdm a18
on (a13.mdm_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key)
join ldb.d_calendar_month a19
on (a15.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a19
on (a15.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_year a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_calendar_date a15
on (a11.date_key = a15.row_key) join ldb.d_calendar_month a19
on (a15.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a111
on (a110.year_start_date_key = a111.row_key)
union
select 'ldb.d_application_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a112
on (a12.mdm_key = a112.row_key)
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_internal_contact_assigned_to a113
on (a11.assigned_to_key = a113.row_key)
union
select 'ldb.d_change_request_approval a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request_approval a114
on (a11.change_approval_state_src_key = a114.row_key)
union
select 'ldb.d_change_request_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request_state a115
on (a11.change_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_type a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_change_request_type a116
on (a11.change_type_src_key = a116.row_key)
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_internal_organization_department a117
on (a11.requested_by_department_key = a117.row_key)
union
select 'ldb.d_assignment_group_leader a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_opened a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_leader a118
on (a14.assignment_group_leader_key = a118.row_key)