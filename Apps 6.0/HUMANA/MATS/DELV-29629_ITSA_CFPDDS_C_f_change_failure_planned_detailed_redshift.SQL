select 'ldb.f_change_failure_planned a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_configuration_item a13
on (a11.ci_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_assignment_group_manager a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
join ldb.d_assignment_group_manager a15
on (a14.assignment_group_manager_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
union
select 'ldb.d_change_failure a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_failure a18
on (a11.change_failure_key = a18.row_key)
union
select 'ldb.d_lov_change_failure_reason_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
join ldb.d_lov_change_failure_reason_c a19
on (a17.change_failure_reason_c_key = a19.row_key)
union
select 'ldb.d_internal_contact_change_requested_by_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_failure a18
on (a11.change_failure_key = a18.row_key)
join ldb.d_internal_contact_change_requested_by_c a110
on (a18.requested_by_c_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_configuration_item a13
on (a11.ci_key = a13.row_key)
join ldb.d_configuration_item_mdm a111
on (a13.mdm_key = a111.row_key)
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a112
on (a16.month_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a112
on (a16.month_start_date_key = a112.row_key)
join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
union
select 'ldb.d_calendar_year a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a112
on (a16.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
join ldb.d_calendar_year a114
on (a113.year_start_date_key = a114.row_key)
union
select 'ldb.d_application_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a115
on (a12.mdm_key = a115.row_key)
union
select 'ldb.d_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_internal_contact_assigned_to a116
on (a11.assigned_to_key = a116.row_key)
union
select 'ldb.d_change_request_approval a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request_approval a117
on (a11.change_approval_state_src_key = a117.row_key)
union
select 'ldb.d_change_request_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request_state a118
on (a11.change_state_src_key = a118.row_key)
union
select 'ldb.d_change_request_type a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request_type a119
on (a11.change_type_src_key = a119.row_key)
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_internal_organization_department a120
on (a11.requested_by_department_key = a120.row_key)
union
select 'ldb.d_change_request_close_code a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
join ldb.d_change_request_close_code a121
on (a17.close_code_src_key = a121.row_key)
union
select 'ldb.d_internal_contact_change_closed_by a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
join ldb.d_internal_contact_change_closed_by a122
on (a17.closed_by_key = a122.row_key)
union
select 'ldb.d_ci_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_planned a11
join ldb.d_configuration_item a13
on (a11.ci_key = a13.row_key)
join ldb.d_ci_location a123
on (a13.location_key = a123.row_key)