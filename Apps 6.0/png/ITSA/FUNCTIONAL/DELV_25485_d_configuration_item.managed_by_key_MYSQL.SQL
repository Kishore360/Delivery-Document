
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_configuration_item.managed_by_key' ELSE 'SUCCESS' END as Message
FROM
(
Select Count(1) as CNT 
From png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdwdb.d_configuration_item b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT JOIN png_mdwdb.d_internal_contact LKP on CONCAT('INTERNAL_CONTACT','~',a.managed_by)=LKP.row_id
AND a.sourceinstance=b.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.managed_by IS NULL THEN 0 ELSE -1 END)<>b.managed_by_key
AND a.cdctype='X'
) temp;


 