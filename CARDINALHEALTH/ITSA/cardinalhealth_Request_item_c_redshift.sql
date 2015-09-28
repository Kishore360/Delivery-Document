SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
union
select  'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_master_item           a12
on (a11.catalog_item_key = a12.row_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact           a13
on (a11.opened_by_key = a13.row_key)
union
select  'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_assignment_group_level0_manager_c_relation           a14
on (a11.assignment_group_key = a14.level0_assigment_group_key)
union
select  'ldb.d_assignment_group_level0_vp_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_assignment_group_level0_vp_c_relation           a15
on (a11.assignment_group_key = a15.level0_assigment_group_key)
union
select  'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item           a16
on (a11.request_item_key = a16.row_key)
union
select  'ldb.d_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_calendar_date_closed           a17
on (a11.closed_on_key = a17.row_key)
union
select  'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_calendar_date           a18
on (a11.opened_on_key = a18.row_key)
union
select  'ldb.d_internal_contact_application_owner_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_master_item           a12
on (a11.catalog_item_key = a12.row_key)
join ldb.d_internal_contact_application_owner_ri_c           a19
on (a12.application_owner_c_key = a19.row_key)
union
select  'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact           a110
on (a11.assigned_to_key = a110.row_key)
union
select  'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_organization_group           a111
on (a11.assignment_group_key = a111.row_key)
union
select  'ldb.d_request_item_lov_catalog_item_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_lov_catalog_item_c           a112
on (a11.catalog_item_c_key = a112.row_key)
union
select  'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_internal_contact           a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm           a113
on (a13.row_current_key = a113.row_current_key)
union
select  'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request           a114
on (a11.request_key = a114.row_key)
union
select  'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_stage           a115
on (a11.stage_src_key = a115.row_key)
union
select  'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_request_item_state           a116
on (a11.state_src_key = a116.row_key)
union
select  'ldb.d_internal_contact_requested_for_ri_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact_requested_for_ri_c           a117
on (a11.requested_for_ri_c_key = a117.row_key)
union
select  'ldb.d_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_task_approval           a118
on (a11.approval_state_src_key = a118.row_key)
union
select  'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
join ldb.d_internal_contact_task_closed_by           a119
on (a11.closed_by_key = a119.row_key)
union
select  'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_assignment_group_level0_manager_c_relation           a14
on (a11.assignment_group_key = a14.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c           a120
on (a14.level0_manager_c_key = a120.level0_manager_c_key)
union
select  'ldb.d_assignment_group_level0_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_assignment_group_level0_vp_c_relation           a15
on (a11.assignment_group_key = a15.level0_assigment_group_key)
join ldb.d_assignment_group_level0_vp_c           a121
on (a15.level0_vp_c_key = a121.level0_vp_c_key)
union
select  'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_calendar_date           a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month           a122
on (a18.month_start_date_key = a122.row_key)
union
select  'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11
 join ldb.d_calendar_date           a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week           a123
on (a18.week_start_date_key = a123.row_key)
union
select  'ldb.d_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_calendar_date_closed           a17
on (a11.closed_on_key = a17.row_key)
join ldb.d_calendar_month_closed           a124
on (a17.month_start_date_key = a124.row_key)
union
select  'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_calendar_date           a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter           a125
on (a18.quarter_start_date_key = a125.row_key)
union
select  'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join ldb.d_calendar_date           a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year           a126
on (a18.year_start_date_key = a126.row_key)
)a
)b





