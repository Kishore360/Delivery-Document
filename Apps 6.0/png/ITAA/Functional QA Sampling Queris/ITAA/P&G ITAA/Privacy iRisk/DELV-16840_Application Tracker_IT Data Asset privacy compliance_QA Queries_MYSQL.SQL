Source Tables : 
1. pg_mega_privacy_legacy_irisk_c_final
2. pg_mega_privacy_legacy_non_irisk_final
3. pg_mega_privacy_irisk_pia_checklist_status_final



Table Name : d_rita_application_ext_c
Columns : 
privacy_exists_in_irisk_flag_c 
privacy_exists_in_irisk_legacy_flag_c
privacy_assessment_status_c_key (LOV)	
privacy_iRisk_Status_c_key	(LOV) 
privacy_exists_in_legacy_flag_c 
privacy_category 
privacy_created_c 
privacy_due_date_c 
privacy_submitter_c	
privacy_submitted_on_c	
privacy_prv_0018_c	
privacy_pia_dpia_risk_c


-- GDPR Project Team Filter 
SELECT 
Count(1) as CNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
JOIN ldb.d_processing_activities_managing_organization_c d ON a.managing_organization_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c  e ON b.data_asset_lifecycle_status_key=e.row_key
JOIN ldb.d_application_pg_data_privacy_c f ON b.application_pg_data_privacy_c_key=f.row_key
WHERE 
(
b.grace_period_c='Already in VP Tracker'
AND b.gdpr_rel_cal_overwritten='Y'
AND e.source_dimension_name IN ('Design/Build', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset')
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND c.cust_dimension_name_c IN ('Application', 'Application - Externally Owned', 'Component', 'NonDigital')
AND d.lev_1_organization_name IN 
('Consumer Services','FSS','IDQ','Information Security','IT Consumer Solutions','IT Customer Solutions & Delivery','IT Data & Analytics Organization',
'IT IT Innovation Organization','IT Solutions','MANAGEMENT SERVICES','Master Data Organization','MY PG SERVICES','PS Shared Services & Technology Operations',
'PTW')
AND a.soft_deleted_flag='N'
)


-- GDPR Local Region Filter 


SELECT
Count(1) as CNT 
FROM ldb.f_rita_application_c_fact a 
JOIN ldb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
JOIN ldb.d_lov_processing_activities_ot_repository_type_c c ON b.application_nature_c_key=c.row_key
JOIN ldb.d_processing_activities_managing_organization_c d ON a.managing_organization_c_key=d.row_key
JOIN ldb.d_lov_processing_activities_ot_life_cycle_status_c  e ON b.data_asset_lifecycle_status_key=e.row_key
JOIN ldb.d_application_pg_data_privacy_c f ON b.application_pg_data_privacy_c_key=f.row_key
WHERE
(
b.gdpr_relevant_c_flag='Y'
AND e.source_dimension_name IN 
('Design/Build','Discovery/Requ.','Launch/Deploy','Leverage/Optimize','Qualify/Deliver','Retired','Sunset','UNSPECIFIED')
AND c.cust_dimension_name_c IN ('Application','Application - Externally Owned','Application Platform','Application Platform - Externally Owned'	
'Component','Instance','NonDigital','Release')
AND d.lev_1_organization_name IN ('CF-Brand','CF-F&A','CF-HR','CF-Legal','CF-PS','CF-SLS',
'GBU-Beauty','R&D (General)','SMO-Asia Pacific','SMO-EUROPE','SMO-GREATER CHINA',
'SMO-IMEA','SMO-LA','SMO-NA','UNSPECIFIED')
)



==========================

-- UNION of GDPR Project Team Filter  AND GDPR Local Region Filter 

Updated in 22-MAY-2019 and correct one 
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
(
b.grace_period_c NOT IN ('UNSPECIFIED')
-- 'Already in VP Tracker'
AND b.gdpr_relevant_c_flag='Y'
AND e.source_dimension_name IN ('Design/Build', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset')
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND c.cust_dimension_name_c IN ('Application','Application - Externally Owned','Application Platform','Application Platform - Externally Owned')
AND d.lev_1_organization_name IN 
('Consumer Services','FSS','IDQ','Information Security','IT Consumer Solutions','IT Customer Solutions & Delivery','IT Data & Analytics Organization',
'IT IT Innovation Organization','IT Solutions','MANAGEMENT SERVICES','Master Data Organization','MY PG SERVICES','PS Shared Services & Technology Operations',
'PTW')
)

OR 
(
b.gdpr_relevant_c_flag='Y'
AND e.source_dimension_name IN 
('Design/Build','Discovery/Requ.','Launch/Deploy','Leverage/Optimize','Qualify/Deliver','Retired','Sunset','UNSPECIFIED')
AND c.cust_dimension_name_c 
IN ('Application','Application - Externally Owned','Application Platform','Application Platform - Externally Owned')
AND d.lev_1_organization_name IN ('CF-Brand','CF-F&A','CF-HR','CF-Legal','CF-PS','CF-SLS',
'GBU-Beauty','R&D','SMO-Asia Pacific','SMO-EUROPE','SMO-GREATER CHINA',
'SMO-IMEA','SMO-LA','SMO-NA','UNSPECIFIED')
)
AND a.soft_deleted_flag='N'




