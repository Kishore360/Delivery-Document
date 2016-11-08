/*Removed close code since this did not exist in the asc design model given and severity is also not a part of requirement
and assignment group type and tier hierarchy*/
 select'f_incident_asc_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
 union
 
 select'd_business_service' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_business_service         a12
on (a11.asc_incident_business_service_c_key  = a12.row_key)
union
 select'd_contact_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join	ldb.d_incident_asc_contact_type_c	a18
	  on 	(a11.asc_incident_contact_type_c_key = a18.row_key)
	  union
 select'd_incident_lob' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
	join	ldb.d_incident_asc_lob_c	a17
	  on 	(a11.asc_incident_line_of_business_c_key = a17.row_key)
 union
  select'd_incident_asc_resolution_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_resolution_type_c         a12
on (a11.asc_incident_resolution_type_c_key  = a12.row_key)
 union
  select'd_line_of_business_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_line_of_business_c         a12
on (a11.asc_incident_line_of_business_c_key  = a12.row_key)
 union
  select'd_internal_contact_caller_c	' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_contact_caller_c	         a12
on (a11.asc_incident_caller_c_key   = a12.row_key)
 union
  select'd_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
 join ldb.d_business_service         a12
on (a11.asc_incident_business_service_c_key  = a12.row_key)
join ldb.d_business_service_criticality         a122
on (a12.criticality_key  = a122.row_key)
union
 select'd_calendar_date_opened' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_calendar_date         a12
on (a11.asc_incident_opened_on_c_key = a12.row_key)
union
select'd_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_calendar_time         a12
on (a11.asc_incident_opened_time_c_key = a12.row_key)
union
select'd_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_calendar_time         a12
on (a11.asc_incident_opened_time_c_key = a12.row_key)
join	ldb.d_calendar_time_hour	a116
	  on 	(a12.hour_24_format_num = a116.hour_24_format_num)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_configuration_item       a13
on (a11.asc_incident_configuration_item_c_key = a13.row_key)
union
select'd_customer' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_customer       a14
on (a11.asc_incident_customer_c_key = a14.row_key)
union
select'd_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11
join ldb.d_customer       a14
on (a11.asc_incident_customer_c_key = a14.row_key)
join ldb.d_customer_mdm      a15
on (a14.row_current_key = a15.row_current_key)
union
select'd_domain' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_domain       a16
on (a11.asc_incident_domain_c_key = a16.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_c       a17
on (a11.incident_asc_c_key = a17.row_key)
union
select'd_incident_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_category_c       a18
on (a11.asc_incident_category_c_key = a18.row_key)
union
select'd_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_state_c       a111
on (a11.asc_incident_state_c_key = a111.row_key)
union
select'd_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_subcategory_c       a112
on (a11.asc_incident_sub_category_c_key = a112.row_key)
union
select'd_internal_contact-opened_by' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join	ldb.d_internal_contact_closed_by	a113
	  on 	(a11.asc_incident_closed_by_key = a113.row_key)
union
select'd_internal_contact-closed_by' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_contact       a113
on (a11.asc_incident_opened_by_key = a113.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11
join ldb.d_internal_contact       a113
on (a11.asc_incident_opened_by_key = a113.row_key)
join ldb.d_internal_contact_mdm       a114
on (a113.row_current_key = a114.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_organization_department       a115
on (a11.asc_incident_opened_by_department_c_key = a115.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_organization_group       a115
on (a11.asc_incident_assignment_group_c_key = a115.row_key)
union
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_organization_legalentity       a116
on (a11.asc_incident_company_c_key = a116.row_key)
union
select'd_problem' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join	ldb.d_problem	a16
	  on 	(a11.asc_problem_c_key = a16.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_location       a117
on (a11.asc_incident_location_c_key= a117.row_key)
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_incident_asc_contact_type_c       a118
on (a11.asc_incident_reported_type_c_key= a118.row_key)
union
select'd_task_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_task_impact       a119
on (a11.asc_incident_impact_c_key = a119.row_key)
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_task_priority       a120
on (a11.asc_incident_priority_c_key	 = a120.row_key)
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_task_urgency       a121
on (a11.asc_incident_urgency_c_key= a121.row_key)
union
select'd_internal_contact_assignment' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_asc_c             a11 
join ldb.d_internal_contact       a123
on (a11.asc_incident_assigned_to_c_key = a123.row_key)
 union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_asc_c             a11 
join ldb.d_calendar_date         a12
on (a11.asc_incident_opened_on_c_key = a12.row_key)
join ldb.d_calendar_month        a124
on (a12.month_start_date_key = a124.row_key)
