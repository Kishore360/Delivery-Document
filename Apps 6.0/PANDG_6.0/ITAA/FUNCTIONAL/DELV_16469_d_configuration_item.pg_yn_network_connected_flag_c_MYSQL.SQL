SELECT 
CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_configuration_item.pg_yn_network_connected_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.u_pg_yn_network_connected,'UNSPECIFIED')<>TRGT.pg_yn_network_connected_flag_c
AND SRC.cdctype<>'D'
) temp;

