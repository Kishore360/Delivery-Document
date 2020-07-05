SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.hardware_pg_network_connected_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN png_mdwdb.d_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN png_mdwdb.d_lov LKP ON LKP.dimension_class='PG_NETWORK_CONNECTED_C~CMDB_CI_HARDWARE' AND SRC1.u_pg_yn_network_connected=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_yn_network_connected IS NULL THEN 0 ELSE -1 END))<>TRGT.hardware_pg_network_connected_c_key
) temp;


 