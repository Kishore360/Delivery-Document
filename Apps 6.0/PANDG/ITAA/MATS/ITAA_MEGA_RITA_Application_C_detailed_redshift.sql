/* Tables Accessed:
d_application_data_classification_c
d_application_gdpr_grouping_name_c
d_application_pg_asset_owner_c
d_application_pg_data_privacy_c
d_lov_processing_activities_ot_eu_data_stakeholders_c
d_lov_processing_activities_ot_life_cycle_status_c
d_lov_processing_activities_ot_pg_users_c
d_lov_processing_activities_ot_repository_type_c
d_lov_processing_activities_ot_third_party_users_c
d_lov_processing_activities_ot_volume_of_records_c
d_lvl1_organization_lead_c
d_lvl2_organization_lead_c
d_lvl3_organization_lead_c
d_processing_activities_managing_organization_c
d_rita_application_c
f_rita_application_c_fact  */




SELECT 'ldb.f_rita_application_c_fact' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
UNION 
SELECT 'ldb.d_rita_application_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_volume_of_records_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_volume_of_records_c a13 ON a12.volume_of_records_all_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_third_party_users_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_third_party_users_c a13 ON a12.application_total_3rd_party_with_access_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c a13 ON a12.application_nature_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_pg_users_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_pg_users_c a13 ON a12.application_total_pg_personnel_with_access_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_life_cycle_status_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c a13 ON a12.application_lifecycle_status_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_eu_data_stakeholders_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_eu_data_stakeholders_c a13 ON a12.volume_of_records_eu_c_key=a13.row_key
UNION 
SELECT 'ldb.d_application_pg_data_privacy_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_application_pg_data_privacy_c a13 ON a12.application_pg_data_privacy_c_key=a13.row_key
UNION 
SELECT 'ldb.d_processing_activities_managing_organization_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a11.managing_organization_c_key=a12.row_key
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
SELECT 'ldb.d_application_data_classification_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_application_data_classification_c a13 ON a12.application_data_classification_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lvl1_organization_lead_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a11.managing_organization_c_key=a12.row_key
JOIN ldb.d_lvl1_organization_lead_c a13 ON a12.lvl1_organization_c_key=a13.row_key
UNION 
SELECT 'ldb.d_lvl2_organization_lead_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a11.managing_organization_c_key=a12.row_key
JOIN ldb.d_lvl2_organization_lead_c a13 ON a12.lvl2_organization_c_key=a13.row_key
UNION 

SELECT 'ldb.d_lvl3_organization_lead_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a11.managing_organization_c_key=a12.row_key
JOIN ldb.d_lvl3_organization_lead_c a13 ON a12.lvl3_organization_c_key=a13.row_key
UNION 
SELECT 'ldb.d_rita_application_source_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_source_type_c c ON b.rita_application_source_type_c_key=c.row_key
UNION 
SELECT 'ldb.d_data_retention_status_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_data_retention_status_c c ON b.data_retention_status_c_key=c.row_key
UNION 
SELECT 'ldb.d_lov_pa_sub_rgt_stats_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_pa_sub_rgt_stats_c c ON b.data_subject_rights_status_c_key=c.row_key
UNION 
SELECT 'ldb.d_rita_application_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_repository_type_c c ON b.rita_application_repository_type_c_key=c.row_key
UNION 
SELECT 'ldb.d_rita_application_repository_sub_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_repository_sub_type_c c ON b.rita_application_repository_sub_type_c_key=c.row_key
UNION 
SELECT 'ldb.d_application_gdpr_grouping_name_calculated' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_application_gdpr_grouping_name_calculated c ON b.gdpr_grouping_name_calculated_key=c.row_key
/* UNION 
SELECT 'ldb.d_rita_application_managing_org_leads_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a11
JOIN ldb.d_rita_application_c a12 ON a11.rita_application_c_key=a12.row_key
JOIN ldb.d_rita_application_managing_org_leads_c a13 ON a11.rita_application_c_key=a13.row_key */
