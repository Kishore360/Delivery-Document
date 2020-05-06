SELECT 'f_rita_application_c_fact' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
UNION 
SELECT 'd_rita_application_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
UNION 
SELECT 'd_rita_application_ext_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
UNION 
SELECT 'd_rita_application_ext_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_overall_rating_c d ON c.pg_bia_rating_for_overall_c_key=d.row_key 
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
UNION 
SELECT 'ldb.d_application_pg_asset_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_application_pg_asset_owner_c b ON a.rita_application_pg_asset_owner_c_key=b.row_key
UNION 
SELECT 'd_processing_activities_managing_organization_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_processing_activities_managing_organization_c b ON a.managing_organization_c_key=b.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_life_cycle_status_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c a13 ON a12.application_lifecycle_status_c_key=a13.row_key
UNION 
SELECT 'd_lov_mega_confident_rating_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_mega_confident_rating_c c ON b.pg_bia_confidentiality_rating_c_key=c.row_key
UNION 
SELECT 'd_lov_mega_availability_rating_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_mega_availability_rating_c c ON b.pg_bia_availability_rating_c_key=c.row_key
UNION 
SELECT 'd_lov_application_pg_data_privacy_new_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_application_pg_data_privacy_new_c d ON c.application_pg_data_privacy_new_c_key=d.row_key 
UNION 
SELECT 'ldb.d_location' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_application_pg_asset_owner_c b ON a.rita_application_pg_asset_owner_c_key=b.row_key
JOIN ldb.d_location c ON b.location_key=c.row_key
UNION 
SELECT 'd_lov_mega_integrity_rating_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_mega_integrity_rating_c c ON b.pg_bia_rating_for_integrity_c_key=c.row_key
UNION 
SELECT 'ldb.d_application_data_classification_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_application_data_classification_c a13 ON a12.application_data_classification_c_key=a13.row_key
