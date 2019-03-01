SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.ci_is_sso_used_as_user_id_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_lov LKP 
ON (coalesce(CONCAT('IS_SSO_USED_AS_USER_ID','~','APPLICATION~~~',SRC.u_is_sso_used_as_user_id_),'UNSPECIFIED')=LKP.row_id AND
SRC.sourceinstance=LKP.source_id)
JOIN nbcu_mdwdb.d_application TRGT
  ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
 WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_is_sso_used_as_user_id_ IS NULL THEN 0 ELSE -1 END)
  <>TRGT.ci_is_sso_used_as_user_id_c_key
)temp; 
