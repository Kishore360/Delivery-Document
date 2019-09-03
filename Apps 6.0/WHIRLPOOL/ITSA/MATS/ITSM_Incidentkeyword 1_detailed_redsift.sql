select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
union
select 'ldb.d_customer a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_customer a123 
	on (a11.customer_key = a123.row_key)  
union
select 'ldb.d_internal_contact a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a124 
	on (a11.opened_by_key = a124.row_key)  
union
select 'ldb.d_calendar_time a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_time a125 
	on (a11.opened_time_key = a125.row_key)  
union
select 'ldb.d_calendar_date a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a126 
	on (a11.opened_on_key = a126.row_key)  
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_calendar_date a126 
 on (a11.opened_on_key = a126.row_key) 
	join ldb.d_calendar_month a127 
	on (a126.month_start_date_key = a127.row_key)  
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_configuration_item a12 
	on (a11.configuration_item_key = a12.row_key)  
union
select 'ldb.d_internal_contact_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a124 
 on (a11.opened_by_key = a124.row_key) 
	join ldb.d_internal_contact_mdm a14 
	on (a124.row_current_key = a14.row_current_key)  
union
select 'ldb.d_employee_location a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact a124 
 on (a11.opened_by_key = a124.row_key)join ldb.d_internal_contact_mdm a14 
 on (a124.row_current_key = a14.row_current_key) 
	join ldb.d_employee_location a15 
	on (a14.location_key = a15.row_key)  
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
	on (a11.incident_key = a16.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_contact_assigned_to a17 
	on (a11.assigned_to_key = a17.row_key)  
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_group a18 
	on (a11.assignment_group_key = a18.row_key)  
union
select 'ldb.d_internal_organization_legalentity a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_internal_organization_legalentity a19 
	on (a11.company_key = a19.row_key)  
union
select 'ldb.d_customer_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
  join ldb.d_customer a123 
	on (a11.customer_key = a123.row_key)  
 join ldb.d_customer_mdm a110 
	on (a123.row_current_key = a110.row_current_key)  
union
select 'ldb.d_domain a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_domain a111 
	on (a11.domain_key = a111.row_key)  
union
select 'ldb.d_calendar_time_hour a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
  join ldb.d_calendar_time a125 
	on (a11.opened_time_key = a125.row_key)  
 join ldb.d_calendar_time_hour a112 
	on (a125.hour_24_format_num = a112.hour_24_format_num)  
union
select 'ldb.d_task_impact a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_task_impact a113 
	on (a11.impact_src_key = a113.row_key)  
union
select 'ldb.d_location a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_location a114 
	on (a11.location_key = a114.row_key)  
union
select 'ldb.d_task_priority a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_task_priority a115 
	on (a11.priority_src_key = a115.row_key)  
union
select 'ldb.d_task_contacttype a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_task_contacttype a116 
	on (a11.reported_type_src_key = a116.row_key)  
union
select 'ldb.d_task_urgency a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_task_urgency a117 
	on (a11.urgency_src_key = a117.row_key)  
union
select 'ldb.d_incident_category a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
 on (a11.incident_key = a16.row_key) 
	join ldb.d_incident_category a118 
	on (a16.category_src_key = a118.row_key)  
union
select 'ldb.d_incident_close_code a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
 on (a11.incident_key = a16.row_key) 
	join ldb.d_incident_close_code a119 
	on (a16.close_code_src_key = a119.row_key)  
union
select 'ldb.d_incident_severity a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
 on (a11.incident_key = a16.row_key) 
	join ldb.d_incident_severity a120 
	on (a16.severity_src_key = a120.row_key)  
union
select 'ldb.d_incident_state a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
 on (a11.incident_key = a16.row_key) 
	join ldb.d_incident_state a121 
	on (a16.state_src_key = a121.row_key)  
union
select 'ldb.d_incident_subcategory a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident a11 
 join ldb.d_incident a16 
 on (a11.incident_key = a16.row_key) 
	join ldb.d_incident_subcategory a122 
	on (a16.sub_category_src_key = a122.row_key)  

