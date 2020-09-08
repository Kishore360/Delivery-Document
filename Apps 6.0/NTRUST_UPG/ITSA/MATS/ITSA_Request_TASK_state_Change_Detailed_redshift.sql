select 'ldb.f_request_task_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
 union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
  join ldb.d_calendar_month a13 
 on (a12.month_start_date_key = a13.row_key)   
  union
select 'ldb.d_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request a12 
 on (a11.request_key = a12.row_key) 
   union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_item a12 
 on (a11.request_item_key = a12.row_key) 
    union
select 'ldb.d_request_task a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_request_task a12 
 on (a11.request_task_key = a12.row_key) 
  union
select 'ldb.d_sc_task_from_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_from_state a12 
 on (a11.from_state_key = a12.row_key) 
   union
select 'ldb.d_sc_task_approval a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_approval a12 
 on (a11.approval_state_src_key = a12.row_key) 
   union
select 'ldb.d_sc_task_priority a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
  join ldb.d_sc_task_priority a12 
 on (a11.priority_src_key = a12.row_key) 

    union
select 'ldb.d_request_item_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11
 join ldb.d_request_item_state a13
 on (a11.current_request_item_state_key = a13.row_key) 
     union
select 'ldb.d_request_item_stage a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11
 join ldb.d_request_item_stage a13
 on (a11.current_request_item_stage_key = a13.row_key) 
  union
select 'ldb.d_sc_task_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11
 join ldb.d_sc_task_state a13
 on (a11.current_request_task_state_key = a13.row_key) 
     union
select 'ldb.d_sc_task_to_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_to_state a12 
 on (a11.to_state_key = a12.row_key) 
      union
select 'ldb.d_sc_task_upon_approval a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_sc_task_upon_approval a12 
 on (a11.upon_approval_src_key = a12.row_key) 
       union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
        union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
 on (a11.assigned_to_key = a12.row_key) 
         union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_task_state_activity a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
        