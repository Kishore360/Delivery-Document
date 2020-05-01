select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_group a13
on (a11.assignment_group_key = a13.row_key)
union
select 'ldb.d_application a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact_assigned_to a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request_risk a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_risk a110
on (a11.risk_src_key = a110.row_key)
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
union
select 'ldb.d_internal_contact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
union
select 'ldb.d_standard_change_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_standard_change_c a114
on (a11.u_standard_change_c_key = a114.row_key)
union
select 'ldb.d_change_request_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_approval a115
on (a11.approval_state_src_key = a115.row_key)
union
select 'ldb.d_change_request_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_category a116
on (a11.category_src_key = a116.row_key)
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reported_type a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_change_request_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_impact a118
on (a11.impact_src_key = a118.row_key)
union
select 'ldb.d_change_request_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_priority a119
on (a11.priority_src_key = a119.row_key)
union
select 'ldb.d_change_request_reason a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_reason a120
on (a11.reason_src_key = a120.row_key)
union
select 'ldb.d_change_request_review_status a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_review_status a121
on (a11.review_status_src_key = a121.row_key)
union
select 'ldb.d_change_request_scope a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_scope a122
on (a11.scope_src_key = a122.row_key)
union
select 'ldb.d_change_request_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_state a123
on (a11.state_src_key = a123.row_key)
union
select 'ldb.d_change_request_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_type a124
on (a11.type_src_key = a124.row_key)
union
select 'ldb.d_change_request_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_urgency a125
on (a11.urgency_src_key = a125.row_key)
union
select 'ldb.d_domain a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_domain a126
on (a11.domain_key = a126.row_key)
union
select 'ldb.d_change_customer_name_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_customer_name_c a127
on (a11.u_change_customer_name_c_key = a127.row_key)
union
select 'ldb.d_change_bp_location_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_bp_location_c a128
on (a11.u_change_bp_location_c_key = a128.row_key)
union
select 'ldb.d_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_location a129
on (a11.location_key = a129.row_key)
union
select 'ldb.d_change_request_parent_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_parent_c a130
on (a11.change_request_parent_c_key = a130.row_key)
union
select 'ldb.d_change_request_opened_by_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request_opened_by_c a131
on (a11.change_request_opened_by_c_key = a131.row_key)
union
select 'ldb.d_application_mdm a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_application a14
on (a11.application_key = a14.row_key)
join ldb.d_application_mdm a132
on (a14.mdm_key = a132.row_key)
union
select 'ldb.d_business_service_criticality a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a133
on (a16.criticality_key = a133.row_key)
union
select 'ldb.d_business_service_used_for a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a134
on (a16.used_for_src_key = a134.row_key)
union
select 'ldb.d_crb_recommendation_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_crb_recommendation_c a135
on (a12.u_crb_recommendation_c_key = a135.row_key)
union
select 'ldb.d_calendar_week a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a136
on (a17.week_start_date_key = a136.row_key)
union
select 'ldb.d_internal_organization_department a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_organization_department a137
on (a11.requested_by_department_key = a137.row_key)
union
select 'ldb.d_deployment_business_hours_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_deployment_business_hours_c a138
on (a12.u_deployment_business_hours_c_key = a138.row_key)
union
select 'ldb.d_internal_contact_mdm a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_contact_mdm a139
on (a113.employee_mdm_key = a139.row_key)
union
select 'ldb.d_firewall_change_type_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_firewall_change_type_c a140
on (a12.u_firewall_change_type_c_key = a140.row_key)
union
select 'ldb.d_hypercare_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_hypercare_c a141
on (a12.u_hypercarre_c_key = a141.row_key)
union
select 'ldb.d_im_mainframe_impact_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_im_mainframe_impact_c a142
on (a12.u_im_mainframe_impact_c_key = a142.row_key)
union
select 'ldb.d_notify_csd_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_notify_csd_c a143
on (a12.u_notify_csd_c_key = a143.row_key)
union
select 'ldb.d_notify_ioc_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_notify_ioc_c a144
on (a12.u_notify_ioc_c_key = a144.row_key)
union
select 'ldb.d_reason_high_risk_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_reason_high_risk_c a145
on (a12.u_reason_high_risk_c_key = a145.row_key)
union
select 'ldb.d_schedule_approval_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_schedule_approval_c a146
on (a12.u_schedule_approval_c_key = a146.row_key)
union
select 'ldb.d_scheduler_required_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_scheduler_required_c a147
on (a12.u_scheduler_required_c_key = a147.row_key)
union
select 'ldb.d_schedule_template_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_schedule_template_c a148
on (a12.u_schedule_template_c_key = a148.row_key)
union
select 'ldb.d_services_impact_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
join ldb.d_services_impact_c a149
on (a12.u_services_impact_c_key = a149.row_key)
union
select 'ldb.d_standard_category_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_standard_change_c a114
on (a11.u_standard_change_c_key = a114.row_key)
join ldb.d_standard_category_c a150
on (a114.standard_category_c_key = a150.row_key)
union
select 'ldb.d_calendar_year a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a151
on (a19.year_start_date_key = a151.row_key)
union
select 'ldb.d_change_parent_assignment_group_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11
join ldb.d_change_parent_incident_c a12
on (a11.change_parent_incident_c_key = a12.row_key)
join ldb.d_change_parent_assignment_group_c a15
on (a12.assignment_group_c_key = a15.row_key)