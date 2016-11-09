select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_calendar_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join          ldb.d_calendar_date               a12
                  on          (a11.assigned_on_key = a12.row_key)
				  union
select 'ldb.d_calendar_month a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join          ldb.d_calendar_date               a12
                  on          (a11.assigned_on_key = a12.row_key)
				    join          ldb.d_calendar_month            a13
                  on          (a12.month_start_date_key = a13.row_key)
				  union
				  select 'ldb.d_calendar_week a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
  join          ldb.d_calendar_date               a14
                  on          (a11.assigned_on_key = a14.row_key)
                join          ldb.d_calendar_week             a15
                  on          (a14.week_start_date_key = a15.row_key)
				   union
				  select 'ldb.d_calendar_year a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
  join          ldb.d_calendar_date               a14
                  on          (a11.assigned_on_key = a14.row_key)
 join          ldb.d_calendar_year              a16
                  on          (a14.year_start_date_key = a16.row_key)
				   union
				  select 'ldb.d_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
 join          ldb.d_incident         a13
                  on          (a11.incident_key = a13.row_key)
				   union
				  select 'ldb.d_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
 join          ldb.d_incident         a13
                  on          (a11.incident_key = a13.row_key)		  		  
				    join          ldb.d_incident_state               a113
                  on          (a13.state_src_key = a113.row_key)
				  
				  union
				  select 'ldb.d_internal_contact_from a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
 join          ldb.d_internal_contact_from  a110
                  on          (a11.from_assigned_to_key = a110.row_key)
				  union
				   select 'ldb.d_internal_contact_priority_assignment_user_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
 join          ldb.d_incident         a13
                  on          (a11.incident_key = a13.row_key)
 
				  join          ldb.d_internal_contact_priority_assignment_user_c            a115
                  on          (a13.priority_change_by_use_c_key = a115.row_key)
				  
				  union
				  select 'ldb.d_internal_contact_to a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
				   join          ldb.d_internal_contact_to       a18
                  on          (a11.to_assigned_to_key = a18.row_key)
				  
				  union
				  select 'ldb.d_internal_organization_group a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
				  
				   join          ldb.d_internal_organization_group        a17
                  on          (a11.current_assginment_group_key = a17.row_key)
				  
				  union
				  select 'ldb.d_internal_organization_group_from a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
				  
				  join          ldb.d_internal_organization_group_from               a111
                  on          (a11.from_assignment_group_key = a111.row_key)
				  
				  union
				  select 'ldb.d_internal_organization_group_to a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
				  
				  join          ldb.d_internal_organization_group_to   a19
                  on          (a11.to_assignment_group_key = a19.row_key)
				  
				  union
				  select 'ldb.d_internal_organization_incident_priority_change_group_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
 join          ldb.d_incident         a13
				on (a11.incident_key=a13.row_key)  
				  join          ldb.d_internal_organization_incident_priority_change_group_c         a114
                  on          (a13.priority_change_by_assignment_group_c_key = a114.row_key)
				  
				  union
				  select 'ldb.d_task_priority a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
				    join          ldb.d_task_priority a112
                  on          (a11.priority_src_key = a112.row_key)
				  
				  
				  