SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_master_item         a13
on (a11.catalog_item_key = a13.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_internal_contact         a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.dh_user_group_classification_hierarchy         a15
on (a11.assignment_group_key = a15.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.dh_user_group_classification_hierarchy         a15
on (a11.assignment_group_key = a15.user_group_key)
left outer join ldb.dh_user_group_classification_hierarchy_level1         a16
on (a15.user_group_classification_level1 = a16.user_group_level1_key)
union
select 'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request_item         a17
on (a11.request_item_key = a17.row_key)
union
select 'ldb.d_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_calendar_date_closed         a18
on (a11.closed_on_key = a18.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_calendar_date         a19
on (a11.opened_on_key = a19.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_internal_organization_group         a110
on (a11.assignment_group_key = a110.row_key)
union
select 'ldb.d_task_contacttype_req_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_task_contacttype_req_item_c         a111
on (a11.reported_type_src_c_key = a111.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
left outer join ldb.d_internal_contact_mdm         a112
on (a12.row_current_key = a112.row_current_key)
union
select 'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request         a113
on (a11.request_key = a113.row_key)
union
select 'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request_item_stage         a114
on (a11.stage_src_key = a114.row_key)
union
select 'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_request_item_state         a115
on (a11.state_src_key = a115.row_key)
union
select 'ldb.d_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_internal_contact_requested_for         a116
on (a11.requested_for_key = a116.row_key)
union
select 'ldb.d_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_task_approval         a117
on (a11.approval_state_src_key = a117.row_key)
union
select 'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join ldb.d_internal_contact_task_closed_by         a118
on (a11.closed_by_key = a118.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.d_internal_contact         a14
on (a11.assigned_to_key = a14.row_key)
left outer join ldb.d_internal_contact_manager_c         a119
on (a14.manager_c_key = a119.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.d_calendar_date         a19
on (a11.opened_on_key = a19.row_key)
left outer join ldb.d_calendar_month         a120
on (a19.month_start_date_key = a120.row_key)
union
select 'ldb.d_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join ldb.d_calendar_date_closed         a18
on (a11.closed_on_key = a18.row_key)
left outer join ldb.d_calendar_month_closed         a121
on (a18.month_start_date_key = a121.row_key)
)a
)b