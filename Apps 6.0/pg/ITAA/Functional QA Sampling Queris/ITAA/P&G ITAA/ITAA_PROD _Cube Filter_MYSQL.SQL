Application_Governance_c Cube :

MEGA 
SELECT 
Count(distinct a.row_id) as cnt 
FROM ldb.f_rita_application_c_fact a
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_mega_data_currentness_c d ON c.data_currentness_c_key=d.row_key
JOIN ldb.d_lov_mega_data_correct_c e ON c.data_correct_c_key=e.row_key
JOIN ldb.d_processing_activities_managing_organization_c a12 ON a.managing_organization_c_key=a12.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c a13 ON b.application_lifecycle_status_c_key=a13.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c a14 ON b.application_nature_c_key=a14.row_key
Where 
(a14.cust_dimension_name_c IN ('Application','Application - Externally Owned','Application Platform','Application Platform - Externally Owned')
AND a13.source_dimension_name IN ('Design/Build', 'Launch/Deploy',
'Discovery/Requ.','UNSPECIFIED','Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset','Exception')
) AND a.soft_deleted_flag='N'

CMDB 
Select Count(1) as CNT
From ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c d ON b.application_nature_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c e ON b.application_lifecycle_status_c_key=e.row_key
Where c.sys_class_name_c='cmdb_ci_appl'
AND d.source_dimension_name IN ('Application','Application Platform')
AND e.source_dimension_name IN ('Design/Build', 'Launch/Deploy',
'Discovery/Requ.','UNSPECIFIED','Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset','Exception')
AND a.soft_deleted_flag='N'


Infosec Cube Filter :



SELECT 
Count(1) as CNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
JOIN ldb.d_processing_activities_managing_organization_c d ON a.managing_organization_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c  e ON b.data_asset_lifecycle_status_key=e.row_key
JOIN ldb.d_application_pg_data_privacy_c f ON b.application_pg_data_privacy_c_key=f.row_key
WHERE b.gdpr_rel_cal_overwritten='Y'
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND e.source_dimension_name IN ('Design/Build', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset','Exception')
AND c.cust_dimension_name_c IN 
('application','application_platform')
AND b.exclude_flag_c='N'



Privacy_Cube_Filter :

SELECT 
Count(1) as CNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_rita_application_ext_c ext ON b.rita_application_ext_c_key =ext.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
JOIN ldb.d_processing_activities_managing_organization_c d ON a.managing_organization_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c  e ON b.data_asset_lifecycle_status_key=e.row_key
JOIN ldb.d_application_pg_data_privacy_c f ON b.application_pg_data_privacy_c_key=f.row_key

WHERE 
( b.grace_period_c='Already in VP Tracker' AND 
b.gdpr_relevant_c_flag='Y'
AND e.source_dimension_name IN ('Design/Build', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset')
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND c.cust_dimension_name_c IN ('application','application_platform')
)

OR 
(
b.gdpr_relevant_c_flag='Y'
AND e.source_dimension_name IN 
('Design/Build','Discovery/Requ.','Launch/Deploy','Leverage/Optimize','Qualify/Deliver','Retired','Sunset','UNSPECIFIED')
AND c.cust_dimension_name_c IN ('application','application_platform')
AND b.exclude_flag_c='N'
AND EXT.sys_class_name_c='cmdb_ci_appl'
)
AND a.soft_deleted_flag='N'



