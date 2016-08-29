select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_change_request_caused_by a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request_caused_by a19 
on (a11.caused_by_change_c_key = a19.row_key) 
union
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a110 
on (a11.change_request_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_kb_knowledge_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_kb_knowledge_c a112 
on (a11.kb_knowledge_c_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a113 
on (a18.week_start_date_key = a113.row_key) 
union
select 'ldb.d_outage_record_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_outage_record_c a114 
on (a11.outage_record_c_key = a114.row_key) 
union
select 'ldb.d_problem a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a115 
on (a11.problem_key = a115.row_key) 
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_department a116 
on (a11.opened_by_department_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a12.row_current_key = a117.row_current_key) 
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a118 
on (a13.hour_24_format_num = a118.hour_24_format_num) 
union
select 'ldb.d_problem_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a119 
on (a11.impact_src_key = a119.row_key) 
union
select 'ldb.d_problem_manager_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_manager_c a120 
on (a11.problem_manager_c_key = a120.row_key) 
union
select 'ldb.d_problem_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a121 
on (a11.priority_src_key = a121.row_key) 
union
select 'ldb.d_problem_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a122 
on (a11.reported_type_src_key = a122.row_key) 
union
select 'ldb.d_problem_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_state a123 
on (a11.state_src_key = a123.row_key) 
union
select 'ldb.d_problem_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_site_location_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_site_location_c a125 
on (a11.site_location_c_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_location_assigned_to a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_location_assigned_to a127 
on (a14.location_key = a127.row_key) 
union
select 'ldb.dh_user_group_level1 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a16.lev_1_key = a128.row_key) 
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a129 
on (a17.criticality_key = a129.row_key) 
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a130 
on (a17.used_for_src_key = a130.row_key) 
union
select 'ldb.d_problem_cause_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a115 
on (a11.problem_key = a115.row_key) 
join ldb.d_problem_cause_c a131 
on (a115.problem_cause_c_key = a131.row_key) 
union
select 'ldb.dh_user_group_level2 a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a132 
on (a16.lev_2_key = a132.row_key) 
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a133 
on (a18.month_start_date_key = a133.row_key) 
union
select 'ldb.dh_user_group_level3 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a134 
on (a16.lev_3_key = a134.row_key) 
union
select 'ldb.dh_user_group_level4 a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a135 
on (a16.lev_4_key = a135.row_key)