select 'ldb.f_change_failure a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
union
select 'ldb.d_change_failure a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_failure a12 
on (a11.change_failure_key = a12.row_key) 
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_configuration_item a13 
on (a11.ci_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_quarter a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) 
join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
union
select 'ldb.d_change_request a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
union
select 'ldb.d_application a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_application a18 
on (a11.application_key_c = a18.row_key) 
union
select 'ldb.d_fmr_product_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_application a18 
on (a11.application_key_c = a18.row_key) 
join ldb.d_fmr_product_c a19 
on (a18.fmr_product_c_key = a19.row_key) 
union
select 'ldb.d_fmr_product_line_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_application a18 
on (a11.application_key_c = a18.row_key) join ldb.d_fmr_product_c a19 
on (a18.fmr_product_c_key = a19.row_key) 
join ldb.d_fmr_product_line_c a110 
on (a19.fmr_product_line_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_programmer_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_internal_contact_programmer_c a111 
on (a11.programmer_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_internal_contact_assigned_to a112 
on (a11.assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_internal_organization_group a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_organization_bu_oversight_group_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_internal_organization_bu_oversight_group_c a114 
on (a11.bu_oversight_group_c_key = a114.row_key) 
union
select 'ldb.d_change_request_category a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request_category a115 
on (a11.change_category_src_key = a115.row_key) 
union
select 'ldb.d_change_request_risk a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request_risk a116 
on (a11.change_risk_src_key = a116.row_key) 
union
select 'ldb.d_change_request_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request_state a117 
on (a11.change_state_src_key = a117.row_key) 
union
select 'ldb.d_lov_impact_capacity_plan_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_failure a12 
on (a11.change_failure_key = a12.row_key) 
join ldb.d_lov_impact_capacity_plan_c a118 
on (a12.impact_capacity_plan_src_c_key = a118.row_key) 
union
select 'ldb.d_lov_impact_security_controls_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_failure a12 
on (a11.change_failure_key = a12.row_key) 
join ldb.d_lov_impact_security_controls_c a119 
on (a12.impact_security_controls_c_key = a119.row_key) 
union
select 'ldb.d_lov_template_type_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_failure a12 
on (a11.change_failure_key = a12.row_key) 
join ldb.d_lov_template_type_c a120 
on (a12.template_type_c_key = a120.row_key) 
union
select 'ldb.d_lov_tier_4_restricted_access_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_failure a12 
on (a11.change_failure_key = a12.row_key) 
join ldb.d_lov_tier_4_restricted_access_c a121 
on (a12.tier_4_restricted_access_src_c_key = a121.row_key) 
union
select 'ldb.d_change_request_close_code a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_change_request_close_code a122 
on (a17.close_code_src_key = a122.row_key) 
union
select 'ldb.d_lov_change_trigger_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_trigger_c a123 
on (a17.change_trigger_src_c_key = a123.row_key) 
union
select 'ldb.d_lov_change_request_conflict_status_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_request_conflict_status_c a124 
on (a17.conflict_status_src_c_key = a124.row_key) 
union
select 'ldb.d_lov_change_environment_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_environment_c a125 
on (a17.change_environment_src_c_key = a125.row_key) 
union
select 'ldb.d_lov_change_environment_details_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_environment_details_c a126 
on (a17.environment_details_src_c_key = a126.row_key) 
union
select 'ldb.d_lov_change_request_fsc_service_required_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_request_fsc_service_required_c a127 
on (a17.fsc_services_required_src_c_key = a127.row_key) 
union
select 'ldb.d_internal_contact_service_offering_manager_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_application a18 
on (a11.application_key_c = a18.row_key) join ldb.d_fmr_product_c a19 
on (a18.fmr_product_c_key = a19.row_key) 
join ldb.d_internal_contact_service_offering_manager_c a128 
on (a19.service_offering_manager_c_key = a128.row_key) 
union
select 'ldb.d_lov_change_impact_continuity_plan_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_impact_continuity_plan_c a129 
on (a17.impact_continuity_plan_src_c_key = a129.row_key) 
union
select 'ldb.d_lov_change_impact_availability_plan_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_impact_availability_plan_c a130 
on (a17.impact_availability_plan_src_c_key = a130.row_key) 
union
select 'ldb.d_lov_change_is_application_outage_required_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_is_application_outage_required_c a131 
on (a17.is_application_outage_required_src_c_key = a131.row_key) 
union
select 'ldb.d_lov_change_server_outage_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_server_outage_c a132 
on (a17.server_outage_src_c_key = a132.row_key) 
union
select 'ldb.d_lov_change_mf_online_inst_newcopy_met_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_mf_online_inst_newcopy_met_c a133 
on (a17.mf_online_inst_newcopy_met_src_c_key = a133.row_key) 
union
select 'ldb.d_lov_change_reason_for_application_outage_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_reason_for_application_outage_c a134 
on (a17.reason_for_application_outage_src_c_key = a134.row_key) 
union
select 'ldb.d_lov_change_sub_category_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_change_request a17 
on (a11.change_request_key = a17.row_key) 
join ldb.d_lov_change_sub_category_c a135 
on (a17.sub_category_src_c_key = a135.row_key) 
union
select 'ldb.d_calendar_year a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) join ldb.d_calendar_month a15 
on (a14.month_start_date_key = a15.row_key) join ldb.d_calendar_quarter a16 
on (a15.quarter_start_date_key = a16.row_key) 
join ldb.d_calendar_year a136 
on (a16.year_start_date_key = a136.row_key) 
union
select 'ldb.d_internal_contact_business_service_manager_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure a11 
join ldb.d_application a18 
on (a11.application_key_c = a18.row_key) join ldb.d_fmr_product_c a19 
on (a18.fmr_product_c_key = a19.row_key) join ldb.d_fmr_product_line_c a110 
on (a19.fmr_product_line_c_key = a110.row_key) 
join ldb.d_internal_contact_business_service_manager_c a137 
on (a110.business_service_manager_c_key = a137.row_key) 
