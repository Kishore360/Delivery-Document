select 'ldb.f_major_incident_audit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_major_incident_audit_c       a11 
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_major_incident_audit_c       a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	  union
select 'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_major_incident_audit_c       a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
	join	ldb.d_incident_state	a13
	  on 	(a12.state_src_key = a13.row_key)
	  union
	  select 'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_major_incident_audit_c       a11
	   join	ldb.d_internal_contact_opened_by_c	a12
	  on 	(a11.current_opened_by_key = a12.row_key)
	  union
	  select 'ldb.d_internal_contact_user_group_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_internal_contact_user_group_c	a13
	  on 	(a11.user_c_key = a13.user_key)
	  union
	  select 'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count	
	  from	ldb.f_major_incident_audit_c a11
	  join	ldb.d_internal_contact_opened_by_c	a12
	  on 	(a11.current_opened_by_key = a12.row_key)
	union
	  select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_calendar_date	a13
	  on 	(a11.assigned_on_key = a13.row_key)
union
	  select 'ldb.d_configuration_item_new_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_configuration_item_new_c	a13
	  on 	(a11.to_configuration_item_key = a13.row_key)
	  union
	  select 'ldb.d_internal_contact_user_c' as Table_Name, count(a11.row_key) Row_Count	
	  	from	ldb.f_major_incident_audit_c a11
		 join          ldb.d_internal_contact_user_group_c   a13
                  on          (a11.user_c_key = a13.user_key)
	join	ldb.d_internal_contact_user_c	a115
	  on 	(a13.user_key = a115.row_key)
	union
	 select 'ldb.d_internal_contact_resolved_by_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_internal_contact_resolved_by_c	a116
	  on 	(a11.last_resolved_by_key= a116.row_key)
	union
	select 'ldb.d_internal_contact_sd_member_c' as Table_Name, count(a11.row_key) Row_Count	
	from  ldb.f_major_incident_audit_c       a11
	join	ldb.d_incident	a12
	  on 	(a11.incident_key = a12.row_key)
		join	ldb.d_internal_contact_sd_member_c	a118
	  on 	(a12.sd_member_c_key = a118.row_key)
union
	select 'ldb.d_task_impact_new_c' as Table_Name, count(a11.row_key) Row_Count		
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_impact_new_c	a18
	  on 	(a11.to_impact_key = a18.row_key)
	union
	select 'ldb.d_task_priority_new_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_priority_new_c	a19
	  on 	(a11.to_priority_key = a19.row_key)
	union
	select 'ldb.d_task_urgency_new_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_urgency_new_c	a110
	  on 	(a11.to_urgency_key = a110.row_key)
	union
	select 'ldb.d_configuration_item_old_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_configuration_item_old_c	a111
	  on 	(a11.from_configuration_item_key  = a111.row_key)
	union
	select 'ldb.d_task_impact_old_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_impact_old_c	a112
	  on 	(a11.from_impact_key = a112.row_key)
	union
	select 'ldb.d_task_priority_old_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_priority_old_c	a113
	  on 	(a11.from_priority_key = a113.row_key)
	union
	select 'ldb.d_task_urgency_old_c' as Table_Name, count(a11.row_key) Row_Count	
	from	ldb.f_major_incident_audit_c a11
	join	ldb.d_task_urgency_old_c	a114
	  on 	(a11.from_urgency_key  = a114.row_key)
	
