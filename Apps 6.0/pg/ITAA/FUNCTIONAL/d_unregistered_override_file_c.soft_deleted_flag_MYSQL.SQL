SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_unregistered_override_file_c.soft_deleted_flag' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
From png_mdsdb.png_tnbl_unregistered_overridefile_c_final SRC 
LEFT JOIN png_mdwdb.d_unregistered_override_file_c TRGT ON SRC.dns_name=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.cdctype='D' then 'Y'  else 'N' END <> TRGT.soft_deleted_flag
AND SRC.cdctype='X'
) temp;


 