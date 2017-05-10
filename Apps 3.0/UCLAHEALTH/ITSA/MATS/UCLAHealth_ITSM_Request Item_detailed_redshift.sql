SELECT 'f_request_item' AS Table_name,count(a.row_key) as Row_count 
FROM ldb.f_request_item a 
UNION 
SELECT 'd_internal_organization_group' AS Table_name,count(a.row_key) as Row_count 
FROM ldb.f_request_item a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_contact' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_contact b ON a.opened_by_key=b.row_key
UNION 
SELECT 'd_calendar_date' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_internal_contact_mdm' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_contact b on a.opened_by_key=b.row_key
JOIN ldb.d_internal_contact_mdm c on b.row_current_key=c.row_current_key
UNION 
SELECT 'd_internal_contact_assigned_to' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key
UNION
SELECT 'd_sc_req_item_approval' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_sc_req_item_approval b ON a.approval_state_src_key=b.row_key
UNION 
SELECT 'd_request_item_state' AS Table_name,count(a.row_key) as Row_count 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item_state b ON a.state_src_key=b.row_key
UNION 
SELECT 'd_request_item_stage' AS Table_name,count(a.row_key) as Row_count 
FROM ldb.f_request_item a 
JOIN ldb.d_request_item_stage b ON a.stage_src_key=b.row_key
UNION 
SELECT 'd_request_item' AS Table_name,count(a.row_key) AS Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
UNION 
SELECT 'd_request_item' AS Table_name,count(a.row_key) AS Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_request_item b ON a.request_key=b.row_key
UNION 
SELECT 'd_master_item' AS Table_name,count(a.row_key) AS Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_master_item b ON a.catalog_item_key =b.row_key
UNION 
SELECT 'd_internal_organization_department' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_organization_department b ON a.opened_by_department_key=b.row_key
UNION
SELECT 'd_internal_contact_task_closed_by' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_contact_task_closed_by b ON a.closed_by_key=b.row_key
UNION 
SELECT 'd_internal_contact_requested_for' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_internal_contact_requested_for b ON a.requested_for_key=b.row_key
UNION 
SELECt 'd_hr_change_category' AS Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_hr_change_category b ON a.hr_category_src_key=b.row_key
UNION 
SELECT 'd_hr_change' AS Table_name,count(a.row_key) as row_count
FROM ldb.f_request_item a 
JOIN ldb.d_hr_change b ON a.hr_change_key=b.row_key
UNION 
SELECT 'd_calendar_week' AS Table_name,count(a.row_key) as Row_count 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_by_key=b.row_key
JOIN ldb.d_calendar_week c on b.week_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_quarter' AS Table_name,count(a.row_count) as Row_count 
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_by_key=b.row_key
JOIN ldb.d_calendar_quarter c on b.quarter_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_month' as Table_name,count(a.row_key) as Row_count
FROM ldb.f_request_item a 
JOIN ldb.d_calendar_date b ON a.opened_by_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key









 