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
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a15 
on (a11.inc_assignment_group_key = a15.internal_organization_key) 
union
select 'ldb.d_internal_contact_associate_director_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a15 
on (a11.inc_assignment_group_key = a15.internal_organization_key) 
join ldb.d_internal_contact_associate_director_c a16 
on (a15.associate_director_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a111 
on (a11.change_request_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_internal_contact_director_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a15 
on (a11.inc_assignment_group_key = a15.internal_organization_key) 
join ldb.d_internal_contact_director_c a114 
on (a15.director_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a115 
on (a110.month_start_date_key = a115.row_key) 
union
select 'ldb.d_parent_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_parent_incident a116 
on (a113.parent_incident_key = a116.row_key) 
union
select 'ldb.d_internal_contact_vp_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a15 
on (a11.inc_assignment_group_key = a15.internal_organization_key) 
join ldb.d_internal_contact_vp_c a117 
on (a15.vp_key = a117.row_key) 
union
select 'ldb.d_change_request_caused_by a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a118 
on (a11.caused_by_change_key = a118.row_key) 
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a119 
on (a11.company_key = a119.row_key) 
union
select 'ldb.d_customer_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a120 
on (a12.row_current_key = a120.row_current_key) 
union
select 'ldb.d_internal_organization_department a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a121 
on (a13.department_key = a121.row_key) 
union
select 'ldb.d_domain a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a122 
on (a11.domain_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a123 
on (a13.row_current_key = a123.row_current_key) 
union
select 'ldb.d_calendar_time_hour a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a124 
on (a14.hour_24_format_num = a124.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a125 
on (a11.reported_type_src_key = a125.row_key) 
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a126 
on (a11.impact_src_key = a126.row_key) 
union
select 'ldb.d_incident_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a127 
on (a11.urgency_src_key = a127.row_key) 
union
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a128 
on (a11.location_key = a128.row_key) 
union
select 'ldb.d_configuration_item_incident_service_offering_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item_incident_service_offering_c a129 
on (a11.service_offering_c_key = a129.row_key) 
union
select 'ldb.d_business_service_criticality a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_criticality a130 
on (a19.criticality_key = a130.row_key) 
union
select 'ldb.d_business_service_used_for a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_used_for a131 
on (a19.used_for_src_key = a131.row_key) 
union
select 'ldb.d_calendar_week a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_week a132 
on (a110.week_start_date_key = a132.row_key) 
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_category a133 
on (a113.category_src_key = a133.row_key) 
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_close_code a134 
on (a113.close_code_src_key = a134.row_key) 
union
select 'ldb.d_incident_opened_by a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_opened_by a135 
on (a113.opened_by_key = a135.row_key) 
union
select 'ldb.d_incident_priority a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_priority a136 
on (a113.priority_src_key = a136.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_task_sla_resolution_flag a137 
on (a113.met_resolution_sla_flag_key = a137.row_key) 
union
select 'ldb.d_task_sla_response_flag a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_task_sla_response_flag a138 
on (a113.met_response_sla_flag_key = a138.row_key) 
union
select 'ldb.d_incident_severity a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_severity a139 
on (a113.severity_src_key = a139.row_key) 
union
select 'ldb.d_incident_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_state a140 
on (a113.state_src_key = a140.row_key) 
union
select 'ldb.d_incident_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_incident_subcategory a141 
on (a113.sub_category_src_key = a141.row_key) 
union
select 'ldb.d_lov_incident_incident_type_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_lov_incident_incident_type_c a142 
on (a113.incident_type_src_c_key = a142.row_key) 
union
select 'ldb.d_internal_contact_incident_opened_for_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_internal_contact_incident_opened_for_c a143 
on (a113.opened_for_key = a143.row_key) 
union
select 'ldb.d_lov_incident_service_type_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_lov_incident_service_type_c a144 
on (a113.service_type_src_c_key = a144.row_key) 
union
select 'ldb.d_lov_incident_why_not_cwt_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
join ldb.d_lov_incident_why_not_cwt_c a145 
on (a113.why_now_cwt_src_c_key = a145.row_key) 
union
select 'ldb.d_calendar_quarter a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_quarter a146 
on (a110.quarter_start_date_key = a146.row_key) 
union
select 'ldb.d_calendar_year a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_year a147 
on (a110.year_start_date_key = a147.row_key) 
