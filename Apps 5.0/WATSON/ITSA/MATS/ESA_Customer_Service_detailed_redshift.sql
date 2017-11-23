select 'ldb.f_case a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_contact a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_case a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
union
select 'ldb.d_business_service a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_customer a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_customer a17 
on (a11.customer_account_key = a17.row_key) 
union
select 'ldb.d_calendar_time a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_time a18 
on (a11.opened_time_key = a18.row_key) 
union
select 'ldb.d_asset a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_asset a19 
on (a11.asset_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_case_3rd_party_status_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_3rd_party_status_c a111 
on (a11.third_party_status_src_c_key = a111.row_key) 
union
select 'ldb.d_case_partner a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_partner a112 
on (a11.partner_key = a112.row_key) 
union
select 'ldb.d_case_cause_code_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_cause_code_c a113 
on (a11.case_cause_code_src_c_key = a113.row_key) 
union
select 'ldb.d_internal_organization_legalentity a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_organization_legalentity a114 
on (a11.company_key = a114.row_key) 
union
select 'ldb.d_contact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_contact a115 
on (a11.contact_key = a115.row_key) 
union
select 'ldb.d_service_contract a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_service_contract a116 
on (a11.service_contract_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_contact a12 
on (a11.assigned_to_key = a12.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
union
select 'ldb.d_service_entitlement a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_service_entitlement a118 
on (a11.service_entitlement_key = a118.row_key) 
union
select 'ldb.d_case_escalated_reason_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_escalated_reason_c a119 
on (a11.escalated_reason_src_c_key = a119.row_key) 
union
select 'ldb.d_ibm_accounts_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_ibm_accounts_c a120 
on (a11.ibm_accounts_c_key = a120.row_key) 
union
select 'ldb.d_location a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_location a121 
on (a11.location_key = a121.row_key) 
union
select 'ldb.d_product_model a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_product_model a122 
on (a11.product_model_key = a122.row_key) 
union
select 'ldb.d_case_soft_layer_subject_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_soft_layer_subject_c a123 
on (a11.soft_layer_subject_src_c_key = a123.row_key) 
union
select 'ldb.d_case_support_tier_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_support_tier_c a124 
on (a11.support_tier_src_c_key = a124.row_key) 
union
select 'ldb.d_case_support_type_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_support_type_c a125 
on (a11.support_type_src_c_key = a125.row_key) 
union
select 'ldb.d_case_ticket_priority_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case_ticket_priority_c a126 
on (a11.ticket_priority_src_c_key = a126.row_key) 
union
select 'ldb.d_business_service_criticality a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_business_service_criticality a127 
on (a14.criticality_key = a127.row_key) 
union
select 'ldb.d_business_service_used_for a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a14 
on (a11.business_service_key = a14.row_key) 
join ldb.d_business_service_used_for a128 
on (a14.used_for_src_key = a128.row_key) 
union
select 'ldb.d_calendar_month a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a129 
on (a15.month_start_date_key = a129.row_key) 
union
select 'ldb.d_calendar_week a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_week a130 
on (a15.week_start_date_key = a130.row_key) 
union
select 'ldb.d_case_approval a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_approval a131 
on (a13.approval_state_src_key = a131.row_key) 
union
select 'ldb.d_case_category a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_category a132 
on (a13.category_src_key = a132.row_key) 
union
select 'ldb.d_case_impact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_impact a133 
on (a13.impact_src_key = a133.row_key) 
union
select 'ldb.d_case_overall_sla_flag a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_overall_sla_flag a134 
on (a13.overall_sla_outcome_flag_key = a134.row_key) 
union
select 'ldb.d_case_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_priority a135 
on (a13.priority_src_key = a135.row_key) 
union
select 'ldb.d_case_sla_resolution_flag a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_sla_resolution_flag a136 
on (a13.met_resolution_sla_flag_key = a136.row_key) 
union
select 'ldb.d_case_sla_response_flag a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_sla_response_flag a137 
on (a13.met_response_sla_flag_key = a137.row_key) 
union
select 'ldb.d_case_state a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_state a138 
on (a13.state_src_key = a138.row_key) 
union
select 'ldb.d_case_subcategory a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_subcategory a139 
on (a13.sub_category_src_key = a139.row_key) 
union
select 'ldb.d_case_urgency a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_urgency a140 
on (a13.urgency_src_key = a140.row_key) 
union
select 'ldb.d_case_reported_type a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key) 
join ldb.d_case_reported_type a141 
on (a13.reported_type_src_key = a141.row_key) 
union
select 'ldb.d_customer_mdm a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_customer a17 
on (a11.customer_account_key = a17.row_key) 
join ldb.d_customer_mdm a142 
on (a17.row_current_key = a142.row_current_key) 
union
select 'ldb.d_calendar_time_hour a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_time a18 
on (a11.opened_time_key = a18.row_key) 
join ldb.d_calendar_time_hour a143 
on (a18.hour_24_format_num = a143.hour_24_format_num) 
union
select 'ldb.d_calendar_quarter a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_quarter a144 
on (a15.quarter_start_date_key = a144.row_key) 
union
select 'ldb.d_calendar_year a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_year a145 
on (a15.year_start_date_key = a145.row_key) 

