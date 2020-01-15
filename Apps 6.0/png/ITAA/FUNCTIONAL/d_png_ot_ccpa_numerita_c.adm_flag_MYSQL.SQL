SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS d_png_ot_ccpa_numerita_c.adm_flag' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.adm_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.adm,'UNSPECIFIED')<>TRGT.adm_c_flag
AND SRC.cdctype='X'
)temp


 