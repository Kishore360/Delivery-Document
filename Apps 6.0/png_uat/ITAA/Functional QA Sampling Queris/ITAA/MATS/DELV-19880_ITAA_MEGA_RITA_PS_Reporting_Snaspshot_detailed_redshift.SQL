SELECT 'f_rita_application_snapshot_weekly' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
UNION 
SELECT 'd_calendar_date' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
JOIN ldb.d_calendar_week c ON b.week_start_date_key=c.row_key 
UNION 
SELECT 'd_rita_application_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key 
UNION 
SELECT 'd_lov_processing_activities_ot_repository_type_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key 
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key 
UNION
SELECT 'd_rita_application_ext_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key 
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key 
UNION 
SELECT 'd_lov_processing_activities_ot_life_cycle_status_c' AS Table_Name,Count(1) as CNT 
FROM ldb.f_rita_application_snapshot_weekly a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c c ON b.data_asset_lifecycle_status_key=c.row_key 


