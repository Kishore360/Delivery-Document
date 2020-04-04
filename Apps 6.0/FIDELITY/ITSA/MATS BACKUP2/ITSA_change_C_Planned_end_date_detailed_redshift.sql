select 'ldb.f_change_request_planned_end_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_change_request_risk a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_risk a19
on (a11.risk_src_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_configuration_item_mdm a111
on (a110.mdm_key = a111.row_key)
union
select 'ldb.d_internal_contact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_contact a112
on (a11.employee_key = a112.row_key)
union
select 'ldb.d_fmr_product_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_fmr_product_c a113
on (a12.fmr_product_c_key = a113.row_key)
union
select 'ldb.d_fmr_product_line_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a113
on (a12.fmr_product_c_key = a113.row_key)
join ldb.d_fmr_product_line_c a114
on (a113.fmr_product_line_c_key = a114.row_key)
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week a115
on (a16.week_start_date_key = a115.row_key)
union
select 'ldb.d_calendar_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a116
on (a18.year_start_date_key = a116.row_key)
union
select 'ldb.d_internal_contact_programmer_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_contact_programmer_c a117
on (a11.programmer_c_key = a117.row_key)
union
select 'ldb.d_internal_contact_alt_programmer_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_contact_alt_programmer_c a118
on (a11.alt_programmer_c_key = a118.row_key)
union
select 'ldb.d_internal_organization_bu_oversight_group_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_organization_bu_oversight_group_c a119
on (a11.bu_oversight_group_c_key = a119.row_key)
union
select 'ldb.d_change_request_approval a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_approval a120
on (a11.approval_state_src_key = a120.row_key)
union
select 'ldb.d_change_request_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_impact a121
on (a11.impact_src_key = a121.row_key)
union
select 'ldb.d_change_request_priority a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_priority a122
on (a11.priority_src_key = a122.row_key)
union
select 'ldb.d_change_request_reason a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_reason a123
on (a11.reason_src_key = a123.row_key)
union
select 'ldb.d_change_request_scope a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_scope a124
on (a11.scope_src_key = a124.row_key)
union
select 'ldb.d_change_request_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_state a125
on (a11.state_src_key = a125.row_key)
union
select 'ldb.d_change_request_type a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_type a126
on (a11.type_src_key = a126.row_key)
union
select 'ldb.d_change_request_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_urgency a127
on (a11.urgency_src_key = a127.row_key)
union
select 'ldb.d_internal_organization_creating_group_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_organization_creating_group_c a128
on (a11.creating_group_c_key = a128.row_key)
union
select 'ldb.d_domain a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_domain a129
on (a11.domain_key = a129.row_key)
union
select 'ldb.d_incident a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_incident a130
on (a11.incident_key = a130.row_key)
union
select 'ldb.d_location a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_location a131
on (a11.location_key = a131.row_key)
union
select 'ldb.d_problem a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_problem a132
on (a11.problem_key = a132.row_key)
union
select 'ldb.d_internal_organization_requesting_group_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_organization_requesting_group_c a133
on (a11.requesting_group_c_key = a133.row_key)
union
select 'ldb.d_change_request_template_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_template_c a134
on (a11.template_c_key = a134.row_key)
union
select 'ldb.d_application_mdm a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a135
on (a12.mdm_key = a135.row_key)
union
select 'ldb.d_change_request_category a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request_category a136
on (a11.category_src_key = a136.row_key)
union
select 'ldb.d_change_request_close_code a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_change_request_close_code a137
on (a15.close_code_src_key = a137.row_key)
union
select 'ldb.d_lov_change_request_impact_capacity_plan_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_impact_capacity_plan_c a138
on (a15.change_request_impact_capacity_plan_c_key = a138.row_key)
union
select 'ldb.d_lov_change_request_template_type_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_template_type_c a139
on (a15.change_request_template_type_c_key = a139.row_key)
union
select 'ldb.d_lov_change_request_tier_4_restricted_access_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_tier_4_restricted_access_c a140
on (a15.change_request_tier_4_restricted_access_c_key = a140.row_key)
union
select 'ldb.d_lov_change_trigger_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_trigger_c a141
on (a15.change_trigger_src_c_key = a141.row_key)
union
select 'ldb.d_lov_change_request_conflict_status_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_conflict_status_c a142
on (a15.conflict_status_src_c_key = a142.row_key)
union
select 'ldb.d_internal_contact_mdm a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_internal_contact a112
on (a11.employee_key = a112.row_key)
join ldb.d_internal_contact_mdm a143
on (a112.employee_mdm_key = a143.row_key)
union
select 'ldb.d_lov_change_environment_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_environment_c a144
on (a15.change_environment_src_c_key = a144.row_key)
union
select 'ldb.d_lov_change_environment_details_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_environment_details_c a145
on (a15.environment_details_src_c_key = a145.row_key)
union
select 'ldb.d_lov_change_request_fsc_service_required_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_fsc_service_required_c a146
on (a15.fsc_services_required_src_c_key = a146.row_key)
union
select 'ldb.d_lov_change_impact_continuity_plan_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_impact_continuity_plan_c a147
on (a15.impact_continuity_plan_src_c_key = a147.row_key)
union
select 'ldb.d_lov_change_request_impact_security_controls_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_impact_security_controls_c a148
on (a15.change_request_impact_security_controls_c_key = a148.row_key)
union
select 'ldb.d_lov_change_impact_availability_plan_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_impact_availability_plan_c a149
on (a15.impact_availability_plan_src_c_key = a149.row_key)
union
select 'ldb.d_lov_change_is_application_outage_required_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_is_application_outage_required_c a150
on (a15.is_application_outage_required_src_c_key = a150.row_key)
union
select 'ldb.d_lov_change_server_outage_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_server_outage_c a151
on (a15.server_outage_src_c_key = a151.row_key)
union
select 'ldb.d_lov_change_mf_online_inst_newcopy_met_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_mf_online_inst_newcopy_met_c a152
on (a15.mf_online_inst_newcopy_met_src_c_key = a152.row_key)
union
select 'ldb.d_lov_change_outage_type_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_outage_type_c a153
on (a15.outage_type_src_c_key = a153.row_key)
union
select 'ldb.d_lov_change_reason_for_application_outage_c a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_reason_for_application_outage_c a154
on (a15.reason_for_application_outage_src_c_key = a154.row_key)
union
select 'ldb.d_lov_change_sub_category_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_sub_category_c a155
on (a15.sub_category_src_c_key = a155.row_key)
union
select 'ldb.d_lov_change_request_sysplex_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_change_request a15
on (a11.change_request_key = a15.row_key)
join ldb.d_lov_change_request_sysplex_c a156
on (a15.sysplex_src_c_key = a156.row_key)
union
select 'ldb.d_internal_contact_service_offering_manager_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a113
on (a12.fmr_product_c_key = a113.row_key)
join ldb.d_internal_contact_service_offering_manager_c a157
on (a113.service_offering_manager_c_key = a157.row_key)
union
select 'ldb.d_internal_contact_business_service_manager_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11
join ldb.d_application a12
on (a11.application_key = a12.row_key) join ldb.d_fmr_product_c a113
on (a12.fmr_product_c_key = a113.row_key) join ldb.d_fmr_product_line_c a114
on (a113.fmr_product_line_c_key = a114.row_key)
join ldb.d_internal_contact_business_service_manager_c a158
on (a114.business_service_manager_c_key = a158.row_key)