SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_unregistered_devices_clean_up_c.site_name_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.png_tnbl_unregistered_devices_clean_up_c_final SRC 
LEFT JOIN png_mdwdb.d_unregistered_devices_clean_up_c TRGT ON SRC.tenable_discovery_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.site_name,'UNSPECIFIED')<> TRGT.site_name_c
AND SRC.cdctype='X'
) temp;


  