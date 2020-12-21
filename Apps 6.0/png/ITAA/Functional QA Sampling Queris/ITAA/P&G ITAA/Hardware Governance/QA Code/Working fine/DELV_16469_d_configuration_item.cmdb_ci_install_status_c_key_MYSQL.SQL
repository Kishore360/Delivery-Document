
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.cmdb_ci_install_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.install_status IS NULL THEN 0 ELSE -1 END)<>TRGT.cmdb_ci_install_status_c_key
AND SRC.cdctype ='X'
) temp;




