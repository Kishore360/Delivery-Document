


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.configuration_item_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.sys_audit_final SRC 
LEFT JOIN bbandt_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN bbandt_mdwdb.d_configuration_item LKP ON (COALESCE(SRC.documentkey,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE coalesce(LKP.row_key,CASE WHEN SRC.documentkey IS NULL THEN 0 ELSE -1 END)<>TRGT.configuration_item_key
and SRC.CDCTYPE	<>'D' and TRGT.soft_deleted_flag='Y'
) temp; 


