
 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_configuration_item.location_c_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT 
FROM gilead_mdsdb.cmdb_ci_final SRC
JOIN gilead_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
JOIN gilead_mdwdb.d_location LKP  
ON (COALESCE(SRC.location,'UNSPECIFIED') =LKP.row_id AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE (LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 ELSE -1 END)<> (TRGT.location_c_key) and SRC.cdctype='X')temp;