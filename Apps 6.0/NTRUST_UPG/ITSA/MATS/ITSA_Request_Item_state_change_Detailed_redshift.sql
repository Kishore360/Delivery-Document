select 'ldb.f_request_item_activity a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
 union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
  join ldb.d_calendar_month a13 
 on (a12.month_start_date_key = a13.row_key) 
 union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request_item a12 
 on (a11.request_item_key = a12.row_key) 
  union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
   union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11
  join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_organization_department a13
 on (a12.department_key = a13.row_key) 
  union
select 'ldb.d_master_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_master_item a12 
 on (a11.item_key = a12.row_key) 
  union
select 'ldb.d_request a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request a12 
 on (a11.request_key = a12.row_key) 
  union
select 'ldb.d_request_item_from_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request_item_from_state a12 
 on (a11.from_state_key = a12.row_key) 
   union
select 'ldb.d_request_item_from_stage a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request_item_from_stage a12 
 on (a11.from_stage_key = a12.row_key) 
   union
select 'ldb.d_sc_req_item_priority a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
  join ldb.d_sc_req_item_priority a12 
 on (a11.priority_src_key = a12.row_key) 

    union
select 'ldb.d_request_item_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11
 join ldb.d_request_item_state a13
 on (a11.current_state_src_key = a13.row_key) 
     union
select 'ldb.d_request_item_stage a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11
 join ldb.d_request_item_stage a13
 on (a11.current_stage_src_key = a13.row_key) 
     union
select 'ldb.d_request_item_to_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request_item_to_state a12 
 on (a11.to_state_key = a12.row_key) 
      union
select 'ldb.d_request_item_to_stage a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_request_item_to_stage a12 
 on (a11.to_stage_key = a12.row_key) 
       union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
        union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_internal_contact_assigned_to a12 
 on (a11.assigned_to_key = a12.row_key) 
         union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item_activity a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
        