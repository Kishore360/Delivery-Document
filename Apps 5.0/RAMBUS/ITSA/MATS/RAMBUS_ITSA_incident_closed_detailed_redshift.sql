select 'ldb.f_incident_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.dh_assignment_group_tier_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.dh_assignment_group_type_hierarchy a18 
on (a11.assignment_group_key = a18.user_group_type_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request a110 
on (a11.change_request_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_week a113 
on (a19.week_start_date_key = a113.row_key) 
union
select 'ldb.d_incident_close_code a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_close_code a114 
on (a112.close_code_src_key = a114.row_key) 
union
select 'ldb.d_location_affected_user_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_location_affected_user_c a115 
on (a12.location_key = a115.row_key) 
union
select 'ldb.d_internal_contact_assignor a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_assignor a116 
on (a11.assignor_c_key = a116.row_key) 
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_configuration_item a117 
on (a11.business_service_c_key = a117.row_key) 
union
select 'ldb.d_internal_organization_legalentity a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_legalentity a118 
on (a11.company_key = a118.row_key) 
union
select 'ldb.d_customer_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a119 
on (a13.row_current_key = a119.row_current_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_internal_organization_department a120 
on (a12.department_key = a120.row_key) 
union
select 'ldb.d_domain a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_domain a121 
on (a11.domain_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a122 
on (a12.row_current_key = a122.row_current_key) 
union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a123 
on (a14.hour_24_format_num = a123.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_contacttype a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_incident_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_impact a125 
on (a11.impact_src_key = a125.row_key) 
union
select 'ldb.d_incident_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_location a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_adhoc_request_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_adhoc_request_c a128 
on (a11.adhoc_request_c_key  = a128.row_key) 
union
select 'ldb.d_lov_incident_category_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_lov_incident_category_c a129 
on (a112.category_src_key = a129.row_key) 
union
select 'ldb.d_incident_priority a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_priority a130 
on (a112.priority_src_key = a130.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_task_sla_resolution_flag a131 
on (a112.met_resolution_sla_flag_key = a131.row_key) 
union
select 'ldb.d_task_sla_response_flag a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_task_sla_response_flag a132 
on (a112.met_response_sla_flag_key = a132.row_key) 
union
select 'ldb.d_incident_severity a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_severity a133 
on (a112.severity_src_key = a133.row_key) 
union
select 'ldb.d_lov_incident_state_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_lov_incident_state_c a134 
on (a112.state_src_key = a134.row_key) 
union
select 'ldb.d_incident_subcategory a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_subcategory a135 
on (a112.sub_category_src_key = a135.row_key) 
union
select 'ldb.d_calendar_month a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_month a136 
on (a19.month_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_quarter a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_quarter a137 
on (a19.quarter_start_date_key = a137.row_key) 
union
select 'ldb.d_calendar_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.closed_on_key = a19.row_key) 
join ldb.d_calendar_year a138 
on (a19.year_start_date_key = a138.row_key) 
