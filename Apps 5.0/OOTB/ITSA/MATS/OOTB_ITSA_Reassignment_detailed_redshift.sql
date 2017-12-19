select 'ldb.f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
 
 union 
 select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count 
 from         ldb.f_incident          a11
                join          ldb.f_incident_activity            a12
                  on          (a11.assignment_group_key = a12.assignment_group_key and 
                a11.assignment_group_key = a12.current_assginment_group_key and 
                a11.incident_key = a12.incident_key and 
                a11.opened_on_key = a12.assigned_on_key and 
                a11.opened_on_key = a12.opened_on_key and 
                a11.reported_type_src_key = a12.reported_type_src_key)
 union
 select 'ldb.d_calendar_date_opened' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
      join          ldb.d_calendar_date_opened                 a110
                  on          (a11.opened_on_key = a110.row_key)
				  union
				  select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a14
on (a11.assigned_on_key = a14.row_key)
			  
				  join          ldb.d_calendar_month            a17
                  on          (a14.month_start_date_key = a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group       a12
on (a11.current_assginment_group_key = a12.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_incident       a13
on (a11.incident_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a14
on (a11.assigned_on_key = a14.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_to       a15
on (a11.to_assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_to       a16
on (a11.to_assignment_group_key = a16.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_from       a17
on (a11.from_assigned_to_key = a17.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_to      a17
on (a11.to_assigned_to_key = a17.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_from       a18
on (a11.from_assignment_group_key = a18.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
 join ldb.d_incident       a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_priority       a19
on (a13.priority_src_key = a19.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11
 join ldb.d_incident       a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_state       a110
on (a13.state_src_key = a110.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11
join          ldb.d_incident_contacttype    a111
                  on          (a11.reported_type_src_key = a111.row_key)

