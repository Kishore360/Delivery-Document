SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select     'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
union
select     'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request     a13
on  (a11.change_request_key=a13.row_key)
union
select     'ldb.d_internal_organization_group1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_group     a13
on  (a11.causal_assignment_group_c_key=a13.row_key)
union
select     'ldb.d_internal_organization_group2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
union
select     'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
union
select     'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_assignment_group_level0_manager_c_relation     a16
on  (a11.assignment_group_key=a16.level0_assigment_group_key)
union
select     'ldb.d_assignment_group_level0_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_assignment_group_level0_vp_c_relation     a17
on  (a11.assignment_group_key=a17.level0_assigment_group_key)
union
select     'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_calendar_date     a18
on  (a11.opened_on_key=a18.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
  join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a19
on  (a15.lev_1_key=a19.level1_assigment_group_key)
union
select     'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
  join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a110
on  (a15.lev_1_key=a110.level1_assigment_group_key)
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact     a111
on  (a11.assigned_to_key=a111.row_key)
union
select     'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_category     a112
on  (a11.category_src_key=a112.row_key)
union
select     'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_reason     a113
on  (a11.reason_src_key=a113.row_key)
union
select     'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_state     a114
on  (a11.state_src_key=a114.row_key)
union
select     'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_review_status     a115
on  (a11.review_status_src_key=a115.row_key)
union
select     'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_risk     a116
on  (a11.risk_src_key=a116.row_key)
union
select     'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_scope     a117
on  (a11.scope_src_key=a117.row_key)
union
select     'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_type     a118
on  (a11.type_src_key=a118.row_key)
union
select     'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_configuration_item     a119
on  (a11.configuration_item_key=a119.row_key)
union
select     'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_department     a120
on  (a11.requested_by_department_key=a120.row_key)
union
select     'ldb.d_change_request_lov_deployment_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_lov_deployment_reason_c     a121
on  (a11.deployment_reason_c_key=a121.row_key)
union
select     'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_domain     a122
on  (a11.domain_key=a122.row_key)
union
select     'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_internal_contact     a12
on  (a11.opened_by_key=a12.row_key)
join ldb.d_internal_contact_mdm     a123
on  (a12.row_current_key=a123.row_current_key)
union
select     'ldb.d_change_request_lov_stage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_lov_stage_c     a124
on  (a11.stage_src_c_key=a124.row_key)
union
select     'ldb.d_change_request_lov_standard_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_lov_standard_status_c     a125
on  (a11.standard_status_c_key=a125.row_key)
union
select     'ldb.d_change_request_lov_subcategory_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_lov_subcategory_c     a126
on  (a11.subcategory_c_key=a126.row_key)
union
select     'ldb.d_change_request_lov_success_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_lov_success_state_c     a127
on  (a11.success_status_c_key=a127.row_key)
union
select     'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_impact     a128
on  (a11.impact_src_key=a128.row_key)
union
select     'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_location     a129
on  (a11.location_key=a129.row_key)
union
select     'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_priority     a130
on  (a11.priority_src_key=a130.row_key)
union
select     'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_contacttype     a131
on  (a11.reported_type_src_key=a131.row_key)
union
select     'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_urgency     a132
on  (a11.urgency_src_key=a132.row_key)
union
select     'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
join ldb.dh_user_group_level1     a133
on  (a15.lev_1_key=a133.row_key)
union
select     'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_assignment_group_level0_manager_c_relation     a16
on  (a11.assignment_group_key=a16.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c     a134
on  (a16.level0_manager_c_key=a134.level0_manager_c_key)
union
select     'ldb.d_assignment_group_level0_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_assignment_group_level0_vp_c_relation     a17
on  (a11.assignment_group_key=a17.level0_assigment_group_key)
join ldb.d_assignment_group_level0_vp_c     a135
on  (a17.level0_vp_c_key=a135.level0_vp_c_key)
union
select     'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_calendar_date     a18
on  (a11.opened_on_key=a18.row_key)
join ldb.d_calendar_month     a136
on  (a18.month_start_date_key=a136.row_key)
union
select     'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_calendar_date     a18
on  (a11.opened_on_key=a18.row_key)
join ldb.d_calendar_week     a137
on  (a18.week_start_date_key=a137.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a19
on  (a15.lev_1_key=a19.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c     a138
on  (a19.level1_manager_c_key=a138.level1_manager_c_key)
union
select     'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_organization_group     a14
on  (a11.assignment_group_key=a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on  (a14.row_dn_key=a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a110
on  (a15.lev_1_key=a110.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c     a139
on  (a110.level1_vp_c_key=a139.level1_vp_c_key)
union
select     'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_calendar_date     a18
on  (a11.opened_on_key=a18.row_key)
join ldb.d_calendar_quarter     a140
on  (a18.quarter_start_date_key=a140.row_key)
union
select     'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_calendar_date     a18
on  (a11.opened_on_key=a18.row_key)
join ldb.d_calendar_year     a141
on  (a18.year_start_date_key=a141.row_key)

)a
)b




