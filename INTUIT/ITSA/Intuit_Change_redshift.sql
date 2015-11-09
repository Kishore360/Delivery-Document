SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_department         a12
on (a11.requested_by_department_key = a12.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact         a13
on (a11.opened_by_key = a13.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_configuration_item         a14
on (a11.configuration_item_key = a14.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1         a17
on (a16.user_group_classification_level1 = a17.user_group_level1_key)
union
select 'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request         a18
on (a11.change_request_key = a18.row_key)
union
select 'ldb.d_internal_contact_requested_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_requested_by         a19
on (a11.requested_by_key = a19.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_calendar_date         a110
on (a11.opened_on_key = a110.row_key)
union
select 'ldb.d_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_approval         a111
on (a11.approval_state_src_key = a111.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_organization_group         a112
on (a11.assignment_group_key = a112.row_key)
union
select 'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_category         a113
on (a11.category_src_key = a113.row_key)
union
select 'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_reason         a114
on (a11.reason_src_key = a114.row_key)
union
select 'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_state         a115
on (a11.state_src_key = a115.row_key)
union
select 'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_review_status         a116
on (a11.review_status_src_key = a116.row_key)
union
select 'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_risk         a117
on (a11.risk_src_key = a117.row_key)
union
select 'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_scope         a118
on (a11.scope_src_key = a118.row_key)
union
select 'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_type         a119
on (a11.type_src_key = a119.row_key)
union
select 'ldb.d_change_request_u_completion_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_u_completion_code_c         a120
on (a11.completion_src_c_key = a120.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11
 join ldb.d_internal_contact         a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm         a121
on (a13.row_current_key = a121.row_current_key)
union
select 'ldb.d_internal_contact_client_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_client_c         a122
on (a11.client_c_key = a122.row_key)
union
select 'ldb.d_internal_contact_qa_approver_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_internal_contact_qa_approver_c         a123
on (a11.qa_approver_c_key = a123.row_key)
union
select 'ldb.d_change_request_u_sub_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_change_request_u_sub_category_c         a124
on (a11.sub_category_src_c_key = a124.row_key)
union
select 'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_impact         a125
on (a11.impact_src_key = a125.row_key)
union
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_location         a126
on (a11.location_key = a126.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_priority         a127
on (a11.priority_src_key = a127.row_key)
union
select 'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_contacttype         a128
on (a11.reported_type_src_key = a128.row_key)
union
select 'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
join ldb.d_task_urgency         a129
on (a11.urgency_src_key = a129.row_key)
union
select 'ldb.d_internal_organization_group_change_request_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_configuration_item         a14
on (a11.configuration_item_key = a14.row_key)
join ldb.d_internal_organization_group_change_request_c         a130
on (a14.change_control_c_key = a130.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
join ldb.d_internal_contact_manager_c         a131
on (a15.manager_c_key = a131.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_calendar_date         a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_month         a132
on (a110.month_start_date_key = a132.row_key)
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_calendar_date         a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_quarter         a133
on (a110.quarter_start_date_key = a133.row_key)
union
select 'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request             a11 
 join ldb.d_calendar_date         a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_year         a134
on (a110.year_start_date_key = a134.row_key)
)a
)b



