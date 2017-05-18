select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
union
select 'ldb.d_customer a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a16 
on (a11.customer_key = a16.row_key) 
union
select 'ldb.d_calendar_time a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a17 
on (a11.opened_time_key = a17.row_key) 
union
select 'ldb.d_calendar_date_opened a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_opened a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a19 
on (a11.assigned_to_key = a19.row_key) 
union
select 'ldb.dh_assignment_group_tier_hierarchy a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a110 
on (a11.assignment_group_key = a110.user_group_tier_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_calendar_date_fiscal a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a112 
on (a11.opened_on_key = a112.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_fiscal_quarter a113 
on (a112.quarter_start_date_key = a113.row_key) 
union
select 'ldb.d_incident_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_state a114 
on (a15.state_src_key = a114.row_key) 
union
select 'ldb.d_incident_building_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_building_c a115 
on (a11.building_c_key = a115.row_key) 
union
select 'ldb.d_internal_organization_legalentity a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a116 
on (a11.company_key = a116.row_key) 
union
select 'ldb.d_customer_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a16 
on (a11.customer_key = a16.row_key) 
join ldb.d_customer_mdm a117 
on (a16.row_current_key = a117.row_current_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a118 
on (a13.department_key = a118.row_key) 
union
select 'ldb.d_domain a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a119 
on (a11.domain_key = a119.row_key) 
union
select 'ldb.d_internal_contact_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a120 
on (a13.row_current_key = a120.row_current_key) 
union
select 'ldb.d_calendar_time_hour a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a17 
on (a11.opened_time_key = a17.row_key) 
join ldb.d_calendar_time_hour a121 
on (a17.hour_24_format_num = a121.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a122 
on (a11.age_key = a122.row_key) 
union
select 'ldb.d_incident_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a123 
on (a11.reported_type_src_key = a123.row_key) 
union
select 'ldb.d_incident_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a124 
on (a11.impact_src_key = a124.row_key) 
union
select 'ldb.d_incident_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a125 
on (a11.urgency_src_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_incident_mttr_agebucket a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_mttr_agebucket a127 
on (a11.mttr_age_key = a127.row_key) 
union
select 'ldb.d_calendar_month_opened a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_opened a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month_opened a128 
on (a18.month_start_date_key = a128.row_key) 
union
select 'ldb.d_incident_outage_type_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_outage_type_c a129 
on (a11.outage_type_src_c_key = a129.row_key) 
union
select 'ldb.d_parent_incident a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_parent_incident a130 
on (a11.parent_incident_key = a130.row_key) 
union
select 'ldb.d_internal_contact_requested_for_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_c a131 
on (a11.requested_for_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_director_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_director_c a132 
on (a14.director_c_key = a132.row_key) 
union
select 'ldb.d_internal_contact_executive_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_executive_c a133 
on (a14.executive_c_key = a133.row_key) 
union
select 'ldb.d_calendar_fiscal_period a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_fiscal a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_fiscal_period a134 
on (a112.period_start_date_key = a134.row_key) 
union
select 'ldb.d_incident_category a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_category a135 
on (a15.category_src_key = a135.row_key) 
union
select 'ldb.d_incident_close_code a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_close_code a136 
on (a15.close_code_src_key = a136.row_key) 
union
select 'ldb.d_incident_priority a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_priority a137 
on (a15.priority_src_key = a137.row_key) 
union
select 'ldb.d_incident_severity a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_severity a138 
on (a15.severity_src_key = a138.row_key) 
union
select 'ldb.d_incident_subcategory a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_subcategory a139 
on (a15.sub_category_src_key = a139.row_key) 
union
select 'ldb.d_internal_contact_queue_manager_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_queue_manager_c a140 
on (a14.queue_manager_c_key = a140.row_key) 
union
select 'ldb.d_calendar_month a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a141 
on (a12.month_start_date_key = a141.row_key) 
union
select 'ldb.d_calendar_week a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_week a142 
on (a12.week_start_date_key = a142.row_key) 
union
select 'ldb.d_calendar_quarter a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_quarter a143 
on (a12.quarter_start_date_key = a143.row_key) 
union
select 'ldb.d_calendar_year a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_year a144 
on (a12.year_start_date_key = a144.row_key) 

