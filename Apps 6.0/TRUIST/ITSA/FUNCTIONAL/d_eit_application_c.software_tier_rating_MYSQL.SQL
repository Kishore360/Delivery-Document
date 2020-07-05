SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.software_tier_rating' ELSE 'SUCCESS' END as Message 
FROM (
SELECT Count(1) AS CNT 
FROM 
(SELECT SRC.name,SRC.sourceinstance,COALESCE(MAX(SRC.u_tier_rating),'UNSPECIFIED') AS Tier_rating
FROM truist_mdsdb.cmdb_ci_spkg_final SRC  
JOIN truist_mdsdb.u_cmdb_etc_bus_unit_final SRC1 ON (SRC.u_line_of_business=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance) 
WHERE SRC.u_tier_rating IS NOT NULL AND SRC.u_tier_rating LIKE 'Tier%' AND SRC.u_line_of_business IS NOT NULL
group by 1,2 
) X 
JOIN truist_mdsdb.us_technical_health_check_c_final Y ON ( X.name=Y.row_id  AND X.sourceinstance=Y.sourceinstance)
JOIN truist_mdwdb.d_eit_application_c Z ON (Y.row_id=Z.row_id AND Y.sourceinstance=Z.source_id)
WHERE X.Tier_rating<>Z.software_tier_rating
)temp;