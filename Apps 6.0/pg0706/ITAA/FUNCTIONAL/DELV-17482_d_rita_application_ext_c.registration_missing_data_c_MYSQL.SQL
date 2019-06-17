SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.registration_missing_data_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) FROM 
(
SELECT row_key , replace(replace(GROUP_CONCAT(distinct if(gap_column = 'UNSPECIFIED','00000',gap_column) order by gap_column ASC  SEPARATOR ' , '  ),', 00000',''),'00000 , ','')  as missing_attributes,
sum(gap_count) as missing_count , sum(scope_count) as scope_count
FROM 
(
-- 1
SELECT b.row_key,CASE WHEN f.managing_organization_c_key=0 THEN 'Owning Organization' ELSE 'UNSPECIFIED' END as GAP_Column,
CASE WHEN f.managing_organization_c_key = 0  THEN 1 ELSE 0 END as gap_count , 1 as scope_count 
FROM png_mdwdb.f_rita_application_c f 
JOIN png_mdwdb.d_rita_application_c a ON f.rita_application_c_key=a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key=b.row_key
UNION ALL  -- 2
SELECT b.row_key,CASE WHEN c.dimension_name IN ('UNSPECIFIED','Undecided') THEN 'Life Cycle Status' ELSE 'UNSPECIFIED' END as GAP_Column,
CASE WHEN c.dimension_name IN ('UNSPECIFIED','Undecided') THEN 1 ELSE 0 END as gap_count , 1 as scope_count 
FROM png_mdwdb.f_rita_application_c f 
JOIN png_mdwdb.d_rita_application_c a ON f.rita_application_c_key=a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key=b.row_key
JOIN png_mdwdb.d_lov c ON a.data_asset_lifecycle_status_key=c.row_key
UNION All  -- 3
SELECT b.row_key , CASE WHEN pg_application_description = 'UNSPECIFIED' or pg_application_description is NULL OR pg_application_description = '' THEN  'Application Description' ELSE 'UNSPECIFIED' END as GAP_Column ,
CASE WHEN pg_application_description = 'UNSPECIFIED' or pg_application_description is NULL OR
pg_application_description = ''
 THEN 1 ELSE 0 END as gap_count , 1 as scope_count 
FROM png_mdwdb.f_rita_application_c f 
JOIN png_mdwdb.d_rita_application_c a ON f.rita_application_c_key=a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key=b.row_key
UNION All  -- 4
SELECT b.row_key , CASE WHEN application_data_classification_c_key = 0  THEN  'Data Classification' ELSE 'UNSPECIFIED' END as GAP_Column ,
CASE WHEN application_data_classification_c_key = 0 THEN 1 ELSE 0 END as gap_count , 1 as scope_count 
FROM png_mdwdb.f_rita_application_c f 
JOIN png_mdwdb.d_rita_application_c a ON f.rita_application_c_key=a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key=b.row_key
UNION ALL  -- 5
SELECT b.row_key , CASE WHEN b.pg_sox_criticality_c = 'UNSPECIFIED' OR b.pg_sox_criticality_c is NULL THEN 'Sox Classification' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN b.pg_sox_criticality_c = 'UNSPECIFIED' OR b.pg_sox_criticality_c is NULL THEN 1 ELSE 0 END as gap_count, 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
UNION ALL -- 6
SELECT b.row_key , CASE WHEN (priv.dimension_name in ('UNSPECIFIED') and pg_hosting not in ('No Cloud: Locally Installed (Desktop)' , 'No Cloud: Locally Installed (Mobile)')) or (priv.dimension_name in ('UNSPECIFIED') AND c.dimension_name  NOT in ('XOPlatform' ,'Platform')) 
or (priv.dimension_name in ('UNSPECIFIED') AND d.dimension_name NOT in ('Discovery/Requ.')) THEN 'Data  Privacy' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN (priv.dimension_name in ('UNSPECIFIED') and pg_hosting not in ('No Cloud: Locally Installed (Desktop)' , 'No Cloud: Locally Installed (Mobile)')) or(priv.dimension_name in ('UNSPECIFIED') AND c.dimension_name  NOT in ('XOPlatform' ,'Platform')) 
or (priv.dimension_name in ('UNSPECIFIED') AND d.dimension_name NOT in ('Discovery/Requ.')) THEN 1 ELSE 0 END as gap_count, 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b 
ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.application_nature_c_key = c.row_key
JOIN png_mdwdb.d_lov d ON a.data_asset_lifecycle_status_key = d.row_key
JOIN png_mdwdb.d_lov priv ON b.application_pg_data_privacy_new_c_key = priv.row_key
UNION ALL -- 7
SELECT b.row_key , CASE WHEN (b.pg_fda_regulated_c = 'UNSPECIFIED' or b.pg_fda_regulated_c is NULL ) and c.dimension_name not in ('Discovery/Requ.') THEN  'Regulated System' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN (b.pg_fda_regulated_c = 'UNSPECIFIED' or b.pg_fda_regulated_c is NULL ) and c.dimension_name not in ('Discovery/Requ.') THEN 1 ELSE 0 END as gap_count, 1 as scope_count 
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.data_asset_lifecycle_status_key = c.row_key
UNION ALL -- 8
SELECT b.row_key , CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.') THEN 'BIA Rating for Confidentiality' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.') THEN 1 ELSE 0 END as gap_count, 1 as scope_count
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.pg_bia_confidentiality_rating_c_key = c.row_key
JOIN png_mdwdb.d_lov d ON a.data_asset_lifecycle_status_key = d.row_key
UNION ALL  -- 9
SELECT b.row_key , CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.') THEN 'BIA Score for Integrity' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.')  THEN 1 ELSE 0 END as gap_count, 1 as scope_count
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.pg_bia_rating_for_integrity_c_key = c.row_key
JOIN png_mdwdb.d_lov d ON a.data_asset_lifecycle_status_key = d.row_key
UNION ALL -- 10
SELECT b.row_key , CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.') THEN 'BIA Rating for Availability' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN c.dimension_name = 'UNSPECIFIED' or (c.dimension_name in ('not performed','UNSPECIFIED') and d.dimension_name <>'Discovery/Requ.') THEN 1 ELSE 0 END as gap_count, 1 as scope_count
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a 
ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.pg_bia_availability_rating_c_key = c.row_key
JOIN png_mdwdb.d_lov d ON a.data_asset_lifecycle_status_key = d.row_key
UNION ALL -- 11
SELECT b.row_key , CASE WHEN d.dimension_name <> 'Discovery/Requ.' and (pg_hosting is NULL or pg_hosting = 'UNSPECIFIED' or pg_hosting ='(None)' )  THEN 'Hosting' ELSE 'UNSPECIFIED' END as gap_column ,
CASE  WHEN d.dimension_name <> 'Discovery/Requ.' and (pg_hosting is NULL or pg_hosting = 'UNSPECIFIED' or pg_hosting ='(None)' ) THEN 1 ELSE 0 END as gap_count, 1 as scope_count
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key 
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov d ON a.data_asset_lifecycle_status_key = d.row_key
UNION ALL -- 12
SELECT b.row_key , CASE WHEN rita_app_software_supplier_name is NULL or rita_app_software_supplier_name = 'UNSPECIFIED'  THEN 'Vendor Software Supplier' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN  rita_app_software_supplier_name is NULL or rita_app_software_supplier_name = 'UNSPECIFIED'  THEN 1 ELSE 0 END as gap_count , 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
UNION ALL -- 13
SELECT b.row_key , CASE WHEN (b.instance_name_c is NULL or b.instance_name_c = 'UNSPECIFIED') 
and (pg_hosting not LIKE '%saas%'and pg_hosting not in ('No cloud: Locally Installed (Desktop)','No Cloud: Locally Installed (Mobile)') and c.dimension_name not in ('Discovery/Requ.','Design/Build')) 
THEN 'Instance' ELSE 'UNSPECIFIED' END as gap_column , CASE WHEN (b.instance_name_c is NULL or b.instance_name_c = 'UNSPECIFIED') and (pg_hosting not LIKE '%saas%' and pg_hosting not in ('No cloud: Locally Installed (Desktop)','No Cloud: Locally Installed (Mobile)') and c.dimension_name not in ('Discovery/Requ.','Design/Build'))  THEN 1 ELSE 0 END as gap_count , 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
JOIN png_mdwdb.d_lov c ON a.data_asset_lifecycle_status_key = c.row_key
UNION ALL -- 14
SELECT b.row_key , CASE WHEN application_nature_c_key = 0  THEN 'Application/Technology Nature' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN  application_nature_c_key = 0  THEN 1 ELSE 0 END as gap_count , 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
UNION ALL  -- 15
SELECT b.row_key , CASE WHEN data_asset_name is NULL or data_asset_name = 'UNSPECIFIED'  THEN 'Application Name' ELSE 'UNSPECIFIED' END as gap_column ,
CASE WHEN  data_asset_name is NULL or data_asset_name = 'UNSPECIFIED'  THEN 1 ELSE 0 END as gap_count , 1 as scope_count  
FROM png_mdwdb.f_rita_application_c fct 
JOIN png_mdwdb.d_rita_application_c a ON fct.rita_application_c_key = a.row_key
JOIN png_mdwdb.d_rita_application_ext_c b ON a.rita_application_ext_c_key = b.row_key
) a WHERE a.row_key > 0 
GROUP by 1
) SRC 
JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.row_key=TRGT.row_key
WHERE if(SRC.missing_attributes = '00000','',missing_attributes)<>TRGT.registration_missing_data_c

) temp;


