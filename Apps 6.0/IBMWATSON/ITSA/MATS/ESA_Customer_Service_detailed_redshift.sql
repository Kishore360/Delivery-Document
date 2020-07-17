select 'ldb.f_case a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
union
select 'ldb.d_case_employee a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_employee a12
on (a11.case_employee_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_internal_contact a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_segment_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
union
select 'ldb.d_case a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key)
join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
union
select 'ldb.d_case_business_service a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_business_service a111
on (a16.business_service_key = a111.row_key)
union
select 'ldb.d_case_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_date a112
on (a11.case_date_key = a112.row_key)
union
select 'ldb.d_case_time a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_time a113
on (a11.case_time_key = a113.row_key)
union
select 'ldb.d_case_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_date a112
on (a11.case_date_key = a112.row_key)
join ldb.d_case_calendar_month a114
on (a112.month_start_date_key = a114.row_key)
union
select 'ldb.d_case_calendar_quarter a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_date a112
on (a11.case_date_key = a112.row_key) join ldb.d_case_calendar_month a114
on (a112.month_start_date_key = a114.row_key)
join ldb.d_case_calendar_quarter a115
on (a114.quarter_start_date_key = a115.row_key)
union
select 'ldb.d_case_configuration_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_configuration_item a116
on (a16.configuration_item_key = a116.row_key)
union
select 'ldb.d_case_configuration_item_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key) join ldb.d_case_configuration_item a116
on (a16.configuration_item_key = a116.row_key)
join ldb.d_case_configuration_item_mdm a117
on (a116.mdm_key = a117.row_key)
union
select 'ldb.d_case_customer a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_customer a118
on (a16.customer_account_key = a118.row_key)
union
select 'ldb.d_case_assigned_to_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_assigned_to_c a119
on (a16.assigned_to_c_key = a119.row_key)
union
select 'ldb.d_configuration_item_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a120
on (a13.mdm_key = a120.row_key)
union
select 'ldb.d_customer a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_customer a121
on (a11.customer_account_key = a121.row_key)
union
select 'ldb.d_calendar_time a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_time a122
on (a11.time_key = a122.row_key)
union
select 'ldb.d_asset a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_asset a123
on (a11.asset_key = a123.row_key)
union
select 'ldb.d_internal_organization_group a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_internal_organization_group a124
on (a11.assignment_group_key = a124.row_key)
union
select 'ldb.d_case_3rd_party_status_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_3rd_party_status_c a125
on (a11.third_party_status_src_c_key = a125.row_key)
union
select 'ldb.d_case_employee_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_employee a12
on (a11.case_employee_key = a12.row_key)
join ldb.d_case_employee_mdm a126
on (a12.employee_mdm_key = a126.row_key)
union
select 'ldb.d_case_partner a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_partner a127
on (a11.partner_key = a127.row_key)
union
select 'ldb.d_internal_organization_legalentity a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_internal_organization_legalentity a128
on (a11.company_key = a128.row_key)
union
select 'ldb.d_service_contract a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_service_contract a129
on (a11.service_contract_key = a129.row_key)
union
select 'ldb.d_internal_contact_mdm a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_internal_contact a14
on (a11.assigned_to_key = a14.row_key)
join ldb.d_internal_contact_mdm a130
on (a14.employee_mdm_key = a130.row_key)
union
select 'ldb.d_service_entitlement a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_service_entitlement a131
on (a11.service_entitlement_key = a131.row_key)
union
select 'ldb.d_location a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_location a132
on (a11.location_key = a132.row_key)
union
select 'ldb.d_product_model a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_product_model a133
on (a11.product_model_key = a133.row_key)
union
select 'ldb.d_lov_segment_type_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_segment_c a15
on (a11.segment_c_key = a15.row_key)
join ldb.d_lov_segment_type_c a134
on (a15.segment_type_c_key = a134.row_key)
union
select 'ldb.d_business_service_criticality a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality a135
on (a17.criticality_key = a135.row_key)
union
select 'ldb.d_business_service_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_business_service a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for a136
on (a17.used_for_src_key = a136.row_key)
union
select 'ldb.d_calendar_week a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key)
join ldb.d_calendar_week a137
on (a18.week_start_date_key = a137.row_key)
union
select 'ldb.d_case_approval a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_approval a138
on (a16.approval_state_src_key = a138.row_key)
union
select 'ldb.d_case_assignment_group a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_assignment_group a139
on (a16.assignment_group_key = a139.row_key)
union
select 'ldb.d_case_calendar_hour a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_time a113
on (a11.case_time_key = a113.row_key)
join ldb.d_case_calendar_hour a140
on (a113.hour_key = a140.row_key)
union
select 'ldb.d_case_calendar_week a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_date a112
on (a11.case_date_key = a112.row_key)
join ldb.d_case_calendar_week a141
on (a112.week_start_date_key = a141.row_key)
union
select 'ldb.d_case_category a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_category a142
on (a16.category_src_key = a142.row_key)
union
select 'ldb.d_case_company a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_company a143
on (a16.company_key = a143.row_key)
union
select 'ldb.d_case_impact a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_impact a144
on (a16.impact_src_key = a144.row_key)
union
select 'ldb.d_case_location a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_location a145
on (a16.location_key = a145.row_key)
union
select 'ldb.d_case_overall_sla_flag a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_overall_sla_flag a146
on (a16.overall_sla_outcome_flag_key = a146.row_key)
union
select 'ldb.d_case_model a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_model a147
on (a16.product_model_key = a147.row_key)
union
select 'ldb.d_case_parent_task_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_parent_task_c a148
on (a16.case_parent_task_c_key = a148.row_key)
union
select 'ldb.d_case_priority a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_priority a149
on (a16.priority_src_key = a149.row_key)
union
select 'ldb.d_case_sla_resolution_flag a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_sla_resolution_flag a150
on (a16.met_resolution_sla_flag_key = a150.row_key)
union
select 'ldb.d_internal_contact_case_resolved_by_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_internal_contact_case_resolved_by_c a151
on (a16.resolved_by_c_key = a151.row_key)
union
select 'ldb.d_case_sla_response_flag a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_sla_response_flag a152
on (a16.met_response_sla_flag_key = a152.row_key)
union
select 'ldb.d_case_state a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_state a153
on (a16.state_src_key = a153.row_key)
union
select 'ldb.d_case_subcategory a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_subcategory a154
on (a16.sub_category_src_key = a154.row_key)
union
select 'ldb.d_case_urgency a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_urgency a155
on (a16.urgency_src_key = a155.row_key)
union
select 'ldb.d_case_reported_type a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_reported_type a157
on (a16.reported_type_src_key = a157.row_key)
union
select 'ldb.d_internal_contact_case_contact_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_internal_contact_case_contact_c a158
on (a16.case_contact_c_key = a158.row_key)
union
select 'ldb.d_customer_mdm a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_customer a121
on (a11.customer_account_key = a121.row_key)
join ldb.d_customer_mdm a159
on (a121.customer_mdm_key = a159.row_key)
union
select 'ldb.d_case_escalated_reason_c a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_escalated_reason_c a160
on (a16.case_escalated_reason_c_key = a160.row_key)
union
select 'ldb.d_calendar_time_hour a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_time a122
on (a11.time_key = a122.row_key)
join ldb.d_calendar_time_hour a161
on (a122.hour_key = a161.row_key)
union
select 'ldb.d_ibm_accounts_c a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_ibm_accounts_c a162
on (a16.ibm_accounts_c_key = a162.row_key)
union
select 'ldb.d_lov_case_first_severity_src_c a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_lov_case_first_severity_src_c a163
on (a16.first_severity_src_c_key = a163.row_key)
union
select 'ldb.d_case_soft_layer_subject_c a164 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_soft_layer_subject_c a164
on (a16.case_soft_layer_subject_c_key = a164.row_key)
union
select 'ldb.d_lov_case_starting_ticket_priority_src_c a165 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_lov_case_starting_ticket_priority_src_c a165
on (a16.starting_ticket_priority_src_c_key = a165.row_key)
union
select 'ldb.d_lov_case_status_src_c a166 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_lov_case_status_src_c a166
on (a16.status_src_c_key = a166.row_key)
union
select 'ldb.d_case_support_tier_c a167 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_support_tier_c a167
on (a16.case_support_tier_c_key = a167.row_key)
union
select 'ldb.d_case_support_type_c a168 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_support_type_c a168
on (a16.case_support_type_c_key = a168.row_key)
union
select 'ldb.d_case_ticket_priority_c a169 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key)
join ldb.d_case_ticket_priority_c a169
on (a16.case_ticket_priority_c_key = a169.row_key)
union
select 'ldb.d_case_business_service_criticality a170 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key) join ldb.d_case_business_service a111
on (a16.business_service_key = a111.row_key)
join ldb.d_case_business_service_criticality a170
on (a111.criticality_key = a170.row_key)
union
select 'ldb.d_case_business_service_used_for a171 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key) join ldb.d_case_business_service a111
on (a16.business_service_key = a111.row_key)
join ldb.d_case_business_service_used_for a171
on (a111.used_for_src_key = a171.row_key)
union
select 'ldb.d_case_customer_mdm a172 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key) join ldb.d_case_customer a118
on (a16.customer_account_key = a118.row_key)
join ldb.d_case_customer_mdm a172
on (a118.customer_mdm_key = a172.row_key)
union
select 'ldb.d_case_tribe_c a173 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case a16
on (a11.case_key = a16.row_key) join ldb.d_case_configuration_item a116
on (a16.configuration_item_key = a116.row_key)
join ldb.d_case_tribe_c a173
on (a116.case_tribe_c_key = a173.row_key)
union
select 'ldb.d_calendar_year a174 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_calendar_date a18
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110
on (a19.quarter_start_date_key = a110.row_key)
join ldb.d_calendar_year a174
on (a110.year_start_date_key = a174.row_key)
union
select 'ldb.d_case_calendar_year a175 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_case_date a112
on (a11.case_date_key = a112.row_key) join ldb.d_case_calendar_month a114
on (a112.month_start_date_key = a114.row_key) join ldb.d_case_calendar_quarter a115
on (a114.quarter_start_date_key = a115.row_key)
join ldb.d_case_calendar_year a175
on (a115.year_start_date_key = a175.row_key)

union
select 'ldb.d_case_cause_code_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11
join ldb.d_lov_case_cause_code_c a156
on (a11.case_cause_code_c_key = a156.row_key)