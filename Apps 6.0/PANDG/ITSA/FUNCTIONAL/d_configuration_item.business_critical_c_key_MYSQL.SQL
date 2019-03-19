


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.business_critical_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdwdb.d_configuration_item b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN png_mdwdb.d_lov lkp ON CONCAT('BUSINESS_CRITICAL_C','~','CONFIGURATION_ITEM','~~~',a.u_pg_business_criticality)=lkp.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(lkp.row_key, CASE WHEN a.u_pg_business_criticality IS NULL THEN 0 ELSE -1 END)<>b.business_critical_c_key
) temp;


