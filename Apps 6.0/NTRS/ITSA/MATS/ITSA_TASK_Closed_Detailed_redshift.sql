select 'ldb.f_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key)  
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_internal_contact_assigned_to a14 
 on (a11.assigned_to_key = a14.row_key)  
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_internal_organization_group a15 
 on (a11.assignment_group_key = a15.row_key)  
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_calendar_date a16 
 on (a11.date_key = a16.row_key)  
union
select 'ldb.d_task a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key)  
union
select 'ldb.d_parent_task a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_parent_task a18 
 on (a17.parent_task_key = a18.row_key)  
union
select 'ldb.d_application_mdm a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_application a12 
 on (a11.application_key = a12.row_key) 
 join ldb.d_application_mdm a19 
 on (a12.mdm_key = a19.row_key)  
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_business_service a110 
 on (a11.business_service_key = a110.row_key)  
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_configuration_item a111 
 on (a11.configuration_item_key = a111.row_key)  
union
select 'ldb.d_internal_contact_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_internal_contact a13 
 on (a11.employee_key = a13.row_key) 
 join ldb.d_internal_contact_mdm a112 
 on (a13.employee_mdm_key = a112.row_key)  
union
select 'ldb.d_location a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_location a113 
 on (a11.location_key = a113.row_key)  
union
select 'ldb.d_task_approval a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_approval a114 
 on (a17.approval_src_key = a114.row_key)  
union
select 'ldb.d_task_closed_by a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_closed_by a115 
 on (a17.closed_by_key = a115.row_key)  
union
select 'ldb.d_task_contacttype a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_contacttype a116 
 on (a17.contact_type_src_key = a116.row_key)  
union
select 'ldb.d_task_impact a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_impact a117 
 on (a17.impact_src_key = a117.row_key)  
union
select 'ldb.d_task_opened_by a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_opened_by a118 
 on (a17.opened_by_key = a118.row_key)  
union
select 'ldb.d_task_priority a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_priority a119 
 on (a17.priority_src_key = a119.row_key)  
union
select 'ldb.d_task_state a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_state a120 
 on (a17.state_src_key = a120.row_key)  
union
select 'ldb.d_task_type a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_type a121 
 on (a17.task_type_src_key = a121.row_key)  
union
select 'ldb.d_task_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_closed a11 
 join ldb.d_task a17 
 on (a11.task_key = a17.row_key) 
 join ldb.d_task_urgency a122 
 on (a17.urgency_src_key = a122.row_key)  

