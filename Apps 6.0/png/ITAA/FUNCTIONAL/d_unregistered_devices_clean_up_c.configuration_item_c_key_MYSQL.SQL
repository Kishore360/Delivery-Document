SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_unregistered_devices_clean_up_c.configuration_item_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.png_tnbl_unregistered_devices_clean_up_c_final SRC 
LEFT JOIN png_mdwdb.d_unregistered_devices_clean_up_c TRGT ON SRC.tenable_discovery_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_configuration_item LKP ON SRC.tenable_discovery_id=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.tenable_discovery_id IS NULL THEN 0 ELSE -1 END) <> TRGT.configuration_item_c_key
AND SRC.cdctype='X';
) temp;


