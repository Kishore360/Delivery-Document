SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.ccpa_vendor_qualification_c_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN pgrita_mdwdb.d_lov LKP ON CONCAT('OT_VENDOR_QUALIFICATION_C','~','PROCESSING_ACTIVITIES',SRC.Vendor_qualification)=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.Vendor_qualification IS NULL THEN 0 ELSE -1 END)<>TRGT.ccpa_vendor_qualification_c_key
AND SRC.cdctype='X'
) temp;


 

  