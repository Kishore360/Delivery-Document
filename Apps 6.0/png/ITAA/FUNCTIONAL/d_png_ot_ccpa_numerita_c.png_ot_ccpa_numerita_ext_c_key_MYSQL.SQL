SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.png_ot_ccpa_numerita_ext_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c b ON a.id=b.row_id AND a.sourceinstance=b.source_id
JOIN png_mdwdb.d_png_ot_ccpa_numerita_ext_c LKP ON a.ID=LKP.row_id AND a.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.ID is NULL THEN 0 ELSE -1 END)<>b.png_ot_ccpa_numerita_ext_c_key
AND a.cdctype='X'
) temp;


 