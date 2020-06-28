 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.division_manager_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT COUNT(1) AS CNT 
FROM 
(SELECT SRC.name,SRC.sourceinstance,
COALESCE(MAX(SRC1.u_division_manager),'UNSPECIFIED') AS Division_Manager
FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC  
JOIN bbandt_mdsdb.u_cmdb_etc_bus_unit_final SRC1 ON (SRC.u_line_of_business=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance) WHERE SRC.u_tier_rating IS NOT NULL AND SRC.u_tier_rating LIKE 'Tier%' AND SRC.u_line_of_business IS NOT NULL
group by 1,2 
) X 
JOIN bbandt_mdsdb.us_technical_health_check_c_final Y ON ( X.name=Y.row_id  AND X.sourceinstance=Y.sourceinstance)
JOIN bbandt_mdwdb.d_eit_application_c Z ON (Y.row_id=Z.row_id AND Y.sourceinstance=Z.source_id)
JOIN bbandt_mdwdb.d_internal_contact LKP ON 
(COALESCE(CONCAT('INTERNAL_CONTACT~',X.Division_Manager),'UNSPECIFIED')=LKP.row_id AND X.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN X.Division_Manager IS NULL THEN 0 ELSE -1 END)<>Z.division_manager_key
)temp;

