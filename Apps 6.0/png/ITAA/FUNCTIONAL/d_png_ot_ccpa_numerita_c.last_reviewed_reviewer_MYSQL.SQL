SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS last_reviewed_reviewer' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.last_reviewed_reviewer' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Last_reviewed_reviewer IS NULL  OR SRC.Last_reviewed_reviewer  = '','UNSPECIFIED', SRC.Last_reviewed_reviewer) 
<>TRGT.last_reviewed_reviewer_c
AND SRC.cdctype='X'
)temp


 