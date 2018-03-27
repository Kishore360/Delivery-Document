select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_change_request_risk a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a18 
on (a11.risk_src_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_alt_programmer_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_alt_programmer_c a110 
on (a11.alt_programmer_c_key = a110.row_key) 
union
select 'ldb.d_internal_organization_bu_oversight_group_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_bu_oversight_group_c a111 
on (a11.bu_oversight_group_c_key = a111.row_key) 
union
select 'ldb.d_change_request_approval a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval a112 
on (a11.approval_state_src_key = a112.row_key) 
union
select 'ldb.d_change_request_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a113 
on (a11.category_src_key = a113.row_key) 
union
select 'ldb.d_change_request_reported_type a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a114 
on (a11.reported_type_src_key = a114.row_key) 
union
select 'ldb.d_change_request_impact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a115 
on (a11.impact_src_key = a115.row_key) 
union
select 'ldb.d_change_request_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a116 
on (a11.priority_src_key = a116.row_key) 
union
select 'ldb.d_change_request_reason a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a117 
on (a11.reason_src_key = a117.row_key) 
union
select 'ldb.d_change_request_review_status a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a118 
on (a11.review_status_src_key = a118.row_key) 
union
select 'ldb.d_change_request_scope a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a119 
on (a11.scope_src_key = a119.row_key) 
union
select 'ldb.d_change_request_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a121 
on (a11.type_src_key = a121.row_key) 
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_internal_organization_creating_group_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_creating_group_c a123 
on (a11.creating_group_c_key = a123.row_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a124 
on (a11.requested_by_department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a13.row_current_key = a126.row_current_key) 
union
select 'ldb.d_lov_change_environment_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_environment_c a127 
on (a12.change_environment_src_c_key = a127.row_key) 
union
select 'ldb.d_incident a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_incident a128 
on (a11.incident_key = a128.row_key) 
union
select 'ldb.d_lov_change_is_application_outage_required_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_is_application_outage_required_c a129 
on (a12.is_application_outage_required_src_c_key = a129.row_key) 
union
select 'ldb.d_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a130 
on (a11.location_key = a130.row_key) 
union
select 'ldb.d_problem a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_problem a131 
on (a11.problem_key = a131.row_key) 
union
select 'ldb.d_internal_contact_programmer_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_programmer_c a132 
on (a11.programmer_c_key = a132.row_key) 
union
select 'ldb.d_internal_organization_requesting_group_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_requesting_group_c a133 
on (a11.requesting_group_c_key = a133.row_key) 
union
select 'ldb.d_business_service_criticality a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
join ldb.d_business_service_criticality a134 
on (a16.criticality_key = a134.row_key) 
union
select 'ldb.d_business_service_used_for a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
join ldb.d_business_service_used_for a135 
on (a16.used_for_src_key = a135.row_key) 
union
select 'ldb.d_calendar_month a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a136 
on (a17.month_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_week a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_week a137 
on (a17.week_start_date_key = a137.row_key) 
union
select 'ldb.d_change_request_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_change_request_close_code a138 
on (a12.close_code_src_key = a138.row_key) 
union
select 'ldb.d_lov_change_trigger_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_trigger_c a139 
on (a12.change_trigger_src_c_key = a139.row_key) 
union
select 'ldb.d_lov_change_environment_details_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_environment_details_c a140 
on (a12.environment_details_src_c_key = a140.row_key) 
union
select 'ldb.d_lov_change_impact_continuity_plan_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_impact_continuity_plan_c a141 
on (a12.impact_continuity_plan_src_c_key = a141.row_key) 
union
select 'ldb.d_lov_change_impact_availability_plan_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_impact_availability_plan_c a142 
on (a12.impact_availability_plan_src_c_key = a142.row_key) 
union
select 'ldb.d_lov_change_server_outage_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_server_outage_c a143 
on (a12.server_outage_src_c_key = a143.row_key) 
union
select 'ldb.d_lov_change_mf_online_inst_newcopy_met_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_mf_online_inst_newcopy_met_c a144 
on (a12.mf_online_inst_newcopy_met_src_c_key = a144.row_key) 
union
select 'ldb.d_lov_change_outage_type_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_outage_type_c a145 
on (a12.outage_type_src_c_key = a145.row_key) 
union
select 'ldb.d_lov_change_reason_for_application_outage_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_reason_for_application_outage_c a146 
on (a12.reason_for_application_outage_src_c_key = a146.row_key) 
union
select 'ldb.d_lov_change_sub_category_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
join ldb.d_lov_change_sub_category_c a147 
on (a12.sub_category_src_c_key = a147.row_key) 
union
select 'ldb.d_calendar_quarter a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_quarter a148 
on (a17.quarter_start_date_key = a148.row_key) 
union
select 'ldb.d_calendar_year a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_year a149 
on (a17.year_start_date_key = a149.row_key) 
