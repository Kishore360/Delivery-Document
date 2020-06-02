

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_configuration_item.system_manager_c_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM gilead_mdsdb.cmdb_ci_service_final SRC
JOIN gilead_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
JOIN gilead_mdwdb.d_internal_contact LKP
ON (COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.managed_by),'UNSPECIFIED')=LKP.row_id 
AND  SRC.sourceinstance= LKP.source_id)
WHERE COALESCE (LKP.row_key,CASE WHEN SRC.managed_by IS NULL THEN 0 ELSE -1 END)<> (TRGT.system_manager_c_key))temp;