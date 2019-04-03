/* d_lov_mega_registration_overall_compliance_c done	
d_lov_mega_confident_rating_c done 	
d_lov_mega_availability_rating_c done 	
d_rita_application_c	done 
d_rita_application_ext_c done 	
d_lov_mega_registration_data_compliance_c	done 
d_lov_processing_activities_ot_repository_type_c	done 
d_lov_mega_data_correct_c	done 
d_lov_mega_ea_data_compliance_c	done 
d_application_pg_asset_owner_c	done 
d_lov_mega_integrity_rating_c done 
d_lov_mega_irisk_compliance_c done 
f_rita_application_c_fact  */

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
SELECT 'd_lov_mega_data_correct_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_data_correct_c d ON c.data_correct_c_key=d.row_key
UNION 
SELECT 'd_lov_mega_irisk_compliance_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_irisk_compliance_c d ON c.irisk_compliance_c_key=d.row_key
UNION 
SELECT 'd_lov_mega_integrity_rating_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_mega_integrity_rating_c c ON b.pg_bia_rating_for_integrity_c_key=c.row_key
UNION 
SELECT 'ldb.d_application_pg_asset_owner_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_application_pg_asset_owner_c b ON a.rita_application_pg_asset_owner_c_key=b.row_key
UNION 
SELECT 'd_lov_mega_ea_data_compliance_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_ea_data_compliance_c d ON c.ea_data_compliance_c_key=d.row_key
UNION 
SELECT 'ldb.d_lov_processing_activities_ot_repository_type_c' AS TABLE_NAME, COUNT(1) AS ROW_COUNT 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
UNION 
SELECT 'd_lov_mega_registration_data_compliance_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_registration_data_compliance_c d ON c.registration_data_compliance_c_key=d.row_key
UNION 
SELECT 'd_lov_mega_registration_overall_compliance_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_registration_overall_compliance_c d ON c.registration_overall_compliance_c_key=d.row_key
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
SELECT 'd_lov_mega_data_currentness_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_data_currentness_c d ON c.data_currentness_c_key=d.row_key
UNION
SELECT 'd_love_application_pg_data_privacy_new_c' AS Table_Name, Count(1) as Row_Count 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_love_application_pg_data_privacy_new_c d ON c.d_love_application_pg_data_privacy_new_c_key=d.row_key 
