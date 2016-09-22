select'ldb.f_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reported_type       a13
on a11.reported_type_src_key=a13.row_key
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key=a14.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request       a15
on (a11.change_request_key=a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key=a17.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_contact_assigned_to       a19
on (a11.assigned_to_key=a19.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_category       a111
on (a11.category_src_key=a111.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_reason       a112
on (a11.reason_src_key=a112.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_state       a113
on (a11.state_src_key=a113.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_review_status       a114
on (a11.review_status_src_key=a114.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_risk       a115
on (a11.risk_src_key=a115.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_scope       a116
on (a11.scope_src_key=a116.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_change_request_type       a117
on (a11.type_src_key=a117.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_configuration_item       a118
on (a11.configuration_item_key=a118.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_internal_organization_department       a120
on (a11.requested_by_department_key=a120.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_domain       a121
on (a11.domain_key=a121.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_internal_contact       a14
on (a11.opened_by_key=a14.row_key)
join ldb.d_internal_contact_mdm       a122
on (a14.row_current_key=a122.row_current_key)

union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
join ldb.d_location       a130
on (a11.location_key=a130.row_key)

union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request       a11 
 join ldb.d_calendar_date       a16
on (a11.opened_on_key=a16.row_key)
join ldb.d_calendar_month       a132
on (a16.month_start_date_key=a132.row_key)
union 
   select'd_business_service' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
	  join        ldb.d_business_service a12
  on         (a11.business_service_key = a12.row_key)
	union 
   select'd_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
	  join        ldb.d_business_service a12
  on         (a11.business_service_key = a12.row_key)
  join        ldb.d_business_service_criticality             a13
  on         (a12.criticality_key = a13.row_key)
  union
	 select'd_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
	  join        ldb.d_business_service a12
  on         (a11.business_service_key = a12.row_key)
  join        ldb.d_business_service_used_for             a14
  on         (a12.used_for_src_key = a14.row_key)
  union
   select'd_incident' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
  join        ldb.d_incident   a12
  on         (a11.incident_c_key = a12.row_key)
  union
  select'd_change_request_approval' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
  join        ldb.d_change_request_approval               a12
  on         (a11.approval_state_src_key = a12.row_key)
  union
  select'd_change_request_impact' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
  join        ldb.d_change_request_impact  a12
  on         (a11.impact_src_key = a12.row_key)
  union
  select'd_change_request_priority' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
  join        ldb.d_change_request_priority  a12
  on         (a11.priority_src_key = a12.row_key)
  union
  select'd_change_request_urgency' as Table_Name, count(a11.row_key) Row_Count
  from         ldb.f_change_request         a11
  join        ldb.d_change_request_urgency  a12
  on         (a11.urgency_src_key = a12.row_key)
  