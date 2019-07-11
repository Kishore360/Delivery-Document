select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) 
join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
union
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_change_request_caused_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a110 
on (a11.caused_by_change_key = a110.row_key) 
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a111 
on (a11.change_request_key = a111.row_key) 
union
select 'ldb.d_customer a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a112 
on (a11.customer_key = a112.row_key) 
union
select 'ldb.d_internal_contact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a113 
on (a11.employee_key = a113.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a114 
on (a11.opened_by_c1_key = a114.row_key) 
union
select 'ldb.d_internal_contact_caller_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_caller_c a115 
on (a11.opened_by_key = a115.row_key) 
union
select 'ldb.d_calendar_date_fiscal a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a116 
on (a11.fiscal_date_key = a116.row_key) 
union
select 'ldb.d_calendar_time a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a117 
on (a11.time_key = a117.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_employee_type_c a118 
on (a11.opened_by_c_key = a118.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a116 
on (a11.fiscal_date_key = a116.row_key) 
join ldb.d_calendar_fiscal_quarter a119 
on (a116.quarter_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_fiscal_year a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a116 
on (a11.fiscal_date_key = a116.row_key) 
join ldb.d_calendar_fiscal_year a120 
on (a116.year_start_date_key = a120.row_key) 
union
select 'ldb.d_calendar_week a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) 
join ldb.d_calendar_week a121 
on (a16.week_start_date_key = a121.row_key) 
union
select 'ldb.d_calendar_year a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a16 
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17 
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18 
on (a17.quarter_start_date_key = a18.row_key) 
join ldb.d_calendar_year a122 
on (a18.year_start_date_key = a122.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a123 
on (a11.assignment_group_c1_key = a123.row_key) 
union
select 'ldb.d_employee_duration_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_employee_duration_c a124 
on (a11.caller_by_employee_duration_c_key = a124.row_key) 
union
select 'ldb.d_internal_organization_legalentity a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a125 
on (a11.company_key = a125.row_key) 
union
select 'ldb.d_duration_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_duration_c a126 
on (a11.opened_by_employee_duration_c = a126.row_key) 
union
select 'ldb.d_incident_agebucket a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a127 
on (a11.age_key = a127.row_key) 
union
select 'ldb.d_category_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_category_c a128 
on (a11.category_5_c_key = a128.row_key) 
union
select 'ldb.d_incident_contacttype a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a129 
on (a11.reported_type_src_key = a129.row_key) 
union
select 'ldb.d_incident_impact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a130 
on (a11.impact_src_key = a130.row_key) 
union
select 'ldb.d_incident_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a131 
on (a11.urgency_src_key = a131.row_key) 
union
select 'ldb.d_lov_incident_method_of_contact_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_method_of_contact_c a132 
on (a11.method_of_contact_c_key = a132.row_key) 
union
select 'ldb.d_flag_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_flag_c a133 
on (a11.sd_touch_flag_c_key = a133.row_key) 
union
select 'ldb.d_lov_incident_service_type_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_service_type_c a134 
on (a11.service_type_c_key = a134.row_key) 
union
select 'ldb.d_lov_incident_resolver_department_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_resolver_department_c a135 
on (a11.resolver_department_c_key = a135.row_key) 
union
select 'ldb.d_location a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a136 
on (a11.location_key = a136.row_key) 
union
select 'ldb.d_lov_incident_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_type_c a137 
on (a11.type_c_key = a137.row_key) 
union
select 'ldb.d_lov_incident_who_is_affected_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_who_is_affected_c a138 
on (a11.who_is_affected_c_key = a138.row_key) 
union
select 'ldb.d_lov_configuration_item_application_tier_src_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_lov_configuration_item_application_tier_src_c a139 
on (a12.application_tier_src_c_key = a139.row_key) 
union
select 'ldb.d_internal_contact_assigned_to_mdm_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
join ldb.d_internal_contact_assigned_to_mdm_c a140 
on (a13.assigned_to_mdm_key_c = a140.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a141 
on (a14.portfolio_src_c_key = a141.row_key) 
union
select 'ldb.d_business_service_criticality a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_criticality a142 
on (a15.criticality_key = a142.row_key) 
union
select 'ldb.d_business_service_used_for a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_used_for a143 
on (a15.used_for_src_key = a143.row_key) 
union
select 'ldb.d_customer_mdm a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a112 
on (a11.customer_key = a112.row_key) 
join ldb.d_customer_mdm a144 
on (a112.customer_mdm_key = a144.row_key) 
union
select 'ldb.d_internal_organization_department a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a113 
on (a11.employee_key = a113.row_key) 
join ldb.d_internal_organization_department a145 
on (a113.department_key = a145.row_key) 
union
select 'ldb.d_internal_contact_mdm a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a113 
on (a11.employee_key = a113.row_key) 
join ldb.d_internal_contact_mdm a146 
on (a113.employee_mdm_key = a146.row_key) 
union
select 'ldb.d_calendar_time_hour a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a117 
on (a11.time_key = a117.row_key) 
join ldb.d_calendar_time_hour a147 
on (a117.hour_key = a147.row_key) 
union
select 'ldb.d_incident_close_code a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_close_code a148 
on (a19.close_code_src_key = a148.row_key) 
union
select 'ldb.d_lov_sc_req_item_employee_type_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_employee_type_c a118 
on (a11.opened_by_c_key = a118.row_key) 
join ldb.d_lov_sc_req_item_employee_type_c a149 
on (a118.employee_type_c_key = a149.row_key) 
union
select 'ldb.d_incident_priority a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_priority a150 
on (a19.priority_src_key = a150.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_task_sla_resolution_flag a151 
on (a19.met_resolution_sla_flag_key = a151.row_key) 
union
select 'ldb.d_task_sla_response_flag a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_task_sla_response_flag a152 
on (a19.met_response_sla_flag_key = a152.row_key) 
union
select 'ldb.d_incident_severity a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_severity a153 
on (a19.severity_src_key = a153.row_key) 
union
select 'ldb.d_incident_state a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_state a154 
on (a19.state_src_key = a154.row_key) 
union
select 'ldb.d_incident_subcategory a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_subcategory a155 
on (a19.sub_category_src_key = a155.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a123 
on (a11.assignment_group_c1_key = a123.row_key) 
join ldb.d_internal_organization_group_parent_c a156 
on (a123.parent_row_c_key = a156.row_key) 