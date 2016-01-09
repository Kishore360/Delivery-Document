SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_contact       a14
on (a11.assigned_to_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group	       a15	on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem       a17
on (a11.problem_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_configuration_item       a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_date       a19
on (a11.opened_on_key = a19.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_change_request       a110
on (a11.change_request_key = a110.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_internal_organization_department       a111
on (a11.opened_by_department_key = a111.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 join ldb.d_internal_contact	       a12 on	(a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a112
on (a12.row_current_key = a112.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 join ldb.d_calendar_time	       a13	on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a113
on (a13.hour_24_format_num = a113.hour_24_format_num)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_problem_state       a114
on (a11.state_src_key = a114.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_impact       a115
on (a11.impact_src_key = a115.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_location       a116
on (a11.location_key = a116.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_priority       a117
on (a11.priority_src_key = a117.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_contacttype       a118
on (a11.reported_type_src_key = a118.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_task_urgency       a119
on (a11.urgency_src_key = a119.row_key)
union
select'ldb.d_location_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_contact	       a14	on(a11.assigned_to_key = a14.row_key)
join ldb.d_location_assigned_to       a120
on (a14.location_key = a120.row_key)
union
select'ldb.dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group	       a15	on (a11.assignment_group_key = a15.row_key)
 join ldb.dh_user_group_hierarchy	       a16	on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level1       a121
on (a16.lev_1_key = a121.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
join ldb.d_calendar_date	       a19	on (a11.opened_on_key = a19.row_key)
join ldb.d_calendar_month       a122
on (a19.month_start_date_key = a122.row_key)
union
select'ldb.dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group	       a15	on (a11.assignment_group_key = a15.row_key)
 join ldb.dh_user_group_hierarchy	       a16	on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level2       a123
on (a16.lev_2_key = a123.row_key)
union
select'ldb.dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group	       a15	on (a11.assignment_group_key = a15.row_key)
 join ldb.dh_user_group_hierarchy	       a16	on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level3       a124
on (a16.lev_3_key = a124.row_key)
union
select'ldb.dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem       a11 
 join ldb.d_internal_organization_group	       a15	on (a11.assignment_group_key = a15.row_key)
 join ldb.dh_user_group_hierarchy	       a16	on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level4       a125
on (a16.lev_4_key = a125.row_key)
)a)b
