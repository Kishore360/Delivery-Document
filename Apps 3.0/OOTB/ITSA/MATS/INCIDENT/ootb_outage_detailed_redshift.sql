select 'ldb.f_incident_outage    a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
union
select 'ldb.d_calendar_date' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
join        ldb.d_calendar_date      a13
                  on         (a11.start_on_key = a13.row_key)
				  union
select 'ldb.d_calendar_month' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
  join        ldb.d_calendar_date      a13
                  on         (a11.start_on_key = a13.row_key)
  join        ldb.d_calendar_month  a15
                  on         (a13.month_start_date_key = a15.row_key)
				  UNION
select 'ldb.d_calendar_quarter' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
  join        ldb.d_calendar_date      a13
                  on         (a11.start_on_key = a13.row_key)
				    join        ldb.d_calendar_month  a15
                  on         (a13.month_start_date_key = a15.row_key)
  join        ldb.d_calendar_quarter a136
                  on         (a15.quarter_start_date_key = a136.row_key)
UNION
select 'ldb.d_calendar_year' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
  join        ldb.d_calendar_date      a13
                  on         (a11.start_on_key = a13.row_key)
				    join        ldb.d_calendar_month  a15
                  on         (a13.month_start_date_key = a15.row_key)
join        ldb.d_calendar_year      a137
                  on         (a15.year_start_date_key = a137.row_key)
				  union
				  select 'ldb.d_application' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
join ldb.d_application d on a11.application_key=d.row_key
union

				  select 'ldb.d_application_tier' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
join ldb.d_application d on a11.application_key=d.row_key
join        ldb.d_application_tier   a128
                  on         (d.tier_src_key = a128.row_key)
				  union
							  select 'ldb.d_application_used_for' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
join ldb.d_application d on a11.application_key=d.row_key  
				  				      join        ldb.d_application_used_for        a129
                  on         (d.used_for_src_key = a129.row_key)
				  union
				   select 'ldb.d_business_service' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				  join        ldb.d_business_service a13
                  on         (a11.business_service_key = a13.row_key)
				  union
				   select 'ldb.d_business_service_criticality' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				  join        ldb.d_business_service a13
                  on         (a11.business_service_key = a13.row_key)
				     join        ldb.d_business_service_criticality             a14
                  on         (a13.criticality_key = a14.row_key)
				  union
				     select 'ldb.d_business_service_used_for' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				  join        ldb.d_business_service a13
                  on         (a11.business_service_key = a13.row_key)
				     join        ldb.d_business_service_criticality             a14
                  on         (a13.criticality_key = a14.row_key)
				  join        ldb.d_business_service_used_for             a131
                  on         (a14.row_key = a131.row_key)
				  union
				  
				      select 'ldb.d_change_request_caused_by' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				     join        ldb.d_change_request_caused_by           a12
                  on         (a11.caused_by_change_key = a12.row_key)
				  union
				   select 'ldb.d_configuration_item' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_configuration_item  a12
                  on         (a11.configuration_item_key = a12.row_key)
				  
				  union
				   select 'ldb.d_configuration_item_incident' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_configuration_item_incident  a12
				  on         (a11.incident_configuration_item_key= a12.row_key)
				  union
				     select 'ldb.d_incident' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_incident  a12
				  on         (a11.incident_key= a12.row_key)
				  union
				       select 'ldb.d_incident_category' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_incident  a12
				  on         (a11.incident_key= a12.row_key)
				  				  join        ldb.d_incident_category               a132
                  on         (a12.category_src_key = a132.row_key)
				  union
				  
				       select 'ldb.d_incident_subcategory' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_incident  a12
				  on         (a11.incident_key= a12.row_key)
				  				  join        ldb.d_incident_subcategory               a132
                  on         (a12.sub_category_src_key = a132.row_key)
				  union
				        select 'ldb.d_internal_contact_assigned_to' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_internal_contact_assigned_to  a12
				  on         (a11.assigned_to_key= a12.row_key)
				  union
				          select 'ldb.d_internal_organization_group' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 
				   join        ldb.d_internal_organization_group  a12
				  on         (a11.assignment_group_key= a12.row_key)
				  union
				          select 'ldb.d_outage' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_outage     a14
                  on         (a11.outage_key = a14.row_key)
				  union
				       select 'ldb.d_outage_type' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_outage     a14
                  on         (a11.outage_key = a14.row_key)
				   join        ldb.d_outage_type         a15
                  on         (a14.outage_type_src_key = a15.row_key)
				  union
				     select 'ldb.d_task_contacttype' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_task_contacttype     a14
                  on         (a11.reported_type_src_key = a14.row_key)
				  union
				   select 'ldb.d_task_impact' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_task_impact     a14
                  on         (a11.impact_src_key = a14.row_key)
				  union
				   select 'ldb.d_task_priority' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_task_priority     a14
                  on         (a11.priority_src_key = a14.row_key)
				  union
				     select 'ldb.d_task_urgency' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_outage       a11 				  
				  join        ldb.d_task_urgency     a14
                  on         (a11.urgency_src_key = a14.row_key)
				  
				  