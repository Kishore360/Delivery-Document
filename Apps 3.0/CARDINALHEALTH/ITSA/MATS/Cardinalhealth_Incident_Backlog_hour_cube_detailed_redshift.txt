select 'ldb.f_incident_active_hourly_backlog_c a11 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 
     join        ldb.d_internal_organization_group         a12
                  on         (a11.assignment_group_key = a12.row_key)
				  
				  union
select 'ldb.d_task_priority a134 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 
join ldb.d_task_priority a134 
on (a11.priority_src_key = a134.row_key)

	  union
select 'ldb.d_task_urgency a136 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 
join ldb.d_task_urgency a136 
on (a11.urgency_src_key = a136.row_key) 
union
				  select 'ldb.d_task_impact a133 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 
join ldb.d_task_impact a133 
on (a11.impact_src_key = a133.row_key) 

union
select 'ldb.d_internal_contact_emp_seniors_c a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 

 join        ldb.d_internal_organization_group         a12
                  on         (a11.assignment_group_key = a12.row_key)
                join        ldb.d_internal_contact_emp_seniors_c a13
                  on         (a12.manager_c_key = a13.row_key)
				  
	union
select 'ldb.d_assignment_group_level0_manager_c_relation a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
				  
                join        ldb.d_assignment_group_level0_manager_c_relation     a14
                  on         (a11.assignment_group_key = a14.level0_assigment_group_key)
				  
	union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
                join        ldb.d_configuration_item            a15
                  on         (a11.configuration_item_key = a15.row_key)
				  
	union
select 'ldb.d_calendar_as_on_date_c a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
                join        ldb.d_calendar_as_on_date_c   a16
                  on         (a11.as_of_start_date_key = a16.row_key)
				  
	union
select 'ldb.d_calendar_time_as_on_hour_c a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
                join        ldb.d_calendar_time_as_on_hour_c       a17
                  on         (a11.hour_24_format_num_key = a17.hour_24_format_num)
				  
	union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
				  
                join        ldb.d_internal_contact_assigned_to       a18
                  on         (a11.assigned_to_key = a18.row_key)
				  
union
select 'ldb.d_assignment_group_level0_manager_c a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 				  
				  
				    
                join        ldb.d_assignment_group_level0_manager_c_relation     a14
                  on         (a11.assignment_group_key = a14.level0_assigment_group_key)
                join        ldb.d_assignment_group_level0_manager_c       a19
                  on         (a14.level0_manager_c_key = a19.level0_manager_c_key)
	union
select 'ldb.d_config_item_cah_bus_segment_c a12 ' as Table_name, count(a11.as_of_start_date_key) Row_Count
from ldb.f_incident_active_hourly_backlog_c a11 			  
				  
				  
				   join        ldb.d_configuration_item            a15
                  on         (a11.configuration_item_key = a15.row_key)
                join        ldb.d_config_item_cah_bus_segment_c a110
                  on         (a15.cah_bus_segment_src_code_c_key = a110.row_key)