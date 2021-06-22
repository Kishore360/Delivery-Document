select 'ldb.f_change_request_planned_start_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
union
select 'ldb.d_change_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_employee a12
on (a11.change_employee_key = a12.row_key)
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
union
select 'ldb.d_change_application a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_application a14
on (a13.application_key = a14.row_key)
union
select 'ldb.d_change_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_internal_contact_assigned_to a15
on (a13.assigned_to_key = a15.row_key)
union
select 'ldb.d_change_request_assignment_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_request_assignment_group a16
on (a13.assignment_group_key = a16.row_key)
union
select 'ldb.d_change_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_business_service a17
on (a13.business_service_key = a17.row_key)
union
select 'ldb.d_change_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a18
on (a11.change_date_key = a18.row_key)
union
select 'ldb.d_change_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a18
on (a11.change_date_key = a18.row_key)
join ldb.d_change_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_change_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a18
on (a11.change_date_key = a18.row_key) join ldb.d_change_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_change_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_change_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_configuration_item a111
on (a13.configuration_item_key = a111.row_key)
union
select 'ldb.d_change_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key) join ldb.d_change_configuration_item a111
on (a13.configuration_item_key = a111.row_key)
join ldb.d_change_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
union
select 'ldb.d_change_request_risk a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_risk a113
on (a11.risk_src_key = a113.row_key)
union
select 'ldb.d_change_request_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_state a114
on (a11.state_src_key = a114.row_key)
union
select 'ldb.d_change_request_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_approval a115
on (a11.approval_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_category a116
on (a11.category_src_key = a116.row_key)
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_reported_type a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_change_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_department a118
on (a11.change_department_key = a118.row_key)
union
select 'ldb.d_change_employee_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_employee a12
on (a11.change_employee_key = a12.row_key)
join ldb.d_change_employee_mdm a119
on (a12.employee_mdm_key = a119.row_key)
union
select 'ldb.d_change_request_impact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_impact a120
on (a11.impact_src_key = a120.row_key)
union
select 'ldb.d_change_request_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_priority a121
on (a11.priority_src_key = a121.row_key)
union
select 'ldb.d_change_request_reason a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_reason a122
on (a11.reason_src_key = a122.row_key)
union
select 'ldb.d_change_request_review_status a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_review_status a123
on (a11.review_status_src_key = a123.row_key)
union
select 'ldb.d_change_request_scope a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_scope a124
on (a11.scope_src_key = a124.row_key)
union
select 'ldb.d_change_request_type a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_type a125
on (a11.type_src_key = a125.row_key)
union
select 'ldb.d_change_request_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_change_application_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key) join ldb.d_change_application a14
on (a13.application_key = a14.row_key)
join ldb.d_change_application_mdm a127
on (a14.mdm_key = a127.row_key)
union
select 'ldb.d_change_calendar_week a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a18
on (a11.change_date_key = a18.row_key)
join ldb.d_change_calendar_week a128
on (a18.week_start_date_key = a128.row_key)
union
select 'ldb.d_change_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_domain a129
on (a13.domain_key = a129.row_key)
union
select 'ldb.d_change_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key)
join ldb.d_change_location a130
on (a13.location_key = a130.row_key)
union
select 'ldb.d_change_assignment_group_manager a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key) join ldb.d_change_request_assignment_group a16
on (a13.assignment_group_key = a16.row_key)
join ldb.d_change_assignment_group_manager a131
on (a16.manager_key = a131.row_key)
union
select 'ldb.d_change_business_service_criticality a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key) join ldb.d_change_business_service a17
on (a13.business_service_key = a17.row_key)
join ldb.d_change_business_service_criticality a132
on (a17.criticality_key = a132.row_key)
union
select 'ldb.d_change_business_service_used_for a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a13
on (a11.change_request_key = a13.row_key) join ldb.d_change_business_service a17
on (a13.business_service_key = a17.row_key)
join ldb.d_change_business_service_used_for a133
on (a17.used_for_src_key = a133.row_key)
union
select 'ldb.d_change_calendar_year a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a18
on (a11.change_date_key = a18.row_key) join ldb.d_change_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_change_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_change_calendar_year a134
on (a110.year_start_date_key = a134.row_key)