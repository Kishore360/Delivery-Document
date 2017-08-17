SELECT 'f_change_request' as Table_Name,count(1) as Row_count 
FROM ldb.f_change_request a 
UNION 
SELECT 'd_system_downtime_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_system_downtime_c b ON a.system_downtime_c_key=b.row_key
UNION 
SELECT 'd_subcategory_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_subcategory_c b ON a.subcategory_c_key=b.row_key
UNION 
SELECT 'd_schedule_type_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_schedule_type_c b ON a.schedule_type_c_key=b.row_key
UNION 
SELECT 'd_request_type_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_request_type_c b ON a.request_type_c_key=b.row_key
UNION 
SELECT 'd_originating_region_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_originating_region_c b ON a.originating_region_c_key=b.row_key
UNION 
SELECT 'd_location' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_internal_organization_group' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_organization_department' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_organization_department b ON a.requested_by_department_key=b.row_key
UNION 
SELECT 'd_internal_contact' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_contact b ON a.opened_by_key=b.row_key
UNION 
SELECT 'd_internal_contact_mdm' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_contact b ON a.opened_by_key=b.row_key
JOIN ldb.d_internal_contact_mdm c ON b.row_current_key=c.row_current_key
UNION 
SELECT 'd_internal_contact_implementing_group_area_vp_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_contact_implementing_group_area_vp_c b ON a.implementing_group_area_vp_c_key=b.row_key
UNION 
SELECT 'd_internal_contact_assigned_to' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION 
SELECT 'd_internal_contact_business_approver_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_internal_contact_business_approver_c b ON a.business_approver_c_key=b.row_key
UNION 
SELECT 'd_domain' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_domain b ON a.domain_key=b.row_key
UNION 
SELECT 'd_dbms_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_dbms_c b ON a.dbms_c_key=b.row_key
UNION 
SELECT 'd_configuration_item' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
SELECT 'd_change_request_urgency' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_urgency b ON a.urgency_src_key=b.row_key
UNION 
SELECT 'd_change_request_risk' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_risk b ON a.risk_src_key=b.row_key
UNION 
SELECT 'd_change_request_type' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_type b ON a.type_src_key=b.row_key
UNION 
SELECT 'd_change_request_state' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_state b ON a.state_src_key=b.row_key
UNION
SELECT 'd_change_request_scope' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_scope b ON a.scope_src_key=b.row_key
UNION 
SELECT 'd_change_request_priority' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_priority b ON a.priority_src_key=b.row_key
UNION 
SELECT 'd_change_request_reason' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_reason b ON a.reason_src_key=b.row_key
UNION 
SELECT 'd_change_request_reported_type' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_reported_type b ON a.reported_type_src_key=b.row_key
UNION 
SELECT 'd_change_request_review_status' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_review_status b ON a.review_status_src_key=b.row_key
UNION 
SELECT 'd_change_request' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
UNION 
SELECT 'd_change_request_category' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_category b ON a.category_src_key=b.row_key
UNION 
SELECT 'd_change_request_impact' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_change_request_impact b ON a.impact_src_key=b.row_key
UNION 
SELECT 'd_approval_state_c' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_approval_state_c b ON a.approval_state_c_key=b.row_key
UNION 
SELECT 'd_business_service' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_business_service' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
JOIN ldb.d_business_service_criticality c ON b.criticality_key=c.row_key
UNION 
SELECT 'd_business_service_used_for' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
JOIN ldb.d_business_service_used_for c ON b.used_for_src_key=c.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name, count(1) as Row_count 
FROM ldb.f_change_request a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON  b.month_start_date_key=c.row_key 