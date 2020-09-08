select 'ldb.f_change_request_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
 union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
  join ldb.d_calendar_date a13 
 on (a12.month_start_date_key = a13.row_key) 
 union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) 
  union
select 'ldb.d_change_request_from_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request_from_state a12 
 on (a11.from_state_key = a12.row_key) 
   union
select 'ldb.d_change_request_priority a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request_priority a12 
 on (a11.priority_src_key = a12.row_key) 
    union
select 'ldb.d_change_request_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request_state a12 
 on (a11.current_state_key = a12.row_key) 
     union
select 'ldb.d_change_request_to_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request_to_state a12 
 on (a11.to_state_key = a12.row_key) 
      union
select 'ldb.d_change_request_type a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_change_request_type a12 
 on (a11.change_type_key = a12.row_key) 
       union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
        union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
 on (a11.assigned_to_key = a12.row_key) 
         union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_request_state_activity a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 