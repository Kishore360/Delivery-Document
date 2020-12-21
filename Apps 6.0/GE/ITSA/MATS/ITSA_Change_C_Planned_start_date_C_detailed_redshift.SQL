select 'ldb.f_change_request_planned_start_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
union
select 'ldb.d_change_employee a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_employee a13
on (a11.change_employee_key = a13.row_key)
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
union
select 'ldb.d_change_application a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_application a15
on (a14.application_key = a15.row_key)
union
select 'ldb.d_change_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_internal_contact_assigned_to a16
on (a14.assigned_to_key = a16.row_key)
union
select 'ldb.d_change_request_assignment_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_request_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
union
select 'ldb.d_h_change_assignment_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_request_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
join ldb.d_h_change_assignment_group a18
on (a17.group_hierarchy_key = a18.row_key)
union
select 'ldb.d_change_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_business_service a19
on (a14.business_service_key = a19.row_key)
union
select 'ldb.d_change_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_configuration_item a110
on (a14.configuration_item_key = a110.row_key)
union
select 'ldb.d_change_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_configuration_item a110
on (a14.configuration_item_key = a110.row_key)
join ldb.d_change_configuration_item_mdm a111
on (a110.mdm_key = a111.row_key)
union
select 'ldb.d_change_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a112
on (a11.change_date_key = a112.row_key)
union
select 'ldb.d_change_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a112
on (a11.change_date_key = a112.row_key)
join ldb.d_change_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
union
select 'ldb.d_change_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a112
on (a11.change_date_key = a112.row_key) join ldb.d_change_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
join ldb.d_change_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
union
select 'ldb.d_change_request_risk a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_risk a115
on (a11.risk_src_key = a115.row_key)
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
select 'ldb.d_change_employee_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_employee a13
on (a11.change_employee_key = a13.row_key)
join ldb.d_change_employee_mdm a118
on (a13.employee_mdm_key = a118.row_key)
union
select 'ldb.d_change_request_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_impact a119
on (a11.impact_src_key = a119.row_key)
union
select 'ldb.d_change_request_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_priority a120
on (a11.priority_src_key = a120.row_key)
union
select 'ldb.d_change_request_reason a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_reason a121
on (a11.reason_src_key = a121.row_key)
union
select 'ldb.d_change_request_review_status a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_review_status a122
on (a11.review_status_src_key = a122.row_key)
union
select 'ldb.d_change_request_scope a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_scope a123
on (a11.scope_src_key = a123.row_key)
union
select 'ldb.d_change_request_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_urgency a124
on (a11.urgency_src_key = a124.row_key)
union
select 'ldb.d_change_application_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_application a15
on (a14.application_key = a15.row_key)
join ldb.d_change_application_mdm a125
on (a15.mdm_key = a125.row_key)
union
select 'ldb.d_change_request_approval a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_approval a126
on (a11.approval_state_src_key = a126.row_key)
union
select 'ldb.d_change_calendar_week a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a112
on (a11.change_date_key = a112.row_key)
join ldb.d_change_calendar_week a127
on (a112.week_start_date_key = a127.row_key)
union
select 'ldb.d_change_department a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_department a128
on (a11.change_department_key = a128.row_key)
union
select 'ldb.d_change_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_domain a129
on (a14.domain_key = a129.row_key)
union
select 'ldb.d_change_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key)
join ldb.d_change_location a130
on (a14.location_key = a130.row_key)
union
select 'ldb.d_change_request_state a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_state a131
on (a11.state_src_key = a131.row_key)
union
select 'ldb.d_change_request_type a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request_type a132
on (a11.type_src_key = a132.row_key)
union
select 'ldb.d_change_assignment_group_level_1 a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_request_assignment_group a17
on (a14.assignment_group_key = a17.row_key) join ldb.d_h_change_assignment_group a18
on (a17.group_hierarchy_key = a18.row_key)
join ldb.d_change_assignment_group_level_1 a133
on (a18.group_level_1_key = a133.row_key)
union
select 'ldb.d_change_assignment_group_level_2 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_request_assignment_group a17
on (a14.assignment_group_key = a17.row_key) join ldb.d_h_change_assignment_group a18
on (a17.group_hierarchy_key = a18.row_key)
join ldb.d_change_assignment_group_level_2 a134
on (a18.group_level_2_key = a134.row_key)
union
select 'ldb.d_change_assignment_group_manager a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_request_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
join ldb.d_change_assignment_group_manager a135
on (a17.manager_key = a135.row_key)
union
select 'ldb.d_change_business_service_criticality a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_business_service a19
on (a14.business_service_key = a19.row_key)
join ldb.d_change_business_service_criticality a136
on (a19.criticality_key = a136.row_key)
union
select 'ldb.d_change_business_service_used_for a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_business_service a19
on (a14.business_service_key = a19.row_key)
join ldb.d_change_business_service_used_for a137
on (a19.used_for_src_key = a137.row_key)
union
select 'ldb.d_change_ci_company_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_request a14
on (a11.change_request_key = a14.row_key) join ldb.d_change_configuration_item a110
on (a14.configuration_item_key = a110.row_key)
join ldb.d_change_ci_company_c a138
on (a110.ci_company_c_key = a138.row_key)
union
select 'ldb.d_change_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_start_date a11
join ldb.d_change_date a112
on (a11.change_date_key = a112.row_key) join ldb.d_change_calendar_month a113
on (a112.month_start_date_key = a113.row_key) join ldb.d_change_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
join ldb.d_change_calendar_year a139
on (a114.year_start_date_key = a139.row_key)



