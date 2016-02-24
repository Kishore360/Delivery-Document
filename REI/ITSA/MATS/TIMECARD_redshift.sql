select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
   join        ldb.d_internal_organization_department           a12
                  on         (a11.opened_by_department_key = a12.row_key)
				  union
				  select'd_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_master_item        a13
                  on         (a11.catalog_item_key = a13.row_key)
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
				  select'd_request_item_variable_requested_completion_date_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
				  join        ldb.d_request_item_variable_requested_completion_date_c                a17
                  on         (a11.request_item_key = a17.row_key)
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
union  
select  'd_portfolio_c 'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11  
join ldb.d_project_c b
on a11.project_key=b.row_key
join ldb.d_portfolio_c c
on b.portfolio_c_key=c.row_key
union  
select  'd_portfolio_owner_c 'as Table_Name,count(a11.row_key) Row_Count from ldb.f_time_entry 	a11
	join	ldb.d_project_c	a17
	  on 	(a11.project_key = a17.row_key)
	join	ldb.d_portfolio_c	a111
	  on 	(a17.portfolio_c_key = a111.row_key)
	join	ldb.d_portfolio_owner_c	a133
	  on 	(a111.portfolio_owner_key = a133.row_key)
