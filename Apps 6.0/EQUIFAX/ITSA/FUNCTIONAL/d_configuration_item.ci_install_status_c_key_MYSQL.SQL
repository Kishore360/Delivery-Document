SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_install_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_final a 
LEFT JOIN equifax_mdwdb.d_configuration_item b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN equifax_mdwdb.d_lov lkp ON 	
CONCAT('INSTALL_STATUS','~','CONFIGURATION_ITEM',a.install_status)=lkp.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(lkp.row_key, CASE WHEN a.install_status IS NULL THEN 0 ELSE -1 END)<>b.ci_install_status_c_key and a.cdctype<>'D'
) temp;
