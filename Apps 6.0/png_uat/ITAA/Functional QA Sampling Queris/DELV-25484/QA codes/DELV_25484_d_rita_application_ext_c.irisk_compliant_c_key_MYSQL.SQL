SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.irisk_compliant_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_rita_application_ext_c d_rita_application_ext_c
LEFT JOIN 
(
SELECT 
d_rita_application_c.rita_application_ext_c_key AS rita_application_ext_c_key,
CASE  
WHEN d_rita_application_c.irisk_completion_date is not null then 'iRisk Compliant'  
WHEN lifestyle_status.dimension_name in ('Design/Build','Qualify/Deliver') AND d_rita_application_c.irisk_completion_date is null then 'iRisk Compliant' 
WHEN d_rita_application_c.irisk_completion_date is null AND (d_rita_application_ext_c.irisk_id_c is null 
or d_rita_application_ext_c.irisk_id_c = 'UNSPECIFIED') then 'iRisk Non-Compliant' 
when lifestyle_status.dimension_name in ('Launch/Deploy','Leverage/Optimize')and d_rita_application_c.irisk_completion_date is null then 'iRisk Non-Compliant' 
END AS compliant
FROM png_mdwdb.d_rita_application_c d_rita_application_c 
JOIN png_mdwdb.d_lov lifestyle_status ON d_rita_application_c.data_asset_lifecycle_status_key=lifestyle_status.row_key
JOIN png_mdwdb.d_rita_application_ext_c d_rita_application_ext_c ON d_rita_application_c.rita_application_ext_c_key=d_rita_application_ext_c.row_key
WHERE d_rita_application_c.row_key > 0 
) t_mdw_compliant_d_rita_application_c ON d_rita_application_ext_c.row_key=t_mdw_compliant_d_rita_application_c.rita_application_ext_c_key 
LEFT JOIN png_mdwdb.d_lov compliant
ON t_mdw_compliant_d_rita_application_c.compliant=compliant.dimension_code and compliant.dimension_class='WH_IRISK_COMPLIANT~MEGA_APPLICATION' 
WHERE d_rita_application_ext_c.irisk_compliant_c_key<>compliant.row_key
AND  d_rita_application_ext_c.soft_deleted_flag='N'
) temp; 





 