select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_organization_legalentity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a12 
on (a11.company_key = a12.row_key) 
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
union
select 'ldb.d_internal_contact_incident_requested_for_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_incident_requested_for_c a17 
on (a11.affected_user_c_key = a17.row_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a18 
on (a11.assignment_group_key = a18.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_type_hierarchy a19 
on (a11.assignment_group_key = a19.user_group_type_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_internal_organization_affected_user_dept a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_affected_user_dept a114 
on (a11.affected_user_dept_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a115 
on (a11.assigned_to_key = a115.row_key) 
union
select 'ldb.d_change_request_caused_by a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a116 
on (a11.caused_by_change_key = a116.row_key) 
union
select 'ldb.d_change_request a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a117 
on (a11.change_request_key = a117.row_key) 
union
select 'ldb.d_customer_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a118 
on (a13.row_current_key = a118.row_current_key) 
union
select 'ldb.d_internal_organization_department a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a119 
on (a11.opened_by_department_key = a119.row_key) 
union
select 'ldb.d_detail_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_detail_c a120 
on (a11.detail_c_key = a120.row_key) 
union
select 'ldb.d_domain a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a121 
on (a11.domain_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a122 
on (a14.row_current_key = a122.row_current_key) 
union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
join ldb.d_calendar_time_hour a123 
on (a15.hour_24_format_num = a123.hour_24_format_num) 
union
select 'ldb.d_lov_inc_awaiting_info_detail_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_inc_awaiting_info_detail_c a124 
on (a11.awaiting_info_c_key = a124.row_key) 
union
select 'ldb.d_parent_location_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_parent_location_c a125 
on (a11.parent_location_c_key = a125.row_key) 
union
select 'ldb.d_task_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a126 
on (a11.impact_src_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_task_priority a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a128 
on (a11.priority_src_key = a128.row_key) 
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
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a131 
on (a110.criticality_key = a131.row_key) 
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a132 
on (a110.used_for_src_key = a132.row_key) 
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_category a133 
on (a16.category_src_key = a133.row_key) 
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_close_code a134 
on (a16.close_code_src_key = a134.row_key) 
union
select 'ldb.d_incident_severity a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_severity a135 
on (a16.severity_src_key = a135.row_key) 
union
select 'ldb.d_incident_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_state a136 
on (a16.state_src_key = a136.row_key) 
union
select 'ldb.d_incident_subcategory a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a16 
on (a11.incident_key = a16.row_key) 
join ldb.d_incident_subcategory a137 
on (a16.sub_category_src_key = a137.row_key) 
union
select 'ldb.d_calendar_week a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_week a138 
on (a111.week_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_month a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_month a139 
on (a111.month_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_quarter a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_quarter a140 
on (a111.quarter_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_year a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a111 
on (a11.opened_on_key = a111.row_key) 
join ldb.d_calendar_year a141 
on (a111.year_start_date_key = a141.row_key) 
