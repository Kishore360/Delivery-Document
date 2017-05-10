SELECT 'f_incident_reassignment_analysis_summary_c' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
UNION 
SELECT 'd_task_priority' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_task_priority b ON a.priority_src_key=b.row_key
UNION 
SELECT 'd_task_contacttype' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_task_contacttype b ON a.reported_type_src_key=b.row_key
UNION 
SELECT 'd_internal_organization_group' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_incident_state' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_incident_state b ON a.state_src_key=b.row_key
UNION 
SELECT 'd_incident' as Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
select 'd_calendar_date' as Table_Name,count(1) as Row_Count
from ldb.f_incident_reassignment_analysis_summary_c a
join ldb.d_calendar_date    b on (a.opened_on_key = b.row_key)
UNION 
SELECT 'd_calendar_date_opened' AS Table_name,count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_calendar_date_opened b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_calendar_month_opened' AS Table_name, count(1) as Row_count
FROM ldb.f_incident_reassignment_analysis_summary_c a 
JOIN ldb.d_calendar_date_opened b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month_opened c ON b.month_start_date_key=c.row_key