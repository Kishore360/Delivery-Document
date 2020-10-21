SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.u_pg_cloud_subscription_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_server_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN pgcmdb_mdwdb.d_configuration_item TRGT ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
WHERE COALESCE(SRC1.u_pg_cloud_subscription,'UNSPECIFIED')<>TRGT.u_pg_cloud_subscription_c
) temp;


 