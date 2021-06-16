SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS last_reviewed_on_c' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.last_reviewed_on_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE str_to_date(SRC.Last_review_date, '%Y-%m-%d') 
<>TRGT.last_reviewed_date_c
AND SRC.cdctype='X'
)temp


