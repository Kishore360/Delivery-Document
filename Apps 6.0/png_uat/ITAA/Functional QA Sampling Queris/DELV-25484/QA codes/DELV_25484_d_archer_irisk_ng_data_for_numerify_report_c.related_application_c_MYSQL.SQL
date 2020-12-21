SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_archer_irisk_ng_data_for_numerify_report_c.related_application_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
From png_mdsdb.pg_mega_archer_data_for_numerify_report_irisk_ng_c_final SRC 
LEFT JOIN png_mdwdb.d_archer_irisk_ng_data_for_numerify_report_c TRGT ON SRC.MEGA_HEX_ID=TRGT.mega_hex_id_c AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.Related_Application <>TRGT.related_application_c
AND SRC.cdctype='X';
) temp; 




