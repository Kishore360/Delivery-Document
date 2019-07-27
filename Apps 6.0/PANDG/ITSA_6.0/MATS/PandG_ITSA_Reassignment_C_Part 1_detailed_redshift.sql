	/* d_calendar_date
	d_calendar_month
	d_configuration_item
	d_incident
	d_incident_priority
	d_incident_state
	d_internal_contact_from
	d_internal_contact_to
	d_internal_organization_group
	d_internal_organization_group_from
	d_internal_organization_group_to
	f_incident
	f_incident_activity */



	select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	union
	select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_calendar_date a12 on (a11.date_key = a12.row_key) 
	union
	select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_incident a13 on (a11.incident_key = a13.row_key) 
	union
	select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_internal_organization_group a14 on (a11.current_assignment_group_key = a14.row_key) 
	union
	select 'ldb.d_internal_contact_to a15 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_internal_contact_to a15 on (a11.to_assigned_to_key = a15.row_key) 
	union
	select 'ldb.d_internal_organization_group_to a16 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_internal_organization_group_to a16 on (a11.to_assignment_group_key = a16.row_key) 
	union
	select 'ldb.d_internal_contact_from a17 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_internal_contact_from a17 on (a11.from_assigned_to_key = a17.row_key) 
	union
	select 'ldb.d_internal_organization_group_from a18 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_internal_organization_group_from a18 on (a11.from_assignment_group_key = a18.row_key) 
	union
	select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_calendar_date a12 on (a11.date_key = a12.row_key) 
	join ldb.d_calendar_month a19 on (a12.month_start_date_key = a19.row_key) 
	union
	select 'ldb.d_incident_priority a110 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_incident a13 on (a11.incident_key = a13.row_key) 
	join ldb.d_incident_priority a110 on (a13.priority_src_key = a110.row_key) 
	union
	select 'ldb.d_incident_state a111 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_incident a13 on (a11.incident_key = a13.row_key) 
	join ldb.d_incident_state a111 on (a13.state_src_key = a111.row_key) 
	UNION 
	select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_calendar_date_fiscal a13 on (a11.fiscal_date_key = a13.row_key) 
	UNION 
	select 'ldb.d_calendar_date_opened' as Table_Name, count(1) Row_Count
	from  ldb.f_incident_activity  a11 
	join  ldb.d_calendar_date_opened a110 on (a11.date_key = a110.row_key)
	UNION 
	select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
	from ldb.f_incident_activity a11 
	join ldb.d_configuration_item a12 ON a11.configuration_item_key=a12.row_key



