SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
cross join ldb.d_task_contacttype         a12
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_calendar_date         a13
on (a11.opened_on_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 join ldb.d_calendar_date         a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month         a14
on (a13.month_start_date_key = a14.row_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
   join        ldb.d_internal_organization_department           a12
                  on         (a11.opened_by_department_key = a12.row_key)
				   union
				    select'd_calendar_date_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				   join        ldb.d_calendar_date_closed     a14
                  on         (a11.closed_on_key = a14.row_key)
				  union
				  select'd_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_request_task        a16
                  on         (a11.request_task_key = a16.row_key)
				 				  union
				  select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_internal_contact a18
                  on         (a11.assigned_to_key = a18.row_key)
				  union
				  select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_internal_organization_group       a19
                  on         (a11.assignment_group_key = a19.row_key)
				  union
				  select'd_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
                join        ldb.d_request_item      a110
                  on         (a11.request_item_key = a110.row_key)
				  union
				  select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
                join        ldb.d_task_priority        a111
                  on         (a11.priority_src_key = a111.row_key)
				  union
				  select'd_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
                join        ldb.d_task_state             a112
                  on         (a11.state_src_key = a112.row_key)
				  union
				  select'd_calendar_month_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_calendar_date_closed     a14
                  on         (a11.closed_on_key = a14.row_key)
				   join        ldb.d_calendar_month_closed a114
                  on         (a14.month_start_date_key = a114.row_key)

				  
				  
				  
)a
)b

