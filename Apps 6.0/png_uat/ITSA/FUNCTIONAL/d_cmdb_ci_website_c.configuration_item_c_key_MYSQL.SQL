SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_website_c.configuration_item_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  Count(1) as CNT
FROM png_mdsdb.cmdb_ci_web_site_final SRC
LEFT JOIN png_mdwdb.d_cmdb_ci_website_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_configuration_item LKP ON SRC.sys_id=LKP.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 ELSE -1 END)<>TRGT.configuration_item_c_key
AND SRC.cdctype='X'
) temp;



 


 