 
select  'f_incident' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
union 
select 'd_internal_organization_legalentity' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_organization_legalentity b
on(a.company_key = b.row_key)
union 
select 'd_customer' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_customer b
on(a.customer_key = b.row_key)
union 
select 'd_internal_contact' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_contact   b
on (a.opened_by_key = b.row_key)
union 
select 'd_calendar_time' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_calendar_time    b
on (a.opened_time_key = b.row_key)
union 
select 'dh_assignment_group_tier_hierarchy' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.dh_assignment_group_tier_hierarchy    b
on (a.assignment_group_key = b.user_group_tier_key)
union 
select 'dh_assignment_group_type_hierarchy' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.dh_assignment_group_type_hierarchy    b
on (a.assignment_group_key = b.user_group_type_key)
union 
select 'd_location' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_location    b
on (a.location_key = b.row_key)
union 
select 'd_incident' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident    b
on (a.incident_key = b.row_key)
union 
select 'd_configuration_item' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_configuration_item    b
on (a.configuration_item_key = b.row_key)
union 
select 'd_calendar_date' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_calendar_date    b
on (a.opened_on_key = b.row_key)
union 
select 'd_internal_contact' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_contact    b
on (a.assigned_to_key = b.row_key)        
union 
select 'd_internal_organization_group' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_organization_group    b
on (a.assignment_group_key = b.row_key)
union 
select 'd_incident_category1_c' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_category1_c    b
on (a.category_1_src_c_key = b.row_key)
union 
select 'd_incident_category2_c' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_category2_c    b
on (a.category_2_src_c_key = b.row_key)
union 
select 'd_incident_category_c' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_category_c    b
on (a.category_src_c_key = b.row_key)
union 
select 'd_change_request' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_change_request    b
on (a.change_request_key = b.row_key)
union 
select 'd_customer_mdm' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_customer       b
on a.customer_key = b.row_key
join ldb.d_customer_mdm   c
on (b.row_current_key = c.row_current_key)
union 
select 'd_internal_organization_department' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
JOIN ldb.d_internal_contact b ON (a.opened_by_key=b.row_key)
JOIN ldb.d_internal_organization_department c on (b.department_key = c.row_key)
union 
select 'd_domain' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_domain    b
on (a.domain_key = b.row_current_key)
union 
select 'd_internal_contact_mdm' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_contact            b
on  (a.opened_by_key = b.row_key)
join ldb.d_internal_contact_mdm    c
on (b.row_current_key = c.row_current_key)
union 
select 'd_calendar_time_hour' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_calendar_time   b
on (a.opened_time_key = b.row_key)
join ldb.d_calendar_time_hour    c
on  (b.hour_24_format_num = c.hour_24_format_num)
union 
select 'd_incident_agebucket' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_agebucket    b
on  (a.age_key = b.row_key)
union 
select 'd_incident_category' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_category    b
on  (a.category_src_key = b.row_key)            
union 
select 'd_incident_close_code' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_close_code    b
on  (a.close_code_src_key = b.row_key)    
union 
select 'd_incident_severity' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_severity    b
on  (a.severity_src_key = b.row_key)               
union 
select 'd_incident_state' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_state    b
on  (a.state_src_key = b.row_key)  			   
union 
select 'd_incident_subcategory' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_subcategory    b
on  (a.sub_category_src_key = b.row_key)   
union 
select 'd_incident_subcategory' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_task    b
on  (a.parent_inc_c_key = b.row_key)   
union 
select 'd_task' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_task    b
on  (a.parent_inc_c_key = b.row_key)  
union 
select 'd_internal_contact_requester_c' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_contact_requester_c    b
on  (a.requester_c_key = b.row_key)
union 
select 'd_incident_impact' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_impact    b
on  (a.impact_src_key = b.row_key)            
union 
select 'd_incident_priority' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_priority    b
on  (a.priority_src_key = b.row_key) 
union 
select 'd_incident_contacttype' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_contacttype    b
on  (a.reported_type_src_key = b.row_key) 
union 
select 'd_incident_urgency' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident_urgency    b
on  (a.urgency_src_key = b.row_key) 
union 
select 'd_incident_parent_c' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_incident  b
on(a.incident_key = b.row_key)
join ldb.d_incident_parent_c    c
on  (b.parent_incident_key = c.row_key) 
union 
select 'd_calendar_month' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_calendar_date b
on (a.opened_on_key = b.row_key)
join ldb.d_calendar_month    c
on  (b.month_start_date_key = c.row_key) 
UNION 
select 'ldb.dh_user_group_level1 a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
join ldb.dh_user_group_level1 a124 
on (a14.lev_1_key = a124.row_key)
UNION 
select 'd_internal_contact_assigned_to' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_internal_contact_assigned_to b on (a.assigned_to_key = b.row_key)
UNION 
select 'd_change_request' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_change_request b on (a.change_request_key = b.row_key)
UNION 
select 'd_change_request_caused_by' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_change_request_caused_by b on (a.change_request_key = b.row_key)
UNION
select 'd_business_service' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
join ldb.d_business_service b on (a.business_service_key = b.row_key)
UNION 
select'd_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_contacttype       a118
on (a11.reported_type_src_key = a118.row_key)

  

