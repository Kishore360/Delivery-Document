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
select 'ldb.dh_assignment_group_tier_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_tier_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_cost_center_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_cost_center_c a110 
on (a11.opened_by_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a111 
on (a11.last_resolved_by_key = a111.row_key) 
union
select 'ldb.d_lov_alarm_source_view_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_alarm_source_view_c a112 
on (a11.alarm_source_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a113 
on (a11.assigned_to_key = a113.row_key) 
union
select 'ldb.d_internal_contact_caller_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_caller_c a114 
on (a11.opened_by_key = a114.row_key) 
union
select 'ldb.d_lov_switch_close_code_view_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_switch_close_code_view_c a115 
on (a11.switch_close_code_c_key = a115.row_key) 
union
select 'ldb.d_customer_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a116 
on (a12.row_current_key = a116.row_current_key) 
union
select 'ldb.d_lov_customer_impacted_view_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_customer_impacted_view_c a117 
on (a11.customer_impacted_c_key = a117.row_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a118 
on (a13.department_key = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a13.row_current_key = a119.row_current_key) 
union
select 'ldb.d_calendar_time_hour a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a120 
on (a14.hour_24_format_num = a120.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a121 
on (a11.age_key = a121.row_key) 
union
select 'ldb.d_incident_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a122 
on (a11.impact_src_key = a122.row_key) 
union
select 'ldb.d_incident_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a123 
on (a11.urgency_src_key = a123.row_key) 
union
select 'ldb.d_location_market_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_market_c a124 
on (a11.market_c_key = a124.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_opened_by_c a125 
on (a11.opened_by_c_key = a125.row_key) 
union
select 'ldb.d_lov_incident_agebucket_secondary_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_agebucket_secondary_c a126 
on (a11.secondary_age_c_key = a126.row_key) 
union
select 'ldb.d_location_site_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_site_c a127 
on (a11.site_c_key = a127.row_key) 
union
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a128 
on (a11.location_key = a128.row_key) 
union
select 'ldb.d_sd_flag_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_sd_flag_c a129 
on (a11.touched_by_service_desk_level_1_c_flag_key = a129.row_key) 
union
select 'ldb.d_flag_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_flag_c a130 
on (a11.touched_by_virteva_c_flag_key = a130.row_key) 
union
select 'ldb.d_lov_type_view_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_type_view_c a131 
on (a11.type_c_key = a131.row_key) 
union
select 'ldb.d_cost_center a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_cost_center_c a110 
on (a11.opened_by_c_key = a110.row_key) 
join ldb.d_cost_center a132 
on (a110.cost_center_c_key = a132.row_key) 
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_category a133 
on (a18.category_src_key = a133.row_key) 
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_close_code a134 
on (a18.close_code_src_key = a134.row_key) 
union
select 'ldb.d_incident_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_priority a135 
on (a18.priority_src_key = a135.row_key) 
union
select 'ldb.d_internal_contact_incident_resolved_by_manager_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a111 
on (a11.last_resolved_by_key = a111.row_key) 
join ldb.d_internal_contact_incident_resolved_by_manager_c a136 
on (a111.employee_manager_c_key = a136.row_key) 
union
select 'ldb.d_incident_state a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_state a137 
on (a18.state_src_key = a137.row_key) 
union
select 'ldb.d_internal_organization_primary_group_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_primary_group_c a138 
on (a13.internal_organization_group_key = a138.row_key) 
union
select 'ldb.d_calendar_month a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a139 
on (a17.month_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_week a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_week a140 
on (a17.week_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_quarter a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_quarter a141 
on (a17.quarter_start_date_key = a141.row_key) 
union
select 'ldb.d_calendar_year a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_year a142 
on (a17.year_start_date_key = a142.row_key) 
