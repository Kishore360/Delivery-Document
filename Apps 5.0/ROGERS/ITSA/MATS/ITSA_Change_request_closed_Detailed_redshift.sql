select 'ldb.f_change_request_closed a11 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.dh_user_group_hierarchy a15 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
union
select 'ldb.d_business_service a16 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a17 
on (a11.closed_on_key = a17.row_key) 
union
select 'ldb.d_change_request a18 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a18 
on (a11.change_request_key = a18.row_key) 
union
select 'ldb.d_change_request_risk a19 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_risk a19 
on (a11.risk_src_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_change_request_approval a111 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_approval a111 
on (a11.approval_state_src_key = a111.row_key) 
union
select 'ldb.d_change_request_category a112 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_category a112 
on (a11.category_src_key = a112.row_key) 
union
select 'ldb.d_change_request_reported_type a113 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reported_type a113 
on (a11.reported_type_src_key = a113.row_key) 
union
select 'ldb.d_change_request_impact a114 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_impact a114 
on (a11.impact_src_key = a114.row_key) 
union
select 'ldb.d_change_request_priority a115 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_change_request_reason a116 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_reason a116 
on (a11.reason_src_key = a116.row_key) 
union
select 'ldb.d_internal_contact_task_for_c a117 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact_task_for_c a117 
on (a11.task_for_c_key = a117.row_key) 
union
select 'ldb.d_change_request_review_status a118 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_review_status a118 
on (a11.review_status_src_key = a118.row_key) 
union
select 'ldb.d_change_request_scope a119 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_scope a119 
on (a11.scope_src_key = a119.row_key) 
union
select 'ldb.d_change_request_state a120 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_state a120 
on (a11.state_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_type a121 
on (a11.type_src_key = a121.row_key) 
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_department a123 
on (a11.requested_by_department_key = a123.row_key) 
union
select 'ldb.d_domain a124 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_domain a124 
on (a11.domain_key = a124.row_key) 
union
select 'ldb.d_internal_contact_mdm a125 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a125 
on (a12.row_current_key = a125.row_current_key) 
union
select 'ldb.d_incident a126 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_incident a126 
on (a11.incident_c_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_location a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_problem a128 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_problem a128 
on (a11.problem_c_key = a128.row_key) 
union
select 'ldb.dh_user_group_level1 a129 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
join ldb.dh_user_group_level1 a129 
on (a15.lev_1_key = a129.row_key) 
union
select 'ldb.d_business_service_criticality a130 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
join ldb.d_business_service_criticality a130 
on (a16.criticality_key = a130.row_key) 
union
select 'ldb.d_business_service_used_for a131 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_business_service a16 
on (a11.business_service_key = a16.row_key) 
join ldb.d_business_service_used_for a131 
on (a16.used_for_src_key = a131.row_key) 
union
select 'ldb.d_calendar_month a132 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a17 
on (a11.closed_on_key = a17.row_key) 
join ldb.d_calendar_month a132 
on (a17.month_start_date_key = a132.row_key) 
union
select 'ldb.d_calendar_week a133 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a17 
on (a11.closed_on_key = a17.row_key) 
join ldb.d_calendar_week a133 
on (a17.week_start_date_key = a133.row_key) 
union
select 'ldb.d_lov_change_request_sub_status_c a134 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a18 
on (a11.change_request_key = a18.row_key) 
join ldb.d_lov_change_request_sub_status_c a134 
on (a18.sub_status_src_c_key = a134.row_key) 
union
select 'ldb.d_lov_change_request_sub_category_c a135 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a18 
on (a11.change_request_key = a18.row_key) 
join ldb.d_lov_change_request_sub_category_c a135 
on (a18.subcategory_src_c_key = a135.row_key) 
union
select 'ldb.d_lov_change_request_environment_c a136 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_change_request a18 
on (a11.change_request_key = a18.row_key) 
join ldb.d_lov_change_request_environment_c a136 
on (a18.environment_src_c_key = a136.row_key) 
union
select 'ldb.dh_user_group_level2 a137 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
join ldb.dh_user_group_level2 a137 
on (a15.lev_2_key = a137.row_key) 
union
select 'ldb.d_calendar_quarter a138 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a17 
on (a11.closed_on_key = a17.row_key) 
join ldb.d_calendar_quarter a138 
on (a17.quarter_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(1) Row_Count
from ldb.f_change_request_closed a11 
join ldb.d_calendar_date a17 
on (a11.closed_on_key = a17.row_key) 
join ldb.d_calendar_year a139 
on (a17.year_start_date_key = a139.row_key) 
