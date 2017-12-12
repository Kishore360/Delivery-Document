select'f_incident_task_sla' as Table_Name, count(a11.*) Row_Count
from  ldb.f_incident_task_sla_open_c             a11 
union
select'd_calendar_date' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	  	  union
select'd_calendar_month' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_calendar_date	a122
	  on 	(a11.opened_on_key = a122.row_key)
 join	ldb.d_calendar_month	a12
	  on 	(a122.month_start_date_key = a12.row_key)
	  union
select'd_incident' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	  	  union
		  select'd_task_sla' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_task_sla	a12
	  on 	(a11.sla_key = a12.row_key)
	  	  	  union
		  select'd_internal_organization_group' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_internal_organization_group	a12
	  on 	(a11.assignment_group_key = a12.row_key)
	  	  	  	  union
		  select'd_internal_contact_assigned_to' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_internal_contact_assigned_to	a12
	  on 	(a11.assigned_to_key = a12.row_key)
	    union
		  select'd_task_sla_stage' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_task_sla_stage	a12
	  on 	(a11.stage_src_key = a12.row_key)
	     union
		  select'd_sla_priority_c' as Table_Name, count(a11.*) Row_Count
 from  ldb.f_incident_task_sla_open_c             a11 
 join	ldb.d_task_sla	a122
	  on 	(a11.sla_key = a122.row_key)
 join	ldb.d_sla_priority_c	a12
	  on 	(a122.sla_priority_src_c_key = a12.row_key)
		  