SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.ci_connects_to_services_assets_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM  nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_lov LKP 
ON (coalesce(CONCAT('CONNECTS_TO_SERVICES_ASSESTS','~','APPLICATION~~~',SRC.u_connects_to_services_assets_),'UNSPECIFIED')=LKP.row_id AND
SRC.sourceinstance=LKP.source_id)
JOIN nbcu_mdwdb.d_application TRGT
  ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
 WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_connects_to_services_assets_ IS NULL THEN 0 ELSE -1 END)
  <>TRGT.ci_connects_to_services_assets_c_key
)temp;

