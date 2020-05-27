select 'ldb.f_n_dq_change_monthly a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
union
select 'ldb.d_business_service a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_dq_rules_config a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_dq_rules_config a14
on (a11.dq_rules_configuration_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
union
select 'ldb.d_change_request_state a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_state a18
on (a11.change_state_src_key = a18.row_key)
union
select 'ldb.d_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a19
on (a13.mdm_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a110
on (a16.month_start_date_key = a110.row_key)
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_internal_contact_assigned_to a111
on (a11.assignee_key = a111.row_key)
union
select 'ldb.d_business_service_criticality a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_business_service a12
on (a11.business_service_key = a12.row_key)
join ldb.d_business_service_criticality a112
on (a12.criticality_key = a112.row_key)
union
select 'ldb.d_change_request_approval a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_approval a113
on (a11.approval_state_src_key = a113.row_key)
union
select 'ldb.d_change_request_impact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_impact a114
on (a11.impact_src_key = a114.row_key)
union
select 'ldb.d_change_request_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_priority a115
on (a11.priority_src_key = a115.row_key)
union
select 'ldb.d_change_request_reason a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_reason a116
on (a11.reason_src_key = a116.row_key)
union
select 'ldb.d_change_request_review_status a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_review_status a117
on (a11.review_status_src_key = a117.row_key)
union
select 'ldb.d_change_request_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_type a118
on (a11.type_src_key = a118.row_key)
union
select 'ldb.d_change_request_urgency a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_urgency a119
on (a11.urgency_src_key = a119.row_key)
union
select 'ldb.d_dq_rules a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_dq_rules_config a14
on (a11.dq_rules_configuration_key = a14.row_key)
join ldb.d_dq_rules a120
on (a14.rule_key = a120.row_key)
union
select 'ldb.d_internal_organization_department a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_internal_organization_department a121
on (a11.department_key = a121.row_key)
union
select 'ldb.d_location a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_location a122
on (a11.location_key = a122.row_key)
union
select 'ldb.d_assignment_group_leader a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_assignment_group_leader a123
on (a15.assignment_group_leader_key = a123.row_key)
union
select 'ldb.d_change_request_category a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_category a124
on (a11.category_src_key = a124.row_key)
union
select 'ldb.d_change_request_close_code a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request a17
on (a11.change_request_key = a17.row_key)
join ldb.d_change_request_close_code a125
on (a17.close_code_src_key = a125.row_key)
union
select 'ldb.d_change_request_risk a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_change_request_risk a126
on (a11.risk_src_key = a126.row_key)
union
select 'ldb.d_ci_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_n_dq_change_monthly a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_ci_location a127
on (a13.location_key = a127.row_key)