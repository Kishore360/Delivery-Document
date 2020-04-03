select 'ldb.f_request_item_activity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_internal_contact       a13
on (a11.employee_key=a13.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key=a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key=a15.row_key)
union
select'ldb.d_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item       a16
on (a11.request_item_key=a16.row_key)
union
select'ldb.d_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request       a17
on (a11.request_key=a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month       a18
on (a12.month_start_date_key=a18.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key=a19.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
 join ldb.d_internal_contact       a13
on (a11.employee_key=a13.row_key)
join ldb.d_internal_organization_department       a110
on (a13.department_key=a110.row_key)
union
select'ldb.d_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_master_item       a111
on (a11.item_key=a111.row_key)
union
select'ldb.d_request_item_from_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_from_stage       a112
on (a11.from_stage_key=a112.row_key)
union
select'ldb.d_request_item_from_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_from_state       a113
on (a11.from_state_key=a113.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_sc_req_item_priority       a114
on (a11.priority_src_key=a114.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_stage       a115
on (a11.current_stage_src_key=a115.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_state       a116
on (a11.current_state_src_key=a116.row_key)
union
select'ldb.d_request_item_to_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_to_stage       a117
on (a11.to_stage_key=a117.row_key)
union
select'ldb.d_request_item_to_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item_activity       a11 
join ldb.d_request_item_to_state       a118
on (a11.to_state_key=a118.row_key);



