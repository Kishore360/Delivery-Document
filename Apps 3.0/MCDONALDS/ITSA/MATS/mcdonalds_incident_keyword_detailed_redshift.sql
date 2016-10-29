select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
  select'd_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_customer         a12
on a11.customer_key = a12.row_key
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact         a12
on a11.opened_by_key = a12.row_key
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_time         a12
on a11.opened_time_key = a12.row_key
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_configuration_item         a12
on a11.configuration_item_key = a12.row_key
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_calendar_date         a12
on a11.opened_on_key = a12.row_key
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact         a12
on a11.opened_by_key = a12.row_key
join ldb.d_internal_contact_mdm         a13
on a12.row_current_key = a13.row_current_key
union
select'd_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_internal_contact         a12
on a11.opened_by_key = a12.row_key
join ldb.d_internal_contact_mdm         a13
on a12.row_current_key = a13.row_current_key
join ldb.d_employee_location         a14
on a13.location_key = a14.row_key
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_incident         a12
on a11.incident_key = a12.row_key
union
select'd_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_assigned_to         a12
on a11.assigned_to_key = a12.row_key
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_assigned_to         a12
on a11.assignment_group_key = a12.row_key 
union
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_legalentity         a12
on a11.company_key = a12.row_key 
union
select'd_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_customer         a12
on a11.customer_key = a12.row_key
join ldb.d_customer_mdm         a13
on a12.row_current_key = a13.row_current_key 
union
select'd_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_domain         a12
on a11.domain_key = a12.row_key
union
select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join ldb.d_calendar_time         a12
on a11.opened_time_key = a12.row_key
join ldb.d_calendar_time_hour         a13
on a12.hour_24_format_num = a13.hour_24_format_num
union
select'd_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_impact        a12
on a11.impact_src_key = a12.row_key
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_location        a12
on a11.location_key = a12.row_key
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_priority        a12
on a11.priority_src_key = a12.row_key
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_contacttype        a12
on a11.reported_type_src_key = a12.row_key
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_task_urgency        a12
on a11.urgency_src_key = a12.row_key;



select'f_incident_keyword' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
 union
  select'd_incident_category' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_category         a12
on a11.category_src_key = a12.row_key
union
  select'd_incident_close_code' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_close_code         a12
on a11.close_code_src_key = a12.row_key
union
  select'd_incident_severity' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_severity         a12
on a11.severity_src_key = a12.row_key
union
  select'd_incident_state' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_state         a12
on a11.state_src_key = a12.row_key
union
  select'd_incident_subcategory' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_keyword             a11 
join ldb.d_incident_subcategory         a12
on a11.sub_category_src_key = a12.row_key

