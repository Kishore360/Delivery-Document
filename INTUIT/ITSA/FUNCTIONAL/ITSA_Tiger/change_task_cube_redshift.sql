SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
 
 select 'f_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c    a11

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_calendar_date	a12
   on         (a11.opened_on_key = a12.row_key)

union

select  'd_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_change_task_c	a13
   on         (a11.change_request_key = a13.row_key)
   
 union

select  'd_change_task_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_change_task_state	a13
   on         (a11.state_src_key = a13.row_key)  

 union

select  'd_internal_contact_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_internal_contact_change_task_c	a12
   on         (a11.assigned_to_key = a12.row_key)

union

select  'd_configuration_item_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_configuration_item_change_task_c	a13
   on         (a11.configuration_item_key = a13.row_key)
   
union

select  'd_task_priority_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_task_priority_change_task_c	a12
   on         (a11.priority_src_key = a12.row_key)

union

select  'd_task_contacttype_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_task_contacttype_change_task_c	a13
   on         (a11.reported_type_src_key = a13.row_key)

 union

select  'd_internal_organization_group_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_internal_organization_group_change_task_c	a12
   on         (a11.assignment_group_key = a12.row_key)

union

select  'd_task_impact_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_task_impact_change_task_c	a13
   on         (a11.impact_src_key = a13.row_key)   
   
   
union

select  'd_task_urgency_change_task_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_change_task_c     a11
   join        ldb.d_task_urgency_change_task_c	a12
   on         (a11.urgency_src_key = a12.row_key)

union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
ldb.f_change_task_c     a11
   join        ldb.d_calendar_date	a12
   on         (a11.opened_on_key = a12.row_key)
  join        ldb.d_calendar_month	a13
   on         (a12.month_start_date_key = a13.row_key)

 union

select  'd_calendar_week' as Table_Name,count(a11.row_key) Row_Count
ldb.f_change_task_c     a11
   join        ldb.d_calendar_date	a12
   on         (a11.opened_on_key = a12.row_key)
  join        ldb.d_calendar_week	a13
   on         (a12.week_start_date_key = a13.row_key)
   
   union

select  'd_calendar_quarter' as Table_Name,count(a11.row_key) Row_Count
ldb.f_change_task_c     a11
   join        ldb.d_calendar_date	a12
   on         (a11.opened_on_key = a12.row_key)
  join        ldb.d_calendar_quarter	a13
   on         (a12.quarter_start_date_key = a13.row_key)

 union

select  'd_calendar_year' as Table_Name,count(a11.row_key) Row_Count
ldb.f_change_task_c     a11
   join        ldb.d_calendar_date	a12
   on         (a11.opened_on_key = a12.row_key)
  join        ldb.d_calendar_year	a13
   on         (a12.year_start_date_key = a13.row_key)
  
  )