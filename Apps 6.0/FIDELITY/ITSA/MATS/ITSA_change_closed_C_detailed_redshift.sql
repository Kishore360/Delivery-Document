select 'ldb.f_change_request_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_application_mdm a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_assignment_group_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_assignment_group_c a110
on (a16.assignment_group_key = a110.row_key)
union
select 'ldb.d_change_configuration_item_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_configuration_item_c a111
on (a16.configuration_item_c_key = a111.row_key)
union
select 'ldb.d_change_request_risk a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_risk a112
on (a11.risk_src_key = a112.row_key)
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a113
on (a11.configuration_item_key = a113.row_key)
union
select 'ldb.d_configuration_item_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_configuration_item a113
on (a11.configuration_item_key = a113.row_key)
join ldb.d_configuration_item_mdm a114
on (a113.mdm_key = a114.row_key)
union
select 'ldb.d_internal_contact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a115
on (a11.employee_key = a115.row_key)
union
select 'ldb.d_fmr_product_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key)
join ldb.d_fmr_product_c a116
on (a13.fmr_product_c_key = a116.row_key)
union
select 'ldb.d_fmr_product_line_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a116
on (a13.fmr_product_c_key = a116.row_key)
join ldb.d_fmr_product_line_c a117
on (a116.fmr_product_line_c_key = a117.row_key)
union
select 'ldb.d_calendar_week a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a118
on (a17.week_start_date_key = a118.row_key)
union
select 'ldb.d_calendar_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a119
on (a19.year_start_date_key = a119.row_key)
union
select 'ldb.d_internal_contact_programmer_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_programmer_c a120
on (a11.programmer_c_key = a120.row_key)
union
select 'ldb.d_internal_contact_alt_programmer_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact_alt_programmer_c a121
on (a11.alt_programmer_c_key = a121.row_key)
union
select 'ldb.d_internal_organization_bu_oversight_group_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_bu_oversight_group_c a122
on (a11.bu_oversight_group_c_key = a122.row_key)
union
select 'ldb.d_change_request_approval a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_approval a123
on (a11.approval_state_src_key = a123.row_key)
union
select 'ldb.d_change_request_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_impact a124
on (a11.impact_src_key = a124.row_key)
union
select 'ldb.d_change_request_priority a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_priority a125
on (a11.priority_src_key = a125.row_key)
union
select 'ldb.d_change_request_reason a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_reason a126
on (a11.reason_src_key = a126.row_key)
union
select 'ldb.d_change_request_review_status a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_review_status a127
on (a11.review_status_src_key = a127.row_key)
union
select 'ldb.d_change_request_scope a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_scope a128
on (a11.scope_src_key = a128.row_key)
union
select 'ldb.d_change_request_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_state a129
on (a11.state_src_key = a129.row_key)
union
select 'ldb.d_change_request_type a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_type a130
on (a11.type_src_key = a130.row_key)
union
select 'ldb.d_change_request_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_urgency a131
on (a11.urgency_src_key = a131.row_key)
union
select 'ldb.d_internal_organization_creating_group_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_creating_group_c a132
on (a11.creating_group_c_key = a132.row_key)
union
select 'ldb.d_domain a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_domain a133
on (a11.domain_key = a133.row_key)
union
select 'ldb.d_incident a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_incident a134
on (a11.incident_key = a134.row_key)
union
select 'ldb.d_location a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_location a135
on (a11.location_key = a135.row_key)
union
select 'ldb.d_problem a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_problem a136
on (a11.problem_key = a136.row_key)
union
select 'ldb.d_internal_organization_requesting_group_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_organization_requesting_group_c a137
on (a11.requesting_group_c_key = a137.row_key)
union
select 'ldb.d_change_request_template_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_template_c a138
on (a11.template_c_key = a138.row_key)
union
select 'ldb.d_change_request_category a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request_category a139
on (a11.category_src_key = a139.row_key)
union
select 'ldb.d_change_request_close_code a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_change_request_close_code a140
on (a16.close_code_src_key = a140.row_key)
union
select 'ldb.d_lov_change_request_impact_capacity_plan_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_impact_capacity_plan_c a141
on (a16.change_request_impact_capacity_plan_c_key = a141.row_key)
union
select 'ldb.d_lov_change_request_template_type_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_template_type_c a142
on (a16.change_request_template_type_c_key = a142.row_key)
union
select 'ldb.d_lov_change_request_tier_4_restricted_access_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_tier_4_restricted_access_c a143
on (a16.change_request_tier_4_restricted_access_c_key = a143.row_key)
union
select 'ldb.d_lov_change_trigger_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_trigger_c a144
on (a16.change_trigger_src_c_key = a144.row_key)
union
select 'ldb.d_lov_change_request_conflict_status_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_conflict_status_c a145
on (a16.conflict_status_src_c_key = a145.row_key)
union
select 'ldb.d_internal_contact_mdm a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_internal_contact a115
on (a11.employee_key = a115.row_key)
join ldb.d_internal_contact_mdm a146
on (a115.employee_mdm_key = a146.row_key)
union
select 'ldb.d_lov_change_environment_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_environment_c a147
on (a16.change_environment_src_c_key = a147.row_key)
union
select 'ldb.d_lov_change_environment_details_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_environment_details_c a148
on (a16.environment_details_src_c_key = a148.row_key)
union
select 'ldb.d_lov_change_request_fsc_service_required_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_fsc_service_required_c a149
on (a16.fsc_services_required_src_c_key = a149.row_key)
union
select 'ldb.d_lov_change_impact_continuity_plan_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_impact_continuity_plan_c a150
on (a16.impact_continuity_plan_src_c_key = a150.row_key)
union
select 'ldb.d_lov_change_request_impact_security_controls_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_impact_security_controls_c a151
on (a16.change_request_impact_security_controls_c_key = a151.row_key)
union
select 'ldb.d_lov_change_impact_availability_plan_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_impact_availability_plan_c a152
on (a16.impact_availability_plan_src_c_key = a152.row_key)
union
select 'ldb.d_lov_change_is_application_outage_required_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_is_application_outage_required_c a153
on (a16.is_application_outage_required_src_c_key = a153.row_key)
union
select 'ldb.d_lov_change_server_outage_c a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_server_outage_c a154
on (a16.server_outage_src_c_key = a154.row_key)
union
select 'ldb.d_lov_change_mf_online_inst_newcopy_met_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_mf_online_inst_newcopy_met_c a155
on (a16.mf_online_inst_newcopy_met_src_c_key = a155.row_key)
union
select 'ldb.d_lov_change_outage_type_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_outage_type_c a156
on (a16.outage_type_src_c_key = a156.row_key)
union
select 'ldb.d_lov_change_reason_for_application_outage_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_reason_for_application_outage_c a157
on (a16.reason_for_application_outage_src_c_key = a157.row_key)
union
select 'ldb.d_lov_change_sub_category_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_sub_category_c a158
on (a16.sub_category_src_c_key = a158.row_key)
union
select 'ldb.d_lov_change_request_sysplex_c a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_change_request a16
on (a11.change_request_key = a16.row_key)
join ldb.d_lov_change_request_sysplex_c a159
on (a16.sysplex_src_c_key = a159.row_key)
union
select 'ldb.d_internal_contact_service_offering_manager_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a116
on (a13.fmr_product_c_key = a116.row_key)
join ldb.d_internal_contact_service_offering_manager_c a160
on (a116.service_offering_manager_c_key = a160.row_key)
union
select 'ldb.d_internal_contact_business_service_manager_c a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_closed a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_application_mdm a13
on (a12.mdm_key = a13.row_key) join ldb.d_fmr_product_c a116
on (a13.fmr_product_c_key = a116.row_key) join ldb.d_fmr_product_line_c a117
on (a116.fmr_product_line_c_key = a117.row_key)
join ldb.d_internal_contact_business_service_manager_c a161
on (a117.business_service_manager_c_key = a161.row_key)