SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.cpu_manufacturer_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN png_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key from png_mdwdb.d_internal_organization) LKP ON SRC1.cpu_manufacturer=LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.cpu_manufacturer IS NULL THEN 0 ELSE -1 END))<>TRGT.cpu_manufacturer_c_key
) temp;

 