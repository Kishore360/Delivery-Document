SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_configuration_item.owned_by_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.f_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',SRC.owned_by)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.owned_by IS NULL THEN 0 ELSE -1 END)<>TRGT.owned_by_key
AND SRC.cdctype<>'D'
) temp;




  