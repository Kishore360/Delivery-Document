SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.ci_Data_hosted_By_third_Party_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM  nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_lov LKP 
ON (coalesce(CONCAT('DATA_HOSTED_BY_THIRD_PARTY','~','APPLICATION~~~',SRC.u_app_data_hosted_by_3rd_party),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance=LKP.source_id)
JOIN nbcu_mdwdb.d_application TRGT
  ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
 WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_app_data_hosted_by_3rd_party IS NULL THEN 0 ELSE -1 END)
  <>TRGT.ci_Data_hosted_By_third_Party_c_key
)temp;


