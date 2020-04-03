select 'ldb.f_change_request_state_activity' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_calendar_date       a12
on (a11.state_on_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request       a15
on (a11.change_request_key = a15.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11
 join ldb.d_calendar_date       a12
on (a11.state_on_key = a12.row_key)
join ldb.d_calendar_month       a16
on (a12.month_start_date_key = a16.row_key)
union
select'ldb.d_change_request_from_state' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_from_state       a17
on (a11.from_state_key = a17.row_key)
union
select'ldb.d_change_request_priority' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_priority       a18
on (a11.priority_src_key = a18.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_risk       a19
on (a11.change_risk_key = a19.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_state       a110
on (a11.current_state_key = a110.row_key)
union
select'ldb.d_change_request_to_state' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_to_state       a111
on (a11.to_state_key = a111.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_change_request_type       a112
on (a11.change_type_key = a112.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.change_request_key) Row_Count
 from  ldb.f_change_request_state_activity       a11 
join ldb.d_configuration_item       a113
on (a11.configuration_item_key = a113.row_key)


