SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
union
select 'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_organization_legalentity         a12
on (a11.company_key = a12.row_key)
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_organization_department         a13
on (a11.opened_by_department_key = a13.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_contact         a14
on (a11.opened_by_key = a14.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
 join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1         a17
on (a16.user_group_classification_level1 = a17.user_group_level1_key)
union
select 'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.dh_assignment_group_tier_hierarchy         a18
on (a11.assignment_group_key = a18.user_group_tier_key)
union
select 'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.dh_assignment_group_type_hierarchy         a19
on (a11.assignment_group_key = a19.user_group_type_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_configuration_item         a110
on (a11.incident_configuration_item_key = a110.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_calendar_date         a111
on (a11.opened_on_key = a111.row_key)
union
select 'ldb.d_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_incident_task_c         a112
on (a11.incident_task_key = a112.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_organization_group         a113
on (a11.assignment_group_key = a113.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_configuration_item         a114
on (a11.business_service_key = a114.row_key)
union
select 'ldb.d_task_contacttype_req_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_task_contacttype_req_item_c         a115
on (a11.reported_type_src_c_key = a115.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11
 join ldb.d_internal_contact         a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm         a116
on (a14.row_current_key = a116.row_current_key)
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_incident         a117
on (a11.incident_key = a117.row_key)
union
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_incident_close_code         a118
on (a11.close_code_src_key = a118.row_key)
union
select 'ldb.d_incident_task_pending_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_incident_task_pending_code_c         a119
on (a11.pending_code_src_key = a119.row_key)
union
select 'ldb.d_incident_task_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_incident_task_state_c         a120
on (a11.state_src_key = a120.row_key)
union
select 'ldb.d_internal_contact_opened_by_key_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_internal_contact_opened_by_key_c         a121
on (a11.opened_by_c_key = a121.row_key)
union
select 'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_task_impact         a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_task_priority         a123
on (a11.priority_src_key = a123.row_key)
union
select 'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
join ldb.d_task_urgency         a124
on (a11.urgency_src_key = a124.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
 join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
join ldb.d_internal_contact_manager_c         a125
on (a15.manager_c_key = a125.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
 join ldb.d_calendar_date         a111
on (a11.opened_on_key = a111.row_key)
join ldb.d_calendar_month         a126
on (a111.month_start_date_key = a126.row_key)
union
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11
 join ldb.d_calendar_date         a111
on (a11.opened_on_key = a111.row_key)
join ldb.d_calendar_week         a127
on (a111.week_start_date_key = a127.row_key)
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_c             a11 
 join ldb.d_calendar_date         a111
on (a11.opened_on_key = a111.row_key)
join ldb.d_calendar_quarter         a128
on (a111.quarter_start_date_key = a128.row_key)
)a
)b



