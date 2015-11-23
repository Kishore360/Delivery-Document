 select'f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
-----dropping of records for closed on key
 select'd_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_calendar_date_closed         a13
on (a11.closed_on_key = a13.row_key)
union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
left outer join  ldb.d_calendar_month         a14
on (a12.month_start_date_key = a14.row_key)
union
-----dropping of records for closed on key
select'd_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_calendar_date_closed         a13
on (a11.closed_on_key = a13.row_key)
left outer join  ldb.d_calendar_month_closed         a15
on (a13.month_start_date_key = a15.row_key)
union
 select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_internal_contact         a16
on (a11.opened_by_key = a16.row_key)
left outer join  ldb.d_internal_contact_mdm         a17
on (a16.row_current_key = a17.row_current_key)
union
select'd_internal_contact_requested_for' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_internal_contact_requested_for         a18
on (a11.requested_for_key = a18.row_key)
union
select'd_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_internal_contact_task_closed_by         a19
on (a11.closed_by_key = a19.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_internal_organization_group         a110
on (a11.assignment_group_key = a110.row_key)
union
select'd_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_master_item         a111
on (a11.catalog_item_key = a111.row_key)
union
select'd_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_request         a112
on (a11.request_key = a112.row_key)
union
select'd_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_request_item         a113
on (a11.request_item_key = a113.row_key)
union
select'd_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_request_item_stage         a114
on (a11.stage_src_key = a114.row_key)
union
select'd_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_request_item_state         a115
on (a11.state_src_key = a115.row_key)
union
select'd_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 left outer join  ldb.d_task_approval         a115
on (a11.approval_state_src_key = a115.row_key)
union
 select'd_internal_contact_assigned' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
left outer join  ldb.d_internal_contact         a116
on (a11.assigned_to_key = a116.row_key)
