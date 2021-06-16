SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_unregistered_devices_clean_up_c.updated_date_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM png_mdsdb.png_tnbl_unregistered_devices_clean_up_c_final SRC 
LEFT JOIN png_mdwdb.d_unregistered_devices_clean_up_c TRGT ON SRC.tenable_discovery_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.updated_date,'UNSPECIFIED')<> TRGT.updated_date_c
AND SRC.cdctype='X'
) temp;


 