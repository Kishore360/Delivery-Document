select 'ldb.f_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
 union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_calendar_date a12 
 on (a11.date_key = a12.row_key) 
  join ldb.d_calendar_month a13 
 on (a12.month_start_date_key = a13.row_key) 
 union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_incident a12 
 on (a11.incident_key = a12.row_key) 
  union
select 'ldb.d_incident_state_from a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_incident_state_from a12 
 on (a11.from_state_src_key = a12.row_key) 
   union
select 'ldb.d_incident_priority a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
  join ldb.d_incident a12 
 on (a11.incident_key = a12.row_key) 
 join ldb.d_incident_priority a13
 on (a12.priority_src_key = a13.row_key) 
    union
select 'ldb.d_incident_state a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11
   join ldb.d_incident a12 
 on (a11.incident_key = a12.row_key)
 join ldb.d_incident_state a13
 on (a12.state_src_key = a13.row_key) 
     union
select 'ldb.d_incident_state_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_incident_state_to a12 
 on (a11.to_state_src_key = a12.row_key) 
       union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_configuration_item a12 
 on (a11.configuration_item_key = a12.row_key) 
        union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_internal_contact_assigned_to a12 
 on (a11.assigned_to_key = a12.row_key) 
         union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
          union
select 'ldb.d_parent_incident a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_state a11
  join ldb.d_incident a12 
 on (a11.incident_key = a12.row_key)
 join ldb.d_parent_incident a13 
 on (a12.parent_incident_key = a13.row_key) 