 select'f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
 union
 select'd_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_request_task         a122
on (a11.request_task_key = a122.row_key)
union
 select'd_request_task_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
 join ldb.d_request_task         a122
on (a11.request_task_key = a122.row_key)
join ldb.d_request_task_closure_code_c         a13
on (a122.closure_code_c_key = a13.row_key)
union
 select'd_request_task_hold_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
 join ldb.d_request_task         a122
on (a11.request_task_key = a122.row_key)
join ldb.d_request_task_hold_type_c         a13
on (a122.hold_type_c_key = a13.row_key)


union




select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_calendar_date                        a122
on (a11.opened_on_key = a122.row_key)
union
select'd_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
				  join ldb.d_calendar_date                        a1222
on (a11.opened_on_key = a1222.row_key)
join ldb.d_calendar_week                                     a122
on (a1222.week_start_date_key = a122.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
				  	  join ldb.d_calendar_date                        a1222
on (a11.opened_on_key = a1222.row_key)
join ldb.d_calendar_year                                                   a122
on (a1222.year_start_date_key = a122.row_key)
union
select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_internal_contact_assigned_to                                                         a122
on (a11.assigned_to_key  = a122.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_internal_organization_group                                                                 a122
on (a11.assignment_group_key   = a122.row_key)
union
select'd_internal_organization_department ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_internal_organization_department                                                          a122
on (a11.opened_by_department_key  = a122.row_key)



union
select'd_request_item ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_request_item                                                          a122
on (a11.request_item_key   = a122.row_key)


union
select'd_sc_task_priority  ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_sc_task_priority                                                           a122
on (a11.priority_src_key  = a122.row_key)






union
select'd_sc_task_state  ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
join ldb.d_sc_task_state                                                           a122
on (a11.state_src_key   = a122.row_key)

union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
     join          ldb.f_request_task_c_keyword              a12
                  on          (a11.request_task_key = a12.request_task_key)
				  	  join ldb.d_calendar_date                        a1222
on (a11.opened_on_key = a1222.row_key)
join ldb.d_calendar_month                                                   a122
on (a1222.month_start_date_key = a122.row_key)



