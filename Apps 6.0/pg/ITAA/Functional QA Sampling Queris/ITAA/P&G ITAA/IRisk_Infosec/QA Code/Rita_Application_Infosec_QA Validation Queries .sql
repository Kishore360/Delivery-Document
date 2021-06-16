 -- Rita_Application_ Infosec 


-- GDPR Application Tracker (Project Team filter)
SELECT Count(1) as CNT 
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
AND e.source_dimension_name IN ('Design/Build', 'Exception', 'Launch/Deploy', 'Leverage/Optimize', 'Qualify/Deliver', 'Retired', 'Sunset')
AND f.dimension_name IN ('High', 'Low', 'Medium')
AND c.cust_dimension_name_c IN ('Application', 'Application - Externally Owned', 'Component', 'NonDigital')
AND d.lev_1_organization_name IN 
(
'Consumer Services','FSS',
'IDQ','Information Security','IT Consumer Solutions',
'IT Customer Solutions & Delivery','IT Data & Analytics Organization',
'IT Solutions','MANAGEMENT SERVICES','Master Data Organization','MY PG SERVICES','IT IT innovation Organization',
'PS Shared Services & Technology Operations','PTW'
)
)
