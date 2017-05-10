select 'f_change_request' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
UNION
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  ldb.d_internal_contact  b on  (a.requested_by_key = b.row_key)
UNION 
select  'd_location' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  ldb.d_location   b on  (a.location_key = b.row_key)
UNION 
select  'ldb.d_internal_organization_group' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join  ldb.d_internal_organization_group  b on  (a.assignment_group_key = b.row_key)
UNION 
select  'd_internal_organization_department' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request a
-- JOIN ldb.d_internal_contact b ON (a.requested_by_key =b.row_key)
join ldb.d_internal_organization_department c on  (a.requested_by_department_key = c.row_key)
UNION
select 'ldb.d_internal_contact_mdm a119' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a14 on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a119 on (a14.row_current_key = a119.row_current_key) 
UNION
select  'd_internal_contact_assigned_to' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_internal_contact_assigned_to b on  (a.assigned_to_key = b.row_key)
UNION 
select  'd_domain' as Table_Name,count(a.row_key) Row_Count
from ldb.f_change_request    a
join ldb.d_domain b on  (a.domain_key = b.row_key)
UNION 
select 'd_internal_contact' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a14 on (a11.opened_by_key = a14.row_key) 
UNION 
select 'd_configuration_item' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a14 on (a11.configuration_item_key = a14.row_key) 
UNION 
select 'd_change_request_urgency' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a14 on (a11.urgency_src_key = a14.row_key)
UNION 
select 'd_change_request_type' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a14 on (a11.type_src_key = a14.row_key)
UNION 
select 'd_change_request_state' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a14 on (a11.state_src_key = a14.row_key)
UNION 
select 'd_change_request_scope' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a14 on (a11.scope_src_key = a14.row_key)
UNION 
select 'd_change_request_risk' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a14 on (a11.risk_src_key = a14.row_key)
UNION 
select 'd_change_request_review_status' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a14 on (a11.review_status_src_key = a14.row_key)
UNION 
select 'd_change_request_reported_type' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a14 on (a11.reported_type_src_key = a14.row_key)
UNION 
select 'd_change_request_reason' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a14 on (a11.reason_src_key = a14.row_key)
UNION 
select 'd_change_request_impact' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact  a14 on (a11.impact_src_key = a14.row_key)
UNION 
select 'd_change_request_priority' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority  a14 on (a11.priority_src_key  = a14.row_key)
UNION 
select 'd_change_request_approval' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval  a14 on (a11.approval_state_src_key  = a14.row_key)
UNION 
select 'd_change_request_category' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category  a14 on (a11.category_src_key = a14.row_key)
UNION 
select 'd_change_request' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 on (a11.parent_change_request_key = a14.row_key)
UNION 
select 'd_business_service' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a14 on (a11.business_service_key = a14.row_key)
UNION 
SELECT 'd_calendar_date' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c on b.month_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_quarter' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_quarter c on b.quarter_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_week' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_week c on b.week_start_date_key=c.row_key
UNION 
select 'd_business_service_criticality' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a14 on (a11.business_service_key = a14.row_key)
JOIN ldb.d_business_service_criticality d ON a14.criticality_key=d.row_key
UNION 
select 'd_business_service_used_for' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a14 on (a11.business_service_key = a14.row_key)
JOIN ldb.d_business_service_used_for b on a14.used_for_src_key=b.row_key

   







