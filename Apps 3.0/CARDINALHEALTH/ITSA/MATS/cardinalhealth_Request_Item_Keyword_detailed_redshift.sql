select'ldb.f_request_item_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_master_item         a14
on (a11.catalog_item_key=a14.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_request_item         a15
on (a11.request_item_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_calendar_date         a17
on (a11.opened_on_key=a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_internal_contact_assigned_to         a18
on (a11.assigned_to_key=a18.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_internal_organization_group         a19
on (a11.assignment_group_key=a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11
join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key) 
join ldb.d_internal_contact_mdm        a110
on (a13.row_current_key=a110.row_current_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_request        a111
on (a11.request_key=a111.row_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_sc_req_item_approval        a112
on (a11.approval_state_src_key=a112.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_request_item_stage        a113
on (a11.stage_src_key=a113.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_request_item_state        a114
on (a11.state_src_key=a114.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_keyword          a11 
join ldb.d_internal_contact_task_closed_by        a115
on (a11.closed_by_key=a115.row_key)


