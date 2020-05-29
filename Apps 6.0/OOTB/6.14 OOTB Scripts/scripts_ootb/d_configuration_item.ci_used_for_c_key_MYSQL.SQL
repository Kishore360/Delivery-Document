SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_used_for_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM equifax_mdsdb.cmdb_ci_server_final a 
LEFT JOIN equifax_mdwdb.d_configuration_item b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN equifax_mdwdb.d_lov lkp ON 	
CONCAT('USED_FOR','~','CONFIGURATION_ITEM',a.used_for)=lkp.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(lkp.row_key, CASE WHEN a.used_for IS NULL THEN 0 ELSE -1 END)<>b.ci_used_for_c_key
) temp;
