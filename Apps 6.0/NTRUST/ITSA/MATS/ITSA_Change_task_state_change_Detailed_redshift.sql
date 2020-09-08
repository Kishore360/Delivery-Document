select 'ldb.f_change_task_state_activity a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
 union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key)
  join ldb.d_calendar_month a13
 on (a12.month_start_date_key = a13.row_key)
 union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_change_request a12 
 on (a11.change_request_key = a12.row_key) 
  union
select 'ldb.d_change_request_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_change_request_state a12 
 on (a11.parent_state_key = a12.row_key) 
   union
select 'ldb.d_change_task a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
    union
select 'ldb.d_change_task_approval a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_approval a13 
 on (a12.approval_src_key = a13.row_key) 
    union
select 'ldb.d_change_task_from_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_change_task_from_state a12 
 on (a11.from_state_key = a12.row_key) 
     union
select 'ldb.d_change_task_impact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_impact a13 
 on (a12.impact_src_key = a13.row_key) 
      union
select 'ldb.d_change_task_priority a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_priority a13 
 on (a12.priority_src_key = a13.row_key)
       union
select 'ldb.d_change_task_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_state a13 
 on (a12.state_src_key = a13.row_key)
     union
select 'ldb.d_change_task_task_type a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_task_type a13 
 on (a12.task_type_src_key = a13.row_key)
      union
select 'ldb.d_change_task_task_type a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_task_type a13 
 on (a12.task_type_src_key = a13.row_key)
    union
select 'ldb.d_change_task_to_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_change_task_to_state a12 
 on (a11.to_state_key = a12.row_key) 
       union
select 'ldb.d_change_task_upon_approval a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_upon_approval a13 
 on (a12.upon_approval_src_key = a13.row_key)
        union
select 'ldb.d_change_task_upon_reject a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11
  join ldb.d_change_task a12 
 on (a11.change_task_key = a12.row_key) 
 join ldb.d_change_task_upon_reject a13 
 on (a12.upon_reject_src_key = a13.row_key)
     union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
 on (a11.assigned_to_key = a12.row_key)      
 union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_change_task_state_activity a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
