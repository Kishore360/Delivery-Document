SELECT 'f_rita_application_snapshot_monthly_c' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c
UNION 
SELECT 'd_processing_activities_managing_organization_c' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_processing_activities_managing_organization_c b ON a.managing_organization_c_key=b.row_key 
UNION 
SELECT 'd_application_pg_asset_owner_c' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_application_pg_asset_owner_c b ON a.rita_application_pg_asset_owner_c_key=b.row_key
UNION 
SELECT 'd_calendar_date' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
UNION 
SELECT 'd_calendar_date' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
UNION
SELECT 'd_location' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_application_pg_asset_owner_c b ON a.rita_application_pg_asset_owner_c_key=b.row_key
JOIN ldb.d_location c ON b.location_key=c.row_key 
UNION 
SELECT 'd_calendar_date' AS TABLE_NAME,Count(1) as Row_Count
FROM ldb.f_rita_application_snapshot_monthly_c a 
JOIN ldb.d_calendar_date b ON a.date_key=b.row_key 
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key



