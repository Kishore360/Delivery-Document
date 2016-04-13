select 'f_problem_task' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11
union
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11
                join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
union
select 'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_calendar_date      a13
                  on         (a11.opened_on_key = a13.row_key)
union
select 'd_problem_task' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_problem_task       a14
                  on         (a11.problem_task_key = a14.row_key)
union
select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_internal_contact  a15
                  on         (a11.assigned_to_key = a15.row_key)
union
select 'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_internal_organization_group         a16
                  on         (a11.assignment_group_key = a16.row_key)
union
select 'd_internal_contact_problem_task_closed_by_c' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_internal_contact_problem_task_closed_by_c       a17
                  on         (a11.closed_by_key = a17.row_key)
union
select 'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_configuration_item            a18
                  on         (a11.configuration_item_key = a18.row_key)
union
select 'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11	
        join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)			  
                join        ldb.d_internal_contact_mdm    a19
                  on         (a12.row_current_key = a19.row_current_key)
union
select 'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11	
                join        ldb.d_calendar_date      a13
                  on         (a11.opened_on_key = a13.row_key)			  
                join        ldb.d_calendar_month a110
                  on         (a13.month_start_date_key = a110.row_key)
union
select 'd_lov_problem_task_priority_c' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_lov_problem_task_priority_c        a111
                  on         (a11.priority_src_key = a111.row_key)
union
select 'd_task' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_task           a112
                  on         (a11.parent_c_key = a112.row_key)
union
select 'd_lov_problem_task_state_c' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_lov_problem_task_state_c            a113
                  on         (a11.state_src_key = a113.row_key)
union
select 'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_task_contacttype                a114
                  on         (a11.reported_type_src_key = a114.row_key)
union
select 'd_lov_problem_task_type_c' as Table_Name, count(a11.row_key) Row_Count
from      ldb.f_problem_task        a11				  
                join        ldb.d_lov_problem_task_type_c             a115
                  on         (a11.problem_task_type_c_key = a115.row_key)


