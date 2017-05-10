select  'f_incident_resolved' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
UNION
select 'd_calendar_date' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_calendar_date    b on (a.last_resolved_on_key = b.row_key)
UNION
SELECT 'd_calendar_date_fiscal' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a
JOIN ldb.d_calendar_greg_fiscal b ON a.last_resolved_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
UNION
SELECT 'd_calendar_date_opened' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_date_opened b ON a.last_resolved_on_key=b.row_key
UNION
SELECT 'd_calendar_fiscal_period' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_greg_fiscal b ON a.last_resolved_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
JOIN ldb.d_calendar_fiscal_period d ON c.period_start_date_key=d.row_key
UNION
SELECT 'd_calendar_fiscal_quarter' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_greg_fiscal b ON a.last_resolved_on_key=b.gregorian_calendar_key
JOIN ldb.d_calendar_date_fiscal c ON b.fiscal_calendar_key=c.row_key
JOIN ldb.d_calendar_fiscal_quarter d ON c.quarter_start_date_key=d.row_key 
UNION 
SELECT 'd_calendar_greg_fiscal' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_greg_fiscal b ON a.last_resolved_on_key=b.gregorian_calendar_key
UNION
select 'd_calendar_month' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_calendar_date b on (a.last_resolved_on_key = b.row_key)
join ldb.d_calendar_month c on (b.month_start_date_key = c.row_key)
UNION
SELECT 'd_calendar_month_opened' AS Table_name, count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_calendar_date_opened b ON a.last_resolved_on_key=b.row_key
JOIN ldb.d_calendar_month_opened c ON b.month_start_date_key=c.row_key
UNION
select 'd_calendar_time' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_calendar_time b on (a.opened_time_key = b.row_key)
UNION 
select 'd_calendar_time_hour' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_calendar_time   b on (a.opened_time_key = b.row_key) 
join ldb.d_calendar_time_hour c on (b.hour_24_format_num = c.hour_24_format_num)
UNION 
select 'd_configuration_item' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_configuration_item    b on (a.configuration_item_key = b.row_key)
UNION 
select 'd_customer' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_customer b on(a.customer_key = b.row_key)
UNION 
select 'd_customer_mdm' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_customer b on a.customer_key = b.row_key
join ldb.d_customer_mdm c on (b.row_current_key = c.row_current_key)
UNION 
select 'd_domain' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_domain    b on (a.domain_key = b.row_current_key)
UNION 
select 'd_incident' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident    b on (a.incident_key = b.row_key)
UNION 
select 'd_incident_agebucket' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_agebucket b on  (a.age_key = b.row_key)
UNION 
SELECT 'd_incident_building_c' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident_building_c b ON (a.building_c_key=b.row_key)
UNION 
select 'd_incident_category' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_category b on  (a.category_src_key = b.row_key)
UNION 
select 'd_incident_close_code' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_close_code    b on (a.close_code_src_key = b.row_key)  
UNION 
SELECT 'd_incident_mttr_agebucket' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident_mttr_agebucket b ON (a.mttr_age_key=b.row_key)
UNION 
SELECT 'd_incident_outage_type_c' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident_outage_type_c b ON (a.outage_type_src_c_key=b.row_key)
UNION 
select 'd_incident_severity' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_severity b on(a.severity_src_key = b.row_key) 
UNION 
select 'd_incident_state' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_state b on (a.state_src_key = b.row_key)
UNION 
select 'd_incident_subcategory' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_incident_subcategory b on  (a.sub_category_src_key = b.row_key)
UNION 
select 'd_internal_contact' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_internal_contact   b on (a.last_resolved_by_key = b.row_key)
UNION 
select 'd_internal_contact_assigned_to' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_internal_contact_assigned_to b on (a.assigned_to_key = b.row_key)
UNION 
SELECT 'd_internal_contact_director_c' AS Table_name, count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_director_c c ON b.director_c_key =c.row_key 
UNION 
SELECT 'd_internal_contact_executive_c' AS Table_name, count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_executive_c c ON b.executive_c_key =c.row_key
UNION
SELECT 'd_internal_contact_queue_manager_c' AS Table_name, count(a.row_key) as Row_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
JOIN ldb.d_internal_contact_queue_manager_c c ON b.queue_manager_c_key =c.row_key
UNION 
select 'd_internal_contact_mdm' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_internal_contact  b on  (a.last_resolved_by_key = b.row_key)
join ldb.d_internal_contact_mdm c on (b.row_current_key = c.row_current_key)
UNION
SELECT 'd_internal_contact_requested_for_c' AS Table_Name,count(a.row_key) as Row_Count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_internal_contact_requested_for_c b ON (a.requested_for_c_key=b.row_key)
UNION 
select 'd_internal_organization_department' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
JOIN ldb.d_internal_organization_department c on (a.opened_by_department_key = c.row_key)
UNION 
select 'd_internal_organization_group' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_internal_organization_group    b on (a.assignment_group_key = b.row_key)
UNION 
select 'd_internal_organization_legalentity' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_internal_organization_legalentity b on(a.company_key = b.row_key)
UNION 
select 'd_location' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_location    b on (a.location_key = b.row_key)
UNION 
SELECT 'd_parent_incident' AS Table_Name,count(a.row_key) as Row_Count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_parent_incident b ON (a.parent_incident_key=b.row_key)
UNION 
select 'd_task_impact' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_task_impact b on (a.impact_src_key = b.row_key)            
union 
select 'd_task_priority' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_task_priority b on  (a.priority_src_key = b.row_key) 
union 
select 'd_task_contacttype' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_task_contacttype b on(a.reported_type_src_key = b.row_key) 
union 
select 'd_task_urgency' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.d_task_urgency b on(a.urgency_src_key = b.row_key) 
UNION 
select 'dh_assignment_group_tier_hierarchy' as Table_Name,count(a.row_key) as Row_Count
from ldb.f_incident_resolved a
join ldb.dh_assignment_group_tier_hierarchy b on (a.assignment_group_key = b.user_group_tier_key)