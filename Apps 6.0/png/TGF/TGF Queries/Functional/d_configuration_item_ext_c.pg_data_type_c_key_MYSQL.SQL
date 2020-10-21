SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.pg_data_type_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
LEFT JOIN png_mdsdb.cmdb_ci_computer_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
JOIN png_mdwdb.d_configuration_item_ext_c TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
LEFT JOIN png_mdwdb.d_lov LKP ON LKP.dimension_class='DATA_TYPE_C~CMDB_CI_COMPUTER' AND SRC1.u_pg_ii_data_type=LKP.dimension_code
WHERE COALESCE(LKP.row_key,(CASE WHEN SRC1.u_pg_ii_data_type IS NULL THEN 0 ELSE -1 END))<>TRGT.pg_data_type_c_key
) temp;

 