/* d_application_gdpr_grouping_name_c
d_application_pg_asset_owner_c
d_application_pg_data_privacy_c
d_lov_mega_confident_rating_c
d_lov_privacy_assessment_status_c
d_lov_privacy_irisk_status_c
d_lov_processing_activities_ot_life_cycle_status_c
d_lov_processing_activities_ot_repository_type_c
d_processing_activities_managing_organization_c
d_rita_application_c
d_rita_application_ext_c
d_rita_application_repository_type_c
f_rita_application_c_fact */

SELECT 'ldb.f_rita_application_c_fact' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
UNION 
SELECT 'ldb.d_rita_application_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_repository_type_c c ON b.rita_application_repository_type_c_key=c.row_key
UNION 
SELECT 'ldb.d_rita_application_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'ldb.d_rita_application_ext_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_rita_application_ext_c a13 ON a12.rita_application_ext_c_key=a13.row_key
UNION 
SELECT 'ldb.d_processing_activities_managing_organization_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a11.managing_organization_c_key=a12.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c a13 ON a12.application_nature_c_key=a13.row_key
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
SELECT 'ldb.d_application_pg_data_privacy_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_application_pg_data_privacy_c a13 ON a12.application_pg_data_privacy_c_key=a13.row_key
UNION 
SELECT 'ldb.d_application_pg_asset_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_application_pg_asset_owner_c a12 ON a11.rita_application_pg_asset_owner_c_key=a12.row_key
UNION 
SELECT 'ldb.d_application_gdpr_grouping_name_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_application_gdpr_grouping_name_c a13 ON a12.gdpr_grouping_name_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_privacy_irisk_status_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
LEFT JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
LEFT JOIN ldb.d_rita_application_ext_c a13 ON a12.rita_application_ext_c_key=a13.row_key
LEFT JOIN ldb.d_lov_privacy_irisk_status_c a14 ON a13.privacy_irisk_status_c_key=a14.row_key
UNION 
SELECT 'ldb.d_lov_privacy_assessment_status_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_rita_application_ext_c a13 ON a12.rita_application_ext_c_key=a13.row_key
JOIN ldb.d_lov_privacy_assessment_status_c a14 ON a13.privacy_assessment_status_c_key=a14.row_key
 
