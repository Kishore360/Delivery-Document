select 'ldb.f_problem_resolved	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
union
select 'ldb.d_calendar_date	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_calendar_date	a12 
on (a11.closed_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_contact	a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_contact_assigned_to	a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_user_group_hierarchy	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) 
join	ldb.dh_user_group_hierarchy	a17 
on (a16.row_dn_key = a17.lev_0_key) 
union
select 'ldb.d_business_service	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_business_service	a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_configuration_item	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_configuration_item	a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_problem	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem	a110 
on (a11.problem_key = a110.row_key) 
union
select 'ldb.d_configuration_item_cmdb_ci_c	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_configuration_item_cmdb_ci_c	a111 
on (a11.cmdb_ci_c_key = a111.row_key) 
union
select 'ldb.d_change_request	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_change_request	a112 
on (a11.change_request_key = a112.row_key) 
union
select 'ldb.d_internal_organization_department	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_department	a113 
on (a11.opened_by_department_key = a113.row_key) 
union
select 'ldb.d_internal_contact_mdm	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_contact	a13 
on (a11.opened_by_key = a13.row_key) 
join	ldb.d_internal_contact_mdm	a114 
on (a13.row_current_key = a114.row_current_key) 
union
select 'ldb.d_calendar_time_hour	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_calendar_time	a14 
on (a11.opened_time_key = a14.row_key) 
join	ldb.d_calendar_time_hour	a115 
on (a14.hour_24_format_num = a115.hour_24_format_num) 
union
select 'ldb.d_problem_impact	a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem_impact	a116 
on (a11.impact_src_key = a116.row_key) 
union
select 'ldb.d_problem_priority	a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem_priority	a117 
on (a11.priority_src_key = a117.row_key) 
union
select 'ldb.d_problem_reported_type	a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem_reported_type	a118 
on (a11.reported_type_src_key = a118.row_key) 
union
select 'ldb.d_problem_state	a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem_state	a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_problem_urgency	a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem_urgency	a120 
on (a11.urgency_src_key = a120.row_key) 
union
select 'ldb.o_data_freshness	a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.o_data_freshness	a121 
on (a11.source_id = a121.source_id) 
union
select 'ldb.d_location	a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_location	a122 
on (a11.location_key = a122.row_key) 
union
select 'ldb.d_location_assigned_to	a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_contact_assigned_to	a15 
on (a11.assigned_to_key = a15.row_key) 
join	ldb.d_location_assigned_to	a123 
on (a15.location_key = a123.row_key) 
union
select 'ldb.dh_user_group_level1	a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) join	ldb.dh_user_group_hierarchy	a17 
on (a16.row_dn_key = a17.lev_0_key) 
join	ldb.dh_user_group_level1	a124 
on (a17.lev_1_key = a124.row_key) 
union
select 'ldb.d_business_service_criticality	a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_business_service	a18 
on (a11.business_service_key = a18.row_key) 
join	ldb.d_business_service_criticality	a125 
on (a18.criticality_key = a125.row_key) 
union
select 'ldb.d_business_service_used_for	a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_business_service	a18 
on (a11.business_service_key = a18.row_key) 
join	ldb.d_business_service_used_for	a126 
on (a18.used_for_src_key = a126.row_key) 
union
select 'ldb.d_problem_outage_scope_c	a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem	a110 
on (a11.problem_key = a110.row_key) 
join	ldb.d_problem_outage_scope_c	a127 
on (a110.outage_scope_c_key = a127.row_key) 
union
select 'ldb.d_problem_root_cause_category_c	a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem	a110 
on (a11.problem_key = a110.row_key) 
join	ldb.d_problem_root_cause_category_c	a128 
on (a110.root_cause_category_c_key = a128.row_key) 
union
select 'ldb.d_problem_severity_level_c	a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_problem	a110 
on (a11.problem_key = a110.row_key) 
join	ldb.d_problem_severity_level_c	a129 
on (a110.severity_level_c_key = a129.row_key) 
union
select 'ldb.dh_user_group_level2	a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) join	ldb.dh_user_group_hierarchy	a17 
on (a16.row_dn_key = a17.lev_0_key) 
join	ldb.dh_user_group_level2	a130 
on (a17.lev_2_key = a130.row_key) 
union
select 'ldb.d_calendar_month	a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_calendar_date	a12 
on (a11.closed_on_key = a12.row_key) 
join	ldb.d_calendar_month	a131 
on (a12.month_start_date_key = a131.row_key) 
union
select 'ldb.dh_user_group_level3	a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) join	ldb.dh_user_group_hierarchy	a17 
on (a16.row_dn_key = a17.lev_0_key) 
join	ldb.dh_user_group_level3	a132 
on (a17.lev_3_key = a132.row_key) 
union
select 'ldb.dh_user_group_level4	a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_resolved	a11 
join	ldb.d_internal_organization_group	a16 
on (a11.assignment_group_key = a16.row_key) join	ldb.dh_user_group_hierarchy	a17 
on (a16.row_dn_key = a17.lev_0_key) 
join	ldb.dh_user_group_level4	a133 
on (a17.lev_4_key = a133.row_key) 