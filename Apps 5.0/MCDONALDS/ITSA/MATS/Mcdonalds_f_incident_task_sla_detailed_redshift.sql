SELECT 'f_incident_task_sla' as Table_Name,count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
UNION
SELECT 'd_task_sla_stage' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_task_sla_stage b ON a.stage_src_key=b.row_key
UNION
SELECT 'd_task_sla' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_task_sla b ON a.sla_key=b.row_key
UNION 
SELECT 'd_incident' as Table_Name,count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION
SELECT 'd_business_service' as Table_Name,count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_scafe_core_realm_c' as Table_Name,count(a.row_key) as Row_count
FROM ldb.f_incident_task_sla a 
JOIN ldb.d_scafe_core_realm_c b ON a.scafe_core_realm_c_key=b.row_key





