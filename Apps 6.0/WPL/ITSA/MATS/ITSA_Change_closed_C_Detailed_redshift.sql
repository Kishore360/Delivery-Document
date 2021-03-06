select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_configuration_item_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a19
on (a12.mdm_key = a19.row_key)
union
select 'ldb.d_ci_autofill_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_ci_autofill_c a110
on (a11.ci_autofill_c_key = a110.row_key)
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_assigned_to a111
on (a11.assigned_to_key = a111.row_key)
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a112
on (a11.assignment_group_key = a112.row_key)
union
select 'ldb.d_change_request_approval a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_approval a113
on (a11.approval_state_src_key = a113.row_key)
union
select 'ldb.d_business_service_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service_c a114
on (a11.business_src_c_key = a114.row_key)
union
select 'ldb.d_internal_organization_business_approver_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_business_approver_c a115
on (a11.business_approver_c_key = a115.row_key)
union
select 'ldb.d_change_request_category a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a116
on (a11.category_src_key = a116.row_key)
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reported_type a117
on (a11.reported_type_src_key = a117.row_key)
union
select 'ldb.d_change_request_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_impact a118
on (a11.impact_src_key = a118.row_key)
union
select 'ldb.d_implementation_result_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_implementation_result_c a119
on (a11.implementation_result_src_c_key = a119.row_key)
union
select 'ldb.d_change_request_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a120
on (a11.priority_src_key = a120.row_key)
union
select 'ldb.d_change_request_reason a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reason a121
on (a11.reason_src_key = a121.row_key)
union
select 'ldb.d_change_request_review_status a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_review_status a122
on (a11.review_status_src_key = a122.row_key)
union
select 'ldb.d_change_request_risk a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a123
on (a11.risk_src_key = a123.row_key)
union
select 'ldb.d_change_request_scope a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a124
on (a11.scope_src_key = a124.row_key)
union
select 'ldb.d_change_request_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_state a125
on (a11.state_src_key = a125.row_key)
union
select 'ldb.d_change_request_type a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a126
on (a11.type_src_key = a126.row_key)
union
select 'ldb.d_change_request_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_urgency a127
on (a11.urgency_src_key = a127.row_key)
union
select 'ldb.d_internal_organization_department a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_department a128
on (a11.requested_by_department_key = a128.row_key)
union
select 'ldb.d_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_domain a129
on (a11.domain_key = a129.row_key)
union
select 'ldb.d_internal_contact_mdm a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_contact_mdm a130
on (a13.employee_mdm_key = a130.row_key)
union
select 'ldb.d_internal_organization_gis_approval_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_gis_approval_c a131
on (a11.gis_approval_group_c_key = a131.row_key)
union
select 'ldb.d_outage_type_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_outage_type_c a132
on (a11.outage_type_src_c_key = a132.row_key)
union
select 'ldb.d_service_business_service_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_service_business_service_c a133
on (a11.business_service_c_key = a133.row_key)
union
select 'ldb.d_source_of_change_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_source_of_change_c a134
on (a11.source_of_change_src_c_key = a134.row_key)
union
select 'ldb.d_internal_organization_vendor_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_vendor_c a135
on (a11.vendor_c_key = a135.row_key)
union
select 'ldb.d_location a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_location a136
on (a11.location_key = a136.row_key)
union
select 'ldb.d_business_service_criticality a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_criticality a137
on (a14.criticality_key = a137.row_key)
union
select 'ldb.d_business_service_used_for a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_business_service a14
on (a11.business_service_key = a14.row_key)
join ldb.d_business_service_used_for a138
on (a14.used_for_src_key = a138.row_key)
union
select 'ldb.d_calendar_week a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week a139
on (a16.week_start_date_key = a139.row_key)
union
select 'ldb.d_lov_change_request_approval_workflow_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_approval_workflow_c a140
on (a15.change_request_approval_workflow_c_key = a140.row_key)
union
select 'ldb.d_calendar_year a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a141
on (a18.year_start_date_key = a141.row_key)