select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key) 
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
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_change_request_caused_by a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a19 
on (a11.caused_by_change_key = a19.row_key) 
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a110 
on (a11.change_request_key = a110.row_key) 
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_contact_customer_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_customer_c a113 
on (a11.customer_c_key = a113.row_key) 
union
select 'ldb.dh_employee_hierarchy a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
union
select 'ldb.d_internal_contact_opened_by_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a115 
on (a11.opened_by_c_key = a115.row_key) 
union
select 'ldb.d_incident_customer_location_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_customer_c a113 
on (a11.customer_c_key = a113.row_key) 
join ldb.d_incident_customer_location_c a116 
on (a113.location_key = a116.row_key) 
union
select 'ldb.d_location_opened_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a115 
on (a11.opened_by_c_key = a115.row_key) 
join ldb.d_location_opened_by_c a117 
on (a115.location_key = a117.row_key) 
union
select 'ldb.d_kb_knowledge_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_kb_knowledge_c a118 
on (a11.kb_knowledge_c_key = a118.row_key) 
union
select 'ldb.d_calendar_week a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a119 
on (a18.week_start_date_key = a119.row_key) 
union
select 'ldb.d_outage_record_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_outage_record_c a120 
on (a11.outage_record_c_key = a120.row_key) 
union
select 'ldb.d_task_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a121 
on (a11.priority_src_key = a121.row_key) 
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
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a124 
on (a11.opened_by_department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a13.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a127 
on (a14.hour_24_format_num = a127.hour_24_format_num) 
union
select 'ldb.d_task_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a128 
on (a11.impact_src_key = a128.row_key) 
union
select 'ldb.d_task_contacttype a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a129 
on (a11.reported_type_src_key = a129.row_key) 
union
select 'ldb.d_task_urgency a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a130 
on (a11.urgency_src_key = a130.row_key) 
union
select 'ldb.dh_user_group_level1 a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a131 
on (a16.lev_1_key = a131.row_key) 
union
select 'ldb.d_business_service_criticality a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a132 
on (a17.criticality_key = a132.row_key) 
union
select 'ldb.d_business_service_used_for a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a133 
on (a17.used_for_src_key = a133.row_key) 
union
select 'ldb.d_incident_closure_category_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_closure_category_c a134 
on (a111.closure_category_c_key = a134.row_key) 
union
select 'ldb.d_incident_closure_subcategory_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_closure_subcategory_c a135 
on (a111.closure_subcategory_c_key = a135.row_key) 
union
select 'ldb.dh_employee_level1 a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level1 a136 
on (a114.lev_1_key = a136.row_key) 
union
select 'ldb.d_incident_category a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_category a137 
on (a111.category_src_key = a137.row_key) 
union
select 'ldb.d_incident_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_close_code a138 
on (a111.close_code_src_key = a138.row_key) 
union
select 'ldb.d_incident_severity a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_severity a139 
on (a111.severity_src_key = a139.row_key) 
union
select 'ldb.d_incident_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_state a140 
on (a111.state_src_key = a140.row_key) 
union
select 'ldb.d_incident_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_subcategory a141 
on (a111.sub_category_src_key = a141.row_key) 
union
select 'ldb.d_incident_wing_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_wing_c a142 
on (a111.wing_c_key = a142.row_key) 
union
select 'ldb.dh_employee_level2 a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level2 a143 
on (a114.lev_2_key = a143.row_key) 
union
select 'ldb.d_calendar_month a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a144 
on (a18.month_start_date_key = a144.row_key) 
union
select 'ldb.dh_employee_level3 a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level3 a145 
on (a114.lev_3_key = a145.row_key) 
union
select 'ldb.dh_employee_level4 a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level4 a146 
on (a114.lev_4_key = a146.row_key) 
union
select 'ldb.dh_employee_level5 a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level5 a147 
on (a114.lev_5_key = a147.row_key) 
union
select 'ldb.dh_employee_level6_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level6_c a148 
on (a114.lev_6_key = a148.row_key) 
union
select 'ldb.dh_employee_level7_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level7_c a149 
on (a114.lev_7_key = a149.row_key) 
union
select 'ldb.dh_employee_level8_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level8_c a150 
on (a114.lev_8_key = a150.row_key) 
union
select 'ldb.dh_employee_level9_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level9_c a151 
on (a114.lev_9_key = a151.row_key) 
union
select 'ldb.dh_employee_level10_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) join ldb.dh_employee_hierarchy a114 
on (a13.row_current_key = a114.lev_0_key) 
join ldb.dh_employee_level10_c a152 
on (a114.lev_10_key = a152.row_key) 
