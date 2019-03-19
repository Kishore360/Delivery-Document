SELECT 'ldb.f_incident_resolved' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
UNION 
select 'ldb.d_incident_urgency' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_incident_urgency  a15 on (a11.urgency_src_key=a15.row_key)
UNION 
select 'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_incident_priority a16 on (a11.priority_src_key=a16.row_key)
UNION 
select 'ldb.d_incident_impact' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_incident_impact a17 on (a11.impact_src_key=a17.row_key)
UNION 
select 'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident_contacttype a18 on (a11.reported_type_src_key=a18.row_key)
UNION 
select 'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join  ldb.d_location a19 on (a11.location_key=a19.row_key)
UNION 
select 'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_internal_organization_legalentity  a21 on (a11.company_key=a21.row_key)
UNION 
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_internal_organization_group a22 on (a11.assignment_group_key=a22.row_key)
UNION 
select 'd_internal_organization_department' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
JOIN ldb.d_internal_contact b ON (a.opened_by_key=b.row_key)
JOIN ldb.d_internal_organization_department c on (b.department_key = c.row_key)
UNION 
SELECT 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11 
JOIN ldb.d_internal_contact a12 ON (a11.opened_by_key=a12.row_key)
JOIN ldb.d_internal_contact_mdm a13 ON (a12.row_current_key=a13.row_current_key)
UNION 
select 'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_internal_contact_assigned_to a12  on (a11.assigned_to_key=a12.row_key)
UNION 
SELECT 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11 
JOIN ldb.d_internal_contact a12 ON (a11.opened_by_key=a12.row_key)
UNION 
select 'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved  a11  
join ldb.d_incident_subcategory a12  on (a11.sub_category_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11  
join ldb.d_incident_state a12 on (a11.state_src_key=a12.row_key)
UNION 
select 'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11  
join ldb.d_incident_severity a12 on (a11.severity_src_key=a12.row_key)
UNION 
SELECT 'ldb.d_incident_resolution_ci_c' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
JOIN ldb.d_incident_resolution_ci_c b ON a11.resolution_ci_detail_key=b.row_key
UNION 
SELECT 'ldb.d_software_c' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
JOIN ldb.d_software_c b ON a11.archer_id_c_key=b.row_key
UNION 
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
JOIN ldb.d_incident b ON a11.incident_key=b.row_key 
join ldb.d_incident_close_code a12  on (b.close_code_src_key=a12.row_key)
UNION 
SELECT 'ldb.d_lov_incident_cause_code_c ' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
JOIN ldb.d_incident b ON a11.incident_key=b.row_key
JOIN ldb.d_lov_incident_cause_code_c  c ON b.cause_code_c_key=c.row_key
UNION 
select 'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11  
join ldb.d_incident_category a12 on (a11.category_src_key=a12.row_key)
UNION 
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_incident a18  on (a11.incident_key=a18.row_key)
UNION 
select 'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_domain a12  on (a11.domain_key=a12.row_key)
UNION 
SELECT 'ldb.d_customer' AS Table_Name, count(a11.row_key) AS Row_count
FROM ldb.f_incident_resolved a11 
JOIN ldb.d_customer a12 ON (a11.customer_key=a12.row_key)
UNION 
select 'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
FROM ldb.f_incident_resolved a11 
JOIN ldb.d_customer a12 ON (a11.customer_key=a12.row_key)
JOIN ldb.d_customer_mdm a13 ON (a12.row_current_key=a13.row_current_key)
UNION 
SELECT 'ldb.d_configuration_item' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
JOIN  ldb.d_configuration_item b ON a11.configuration_item_key=b.row_key
UNION 
SELECT 'ldb.d_change_request' AS Table_Name, count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11
JOIN  ldb.d_change_request b  ON a11.change_request_key=b.row_key
UNION 
select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved  a11 
join ldb.d_calendar_time a15	on (a11.opened_time_key=a15.row_key)
join ldb.d_calendar_time_hour a119 on (a15.hour_24_format_num=a119.hour_24_format_num)
UNION 
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_time a15 on (a11.opened_time_key=a15.row_key)
UNION
SELECT 'ldb.d_calendar_date' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident_resolved a11 
JOIN ldb.d_calendar_date a12 ON (a11.last_resolved_on_key=a12.row_key)
UNION 
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_calendar_date a110	on (a11.last_resolved_on_key=a110.row_key)
join ldb.d_calendar_month  a131 on (a110.month_start_date_key=a131.row_key)
UNION 
select 'ldb.d_business_service' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_business_service a114 on (a11.business_service_key=a114.row_key)
UNION 
select 'ldb.d_business_service_criticality' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_business_service a114 on (a11.business_service_key=a114.row_key)
JOIN ldb.d_business_service_criticality b ON a114.criticality_key=b.row_key
UNION
select 'ldb.d_business_service_used_for' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
join ldb.d_business_service a114 on (a11.business_service_key=a114.row_key)
JOIN ldb.d_business_service_used_for b ON a114.used_for_src_key=b.row_key
UNION 
select 'd_lov_incident_resolution_code_c ' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_resolved a11 
JOIN ldb.d_incident b ON a11.incident_key=b.row_key
JOIN ldb.d_lov_incident_resolution_code_c  c ON b.resolution_code_c_key=c.row_key

