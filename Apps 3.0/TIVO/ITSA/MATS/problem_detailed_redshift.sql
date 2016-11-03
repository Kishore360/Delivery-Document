select 'f_problem' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
union
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
join        ldb.d_internal_contact  a12
on         (a11.opened_by_key = a12.row_key)
union
select 'd_calendar_time' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11  
join        ldb.d_calendar_time      a13
  on         (a11.opened_time_key = a13.row_key)
union
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_contact  a14
  on         (a11.assigned_to_key = a14.row_key)
union
select 'd_internal_organization_group' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
union
select 'dh_user_group_hierarchy' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
  join        ldb.dh_user_group_hierarchy   a16
  on         (a15.row_dn_key = a16.lev_0_key)
union
select 'd_business_service' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_business_service a17
  on         (a11.business_service_key = a17.row_key)
union
select 'd_calendar_date' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_calendar_date      a18
  on         (a11.opened_on_key = a18.row_key)
union
select 'd_problem' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem  a19
  on         (a11.problem_key = a19.row_key)
union
select 'd_configuration_item' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_configuration_item            a110
  on         (a11.configuration_item_key = a110.row_key)
union
select 'd_lov_problem_category_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_lov_problem_category_c a111
  on         (a11.category_src_key = a111.row_key)
union
select 'd_change_request' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_change_request  a112
  on         (a11.change_request_key = a112.row_key)
union
select 'd_lov_problem_closure_code_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_lov_problem_closure_code_c      a113
  on         (a11.closure_code_src_c_key = a113.row_key)
union
select 'd_internal_organization_department' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_department            a114
  on         (a11.opened_by_department_key = a114.row_key)
union
select 'd_internal_contact_mdm' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
join        ldb.d_internal_contact  a12
on         (a11.opened_by_key = a12.row_key)
  join        ldb.d_internal_contact_mdm    a115
  on         (a12.row_current_key = a115.row_current_key)
union
select 'd_calendar_time_hour' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
join        ldb.d_calendar_time      a13
  on         (a11.opened_time_key = a13.row_key)
  join        ldb.d_calendar_time_hour         a116
  on         (a13.hour_24_format_num = a116.hour_24_format_num)
union
select 'd_task_kb_article_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_task_kb_article_c               a117
  on         (a11.kb_article_c_key = a117.row_key)
union
select 'd_incident_originating_incident_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_incident_originating_incident_c   a118
  on         (a11.originating_incident_c_key = a118.row_key)
union
select 'd_problem_state' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem_state     a119
  on         (a11.state_src_key = a119.row_key)
union
select 'd_lov_problem_reproduceability_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_lov_problem_reproduceability_c a120
  on         (a11.reproduceability_src_c_key = a120.row_key)
union
select 'd_lov_problem_source_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_lov_problem_source_c    a121
  on         (a11.source_c_key = a121.row_key)
union
select 'd_lov_problem_subcategory_c' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_lov_problem_subcategory_c         a122
  on         (a11.sub_category_src_key = a122.row_key)
union
select 'd_problem_impact' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem_impact          a123
  on         (a11.impact_src_key = a123.row_key)
union
select 'd_location' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_location   a124
  on         (a11.location_key = a124.row_key)
union
select 'd_problem_priority' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem_priority         a125
  on         (a11.priority_src_key = a125.row_key)
union
select 'd_problem_reported_type' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem_reported_type a126
  on         (a11.reported_type_src_key = a126.row_key)
union
select 'd_problem_urgency' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_problem_urgency        a127
  on         (a11.urgency_src_key = a127.row_key)

union
select 'd_location_assigned_to' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_contact  a14
  on         (a11.assigned_to_key = a14.row_key)
  join        ldb.d_location_assigned_to        a128
  on         (a14.location_key = a128.row_key)
union
select 'dh_user_group_level1' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
  join        ldb.dh_user_group_hierarchy   a16
  on         (a15.row_dn_key = a16.lev_0_key)
  join        ldb.dh_user_group_level1        a129
  on         (a16.lev_1_key = a129.row_key)
union
select 'd_business_service_criticality' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_business_service a17
  on         (a11.business_service_key = a17.row_key)
  join        ldb.d_business_service_criticality      a130
  on         (a17.criticality_key = a130.row_key)
union
select 'd_calendar_month' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_calendar_date      a18
  on         (a11.opened_on_key = a18.row_key)
  join        ldb.d_calendar_month a131
  on         (a18.month_start_date_key = a131.row_key)
union
select 'd_calendar_week' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_calendar_date      a18
  on         (a11.opened_on_key = a18.row_key)
  join        ldb.d_calendar_week    a132
  on         (a18.week_start_date_key = a132.row_key)
union
select 'dh_user_group_level2' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
  join        ldb.dh_user_group_hierarchy   a16
  on         (a15.row_dn_key = a16.lev_0_key)
  join        ldb.dh_user_group_level2          a133
  on         (a16.lev_2_key = a133.row_key)
union
select 'd_calendar_quarter' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_calendar_date      a18
  on         (a11.opened_on_key = a18.row_key)
  join        ldb.d_calendar_quarter a134
  on         (a18.quarter_start_date_key = a134.row_key)
union
select 'dh_user_group_level3' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
  join        ldb.dh_user_group_hierarchy   a16
  on         (a15.row_dn_key = a16.lev_0_key)
  join        ldb.dh_user_group_level3          a135
  on         (a16.lev_3_key = a135.row_key)
union
select 'd_calendar_year' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11  
  join        ldb.d_calendar_date      a18
  on         (a11.opened_on_key = a18.row_key)
join        ldb.d_calendar_year      a136
  on         (a18.year_start_date_key = a136.row_key)
union
select 'dh_user_group_level4' as Table_name, count(a11.row_key) Row_count
from      ldb.f_problem   a11
  join        ldb.d_internal_organization_group         a15
  on         (a11.assignment_group_key = a15.row_key)
  join        ldb.dh_user_group_hierarchy   a16
  on         (a15.row_dn_key = a16.lev_0_key)
  join        ldb.dh_user_group_level4          a137
  on         (a16.lev_4_key = a137.row_key)