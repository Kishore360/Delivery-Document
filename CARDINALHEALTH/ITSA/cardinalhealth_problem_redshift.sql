SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select     'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact     a12
on (a11.opened_by_key = a12.row_key)
union
select     'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_time     a13
on (a11.opened_time_key = a13.row_key)
union
select     'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
union
select     'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
 join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
union
select     'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_assignment_group_level0_manager_c_relation     a16
on (a11.assignment_group_key = a16.level0_assigment_group_key)
union
select     'ldb.d_assignment_group_level0_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_assignment_group_level0_vp_c_relation     a17
on (a11.assignment_group_key = a17.level0_assigment_group_key)
union
select     'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem     a18
on (a11.problem_key = a18.row_key)
union
select     'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date     a19
on (a11.opened_on_key = a19.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
  join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a110
on (a15.lev_1_key = a110.level1_assigment_group_key)
union
select     'ldb.d_assignment_group_level1_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
  join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a111
on (a15.lev_1_key = a111.level1_assigment_group_key)
union
select     'ldb.d_configuation_item_affected_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuation_item_affected_ci_c     a112
on (a11.affected_configuration_item_c_key = a112.row_key)
union
select     'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact     a113
on (a11.assigned_to_key = a113.row_key)
union
select     'ldb.d_lov_problem_complexity_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_lov_problem_complexity_c     a114
on (a11.complexity_src_c_key = a114.row_key)
union
select     'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item     a115
on (a11.configuration_item_key = a115.row_key)
union
select     'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_internal_contact     a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm     a116
on (a12.row_current_key = a116.row_current_key)
union
select     'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_time     a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour     a117
on (a13.hour_24_format_num = a117.hour_24_format_num)
union
select     'ldb.d_lov_known_error_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_lov_known_error_status_c     a118
on (a11.known_error_status_c_key = a118.row_key)
union
select     'ldb.d_internal_contact_problem_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact_problem_manager_c     a119
on (a11.problem_manager_c_key = a119.row_key)
union
select     'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_state     a120
on (a11.state_src_key = a120.row_key)
union
select     'ldb.d_internal_contact_requested_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact_requested_for_c     a121
on (a11.requested_for_c_key = a121.row_key)
union
select     'ldb.d_lov_problem_business_segment_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_lov_problem_business_segment_c     a122
on (a11.root_cause_business_segment_c_key = a122.row_key)
union
select     'ldb.d_change_request_caused_change_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_change_request_caused_change_c     a123
on (a11.caused_by_change_c_key = a123.row_key)
union
select     'ldb.d_change_request_rfc_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_change_request_rfc_c     a124
on (a11.rfc_c_key = a124.row_key)
union
select     'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_priority     a125
on (a11.priority_src_key = a125.row_key)
union
select     'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_contacttype     a126
on (a11.reported_type_src_key = a126.row_key)
union
select     'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_urgency     a127
on (a11.urgency_src_key = a127.row_key)
union
select     'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11
 join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.dh_user_group_level1     a128
on (a15.lev_1_key = a128.row_key)
union
select     'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_assignment_group_level0_manager_c_relation     a16
on (a11.assignment_group_key = a16.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c     a129
on (a16.level0_manager_c_key = a129.level0_manager_c_key)
union
select     'ldb.d_assignment_group_level0_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_assignment_group_level0_vp_c_relation     a17
on (a11.assignment_group_key = a17.level0_assigment_group_key) 	
join ldb.d_assignment_group_level0_vp_c     a130
on (a17.level0_vp_c_key = a130.level0_vp_c_key)
union
select     'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date     a19
on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_month     a131
on (a19.month_start_date_key = a131.row_key)
union
select     'ldb.d_assignment_group_level1_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_manager_c_relation     a110
on (a15.lev_1_key = a110.level1_assigment_group_key)
join ldb.d_assignment_group_level1_manager_c     a132
on (a110.level1_manager_c_key = a132.level1_manager_c_key)
union
select     'ldb.d_assignment_group_level1_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
  join ldb.d_internal_organization_group     a14
on (a11.assignment_group_key = a14.row_key)
join ldb.dh_user_group_hierarchy     a15
on (a14.row_dn_key = a15.lev_0_key)
join ldb.d_assignment_group_level1_vp_c_relation     a111
on (a15.lev_1_key = a111.level1_assigment_group_key)
join ldb.d_assignment_group_level1_vp_c     a133
on (a111.level1_vp_c_key = a133.level1_vp_c_key)
)a
)b







