select'f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword             a11 
 union
select'd_customer' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_customer         a12
on (a11.customer_key  = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_calendar_time         a12
on (a11.opened_time_key = a12.row_key)
union
select'dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.dh_assignment_group_type_hierarchy         a12
on (a11.assignment_group_key = a12.user_group_type_key)
union
select'configuration_item_key' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item         a12
on (a11.configuration_item_key = a12.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_incident         a12
on (a11.table_row_key = a12.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_department_hierarchies_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_department_hierarchies_c         a12
on (a11.opened_by_department_key = a12.lev_0_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_location         a12
on (a11.location_key = a12.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_internal_organization_group         a12
on (a11.assignment_group_key = a12.row_key)
union
select'd_configuration_item_bsd_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item_bsd_business_service_c         a12
on (a11.bsd_business_service_c_key = a12.row_key)
union
select'd_configuration_item_bsd_parent_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item_bsd_parent_business_service_c         a12
on (a11.bsd_parent_business_service_c_key = a12.row_key)
union
select'd_configuration_item_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item_business_service_c         a12
on (a11.business_service_c_key = a12.row_key)
union
select'd_configuration_item_client_asset_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item_client_asset_c         a12
on (a11.client_asset_c_key = a12.row_key)
union
select'd_configuration_item_closure_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_configuration_item_closure_business_service_c         a12
on (a11.closure_business_service_c_key = a12.row_key)
union
select'd_closure_trouble_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_closure_trouble_c         a12
on (a11.closure_trouble_c_key = a12.row_key)
union
select'd_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join	ldb.d_customer	a12
	  on 	(a11.customer_key = a12.row_key)
join ldb.d_customer_mdm         a120
on (a12.row_current_key = a120.row_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_internal_organization_department         a12
on (a11.opened_by_department_key = a12.row_key)
union
select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join	ldb.d_calendar_time	a13
	  on 	(a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour         a12
on (a13.hour_24_format_num = a12.hour_24_format_num)
union
select'd_internal_contact_person_reporting_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_internal_contact_person_reporting_c         a12
on (a11.person_reporting_c_key = a12.row_key)
union
select'd_record_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_record_type_c         a12
on (a11.record_type_c_key = a12.row_key)
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_task_priority         a12
on (a11.priority_src_key = a12.row_key)
union
select'd_trouble_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join ldb.d_trouble_c         a12
on (a11.trouble_c_key = a12.row_key)
union    
select'd_internal_organization_division_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join	ldb.d_configuration_item	a16
	  on 	(a11.configuration_item_key = a16.row_key)
join ldb.d_internal_organization_division_c         a12
on (a16.division_c_key = a12.row_key)
union                    
select'd_internal_organization_institution_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join	ldb.d_department_hierarchies_c	a19
	  on 	(a11.opened_by_department_key = a19.lev_0_key)
join ldb.d_internal_organization_institution_c         a12
on (a19.lev_1_key = a12.row_key)
union                    
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_keyword              a11 
join	ldb.d_calendar_date	a18
	  on 	(a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month         a12
on (a18.month_start_date_key = a12.row_key)
