SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_request_item_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
union
select'ldb.f_request_task_keyword_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.f_request_task_keyword_c         a12
on (a11.assigned_to_key=a12.assigned_to_key and a11.assignment_group_key=a12.assignment_group_key and
a11.closed_on_key=a12.closed_on_key and a11.opened_by_key=a12.opened_by_key and a11.opened_on_key=a12.opened_on_key and
a11.priority_src_key=a12.priority_src_key and a11.request_task_key=a12.request_task_key and
a11.ritm_catalog_item_key=a12.ritm_catalog_item_key and a11.ritm_closed_by_key=a12.closed_by_key and
a11.ritm_opened_by_key=a12.opened_by_key and a11.ritm_request_item_key=a12.request_item_key and
a11.ritm_request_key=a12.request_key and a11.state_src_key=a12.state_src_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_calendar_date         a13
on (a11.ritm_opened_on_key=a13.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_master_item         a14
on (a11.ritm_catalog_item_key=a14.row_key)
union
select'ldb.d_internal_contact_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_internal_contact_rt_c         a15
on (a11.opened_by_key=a15.row_key)
union
select'ldb.d_calendar_date_closed_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_calendar_date_closed_rt_c         a16
on (a11.closed_on_key=a16.row_key)
union
select'ldb.d_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_request_task         a17
on (a11.request_task_key=a17.row_key)
union
select'ldb.d_calendar_date_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_calendar_date_rt_c         a18
on (a11.opened_on_key=a18.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_internal_organization_group         a19
on (a11.assignment_group_key=a19.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_request         a110
on (a11.ritm_request_key=a110.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_request_item         a111
on (a11.ritm_request_item_key=a111.row_key)
union
select'ldb.d_internal_contact_assign_to_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_internal_contact_assign_to_rt_c         a112
on (a11.assigned_to_key=a112.row_key)
union
select'ldb.d_internal_contact_mdm_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_internal_contact_rt_c         a15
on (a11.opened_by_key=a15.row_key) 
join ldb.d_internal_contact_mdm_rt_c         a113
on (a15.row_current_key=a113.row_current_key)
union
select'ldb.d_sc_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_sc_task_priority         a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_sc_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_sc_task_state         a115
on (a11.state_src_key=a115.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11 
join ldb.d_internal_contact_task_closed_by         a116
on (a11.ritm_closed_by_key=a116.row_key)
union
select'ldb.d_calendar_week_closed_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_closed_rt_c         a16
on (a11.closed_on_key=a16.row_key) 
join ldb.d_calendar_week_closed_rt_c         a117
on (a16.week_start_date_key=a117.row_key)
union
select'ldb.d_calendar_week_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_rt_c         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_week_rt_c         a118
on (a18.week_start_date_key=a118.row_key)
union
select'ldb.d_calendar_month_closed_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_closed_rt_c         a16
on (a11.closed_on_key=a16.row_key) 
join ldb.d_calendar_month_closed_rt_c         a119
on (a16.month_start_date_key=a119.row_key)
union
select'ldb.d_calendar_month_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_rt_c         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_month_rt_c         a120
on (a18.month_start_date_key=a120.row_key)
union
select'ldb.d_calendar_quarter_closed_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_closed_rt_c         a16
on (a11.closed_on_key=a16.row_key) 
join ldb.d_calendar_quarter_closed_rt_c         a121
on (a16.quarter_start_date_key=a121.row_key)
union
select'ldb.d_calendar_quarter_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_rt_c         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_quarter_rt_c         a122
on (a18.quarter_start_date_key=a122.row_key)
union
select'ldb.d_calendar_year_closed_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_closed_rt_c         a16
on (a11.closed_on_key=a16.row_key) 
join ldb.d_calendar_year_closed_rt_c         a123
on (a16.year_start_date_key=a123.row_key)
union
select'ldb.d_calendar_year_rt_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_task_c             a11
join ldb.d_calendar_date_rt_c         a18
on (a11.opened_on_key=a18.row_key) 
join ldb.d_calendar_year_rt_c         a124
on (a18.year_start_date_key=a124.row_key)
)A
)B