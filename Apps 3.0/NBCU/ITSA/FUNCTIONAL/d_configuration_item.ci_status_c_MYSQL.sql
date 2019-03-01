
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.ci_status_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM (select * from nbcu_mdsdb.cmdb_ci_appl_final) SRC
LEFT JOIN nbcu_mdwdb.d_lov LKP 
ON coalesce(CONCAT('SYSTEM_OF_RECORD','~','APPLICATION',SRC.u_operational_status),'UNSPECIFIED')=LKP.row_id
JOIN nbcu_mdwdb.d_configuration_item TRGT
  ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_operational_status IS NULL THEN 0 ELSE -1 END)
  <>TRGT.ci_status_c
)temp;
