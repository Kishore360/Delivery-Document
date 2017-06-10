SELECT 'ldb.f_incident' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident a11
UNION 
select 'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join  ldb.dh_assignment_group_type_hierarchy a12 on (a11.assignment_group_key=a12.user_group_type_key)
UNION 
select 'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a13 on (a11.assignment_group_key=a13.user_group_tier_key)
UNION 
select 'ldb.d_technical_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_technical_service_c a14 on (a11.technical_service_c_key=a14.row_key)
UNION 
select 'ldb.d_incident_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_urgency  a15 on (a11.urgency_src_key=a15.row_key)
UNION 
select 'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_priority a16 on (a11.priority_src_key=a16.row_key)
UNION 
select 'ldb.d_incident_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident_impact a17 on (a11.impact_src_key=a17.row_key)
UNION 
select 'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a18 on (a11.reported_type_src_key=a18.row_key)
UNION 
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join  ldb.d_location a19 on (a11.location_key=a19.row_key)
UNION 
select 'ldb.d_location_site_c ' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join  ldb.d_location a19 on (a11.location_key=a19.row_key)
join  ldb.d_location_site_c a20 on (a19.site_c_key =a20.row_key)
UNION 
select 'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_organization_legalentity  a21 on (a11.company_key=a21.row_key)
UNION 
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_organization_group a22 on (a11.assignment_group_key=a22.row_key)
UNION 
select  'd_internal_organization_escalation_gp_c' as Table_Name,count(a11.row_key) Row_Count 
from  ldb.f_incident a11 
join ldb.d_internal_organization_group a22 on (a11.assignment_group_key=a22.row_key)
join ldb.d_internal_organization_escalation_gp_c a23 on (a22.escalation_group_c_key = a23.row_key)
UNION 
select 'd_internal_organization_department' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident a
JOIN ldb.d_internal_contact b ON (a.opened_by_key=b.row_key)
JOIN ldb.d_internal_organization_department c on (b.department_key = c.row_key)
UNION 
select  'd_internal_contact_owner_c' as Table_Name,count(a11.row_key) Row_Count     
from  ldb.f_incident a11 
join ldb.d_internal_organization_group a22 on (a11.assignment_group_key=a22.row_key)
join ldb.d_internal_contact_owner_c a25 on (a22.owner_c_key=a25.row_key)
UNION 
select 'ldb.d_internal_contact_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident a11  
join ldb.d_internal_contact_opened_by_c a26  on (a11.opened_by_c_key =a26.row_key)
UNION 
SELECT 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident a11 
JOIN ldb.d_internal_contact a12 ON (a11.opened_by_key=a12.row_key)
UNION 
SELECT 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident a11 
JOIN ldb.d_internal_contact a12 ON (a11.opened_by_key=a12.row_key)
JOIN ldb.d_internal_contact_mdm a13 ON (a12.row_current_key=a13.row_current_key)
UNION 
select 'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a12  on (a11.assigned_to_key=a12.row_key)
UNION 
select 'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident  a11  
join ldb.d_incident_subcategory a12  on (a11.sub_category_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_incident_state a12 on (a11.state_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_incident_severity a12 on (a11.severity_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_incident_close_code a12  on (a11.close_code_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_incident_category a12 on (a11.category_src_key=a12.row_key)
UNION 
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident a18  on (a11.incident_key=a18.row_key)
UNION 
select 'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_domain a12  on (a11.domain_key=a12.row_key)
UNION 
SELECT 'ldb.d_customer' AS Table_Name, count(a11.row_key) AS Row_count
FROM ldb.f_incident a11 
JOIN ldb.d_customer a12 ON (a11.customer_key=a12.row_key)
UNION 
select 'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
FROM ldb.f_incident a11 
JOIN ldb.d_customer a12 ON (a11.customer_key=a12.row_key)
JOIN ldb.d_customer_mdm a13 ON (a12.row_current_key=a13.row_current_key)
UNION 
select  'd_configuration_item_causing_ci_c' as Table_Name,count(a11.row_key) Row_Count     
from ldb.f_incident a11
join ldb.d_configuration_item_causing_ci_c a12 on (a11.causing_ci_c_key = a12.row_key)
UNION 
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_configuration_item a19 on (a11.configuration_item_key=a19.row_key)
UNION 
SELECT 'ldb.d_calendar_date' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident a11 
JOIN ldb.d_calendar_date a12 ON (a11.opened_on_key=a12.row_key)
UNION 
SELECT 'ldb.d_calendar_year' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident a11 
JOIN ldb.d_calendar_date a12 ON (a11.opened_on_key=a12.row_key)
JOIN ldb.d_calendar_year a14 ON (a12.year_start_date_key=a14.row_key)
UNION 
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11  
join ldb.d_calendar_date a110 on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_week a1100 on (a110.week_start_date_key=a1100.row_key)
UNION 
select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident  a11 
join ldb.d_calendar_time a15	on (a11.opened_time_key=a15.row_key)
join ldb.d_calendar_time_hour a119 on (a15.hour_24_format_num=a119.hour_24_format_num)
UNION 
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 on (a11.opened_time_key=a15.row_key)
UNION 
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_calendar_date a110	on (a11.opened_on_key=a110.row_key)
join ldb.d_calendar_month  a131 on (a110.month_start_date_key=a131.row_key)
UNION 
select 'ldb.d_business_service_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_business_service_c a114 on (a11.business_service_c_key=a114.row_key)
UNION 
SELECT 'ldb.d_calendar_rolling_three_months' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_rolling_three_months c ON b.month_start_date_key=c.month_start_date_key
UNION 
SELECT 'ldb.d_task_hold_type_c' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident a11
JOIN ldb.d_task_hold_type_c a12 ON (a11.hold_type_src_c_key=a12.row_key)
UNION 
select 'ldb.d_internal_organization_vendor_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_internal_organization_group a22 on (a11.assignment_group_key=a22.row_key)
join ldb.d_internal_organization_vendor_c a23 on (a22.vendor_c_key=a23.row_key)
UNION 
select 'ldb.d_internal_contact_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a15  on (a11.assignment_group_key = a15.row_key) 
join ldb.d_internal_contact_manager_c a132  on (a15.manager_c_key = a132.row_key) 
  
