select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.time_key = a15.row_key) 
union
select 'ldb.d_internal_contact_employee_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_employee_type_c a16 
on (a11.opened_by_c_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group_parent_internal_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a17 
on (a11.assignment_group_c1_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) 
join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
union
select 'ldb.d_change_request_caused_by a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a115 
on (a11.caused_by_change_key = a115.row_key) 
union
select 'ldb.d_change_request a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a116 
on (a11.change_request_key = a116.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a117 
on (a11.opened_by_c1_key = a117.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a118 
on (a14.quarter_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_fiscal_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a119 
on (a14.year_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) 
join ldb.d_calendar_week a120 
on (a111.week_start_date_key = a120.row_key) 
union
select 'ldb.d_calendar_year a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112 
on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
join ldb.d_calendar_year a121 
on (a113.year_start_date_key = a121.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a122 
on (a11.assigned_to_key = a122.row_key) 
union
select 'ldb.d_internal_organization_legalentity a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a123 
on (a11.company_key = a123.row_key) 
union
select 'ldb.d_customer_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a124 
on (a12.customer_mdm_key = a124.row_key) 
union
select 'ldb.d_internal_organization_department a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_organization_department a125 
on (a13.department_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a13.employee_mdm_key = a126.row_key) 
union
select 'ldb.d_duration_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_duration_c a127 
on (a11.opened_by_employee_duration_c = a127.row_key) 
union
select 'ldb.d_calendar_time_hour a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.time_key = a15.row_key) 
join ldb.d_calendar_time_hour a128 
on (a15.hour_key = a128.row_key) 
union
select 'ldb.d_incident_agebucket a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a129 
on (a11.age_key = a129.row_key) 
union
select 'ldb.d_category_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_category_c a130 
on (a11.category_5_c_key = a130.row_key) 
union
select 'ldb.d_incident_contacttype a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a131 
on (a11.reported_type_src_key = a131.row_key) 
union
select 'ldb.d_incident_impact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a133 
on (a11.impact_src_key = a133.row_key) 
union
select 'ldb.d_incident_urgency a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a134 
on (a11.urgency_src_key = a134.row_key) 
union
select 'ldb.d_lov_incident_method_of_contact_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_method_of_contact_c a135 
on (a11.method_of_contact_c_key = a135.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group_parent_internal_c a17 
on (a11.assignment_group_c1_key = a17.row_key) 
join ldb.d_internal_organization_group_parent_c a136 
on (a17.parent_row_c_key = a136.row_key) 
union
select 'ldb.d_flag_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_flag_c a137 
on (a11.sd_touch_flag_c_key = a137.row_key) 
union
select 'ldb.d_lov_incident_service_type_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_service_type_c a138 
on (a11.service_type_c_key = a138.row_key) 
union
select 'ldb.d_lov_incident_resolver_department_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_resolver_department_c a139 
on (a11.resolver_department_c_key = a139.row_key) 
union
select 'ldb.d_location a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a140 
on (a11.location_key = a140.row_key) 
union
select 'ldb.d_lov_incident_type_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_type_c a141 
on (a11.type_c_key = a141.row_key) 
union
select 'ldb.d_lov_incident_who_is_affected_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_who_is_affected_c a142 
on (a11.who_is_affected_c_key = a142.row_key) 
union
select 'ldb.d_lov_configuration_item_application_tier_src_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
join ldb.d_lov_configuration_item_application_tier_src_c a143 
on (a18.application_tier_src_c_key = a143.row_key) 
union
select 'ldb.d_lov_sys_user_group_portfolio_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
join ldb.d_lov_sys_user_group_portfolio_c a144 
on (a19.portfolio_src_c_key = a144.row_key) 
union
select 'ldb.d_business_service_criticality a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a145 
on (a110.criticality_key = a145.row_key) 
union
select 'ldb.d_business_service_used_for a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a146 
on (a110.used_for_src_key = a146.row_key) 
union
select 'ldb.d_incident_close_code a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_close_code a147 
on (a114.close_code_src_key = a147.row_key) 
union
select 'ldb.d_incident_priority a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_priority a148 
on (a114.priority_src_key = a148.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_task_sla_resolution_flag a149 
on (a114.met_resolution_sla_flag_key = a149.row_key) 
union
select 'ldb.d_task_sla_response_flag a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_task_sla_response_flag a150 
on (a114.met_response_sla_flag_key = a150.row_key) 
union
select 'ldb.d_incident_severity a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_severity a151 
on (a114.severity_src_key = a151.row_key) 
union
select 'ldb.d_incident_state a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_state a152 
on (a114.state_src_key = a152.row_key) 
union
select 'ldb.d_incident_subcategory a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a114 
on (a11.incident_key = a114.row_key) 
join ldb.d_incident_subcategory a153 
on (a114.sub_category_src_key = a153.row_key) 
