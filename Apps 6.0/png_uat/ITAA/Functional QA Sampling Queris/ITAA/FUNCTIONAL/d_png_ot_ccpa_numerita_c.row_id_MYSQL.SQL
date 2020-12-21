SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for ccpa key' 
ELSE 'SUCCESS source to target ccpakey' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
JOIN png_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON (SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_png_ot_ccpa_numerita_c pngd on(pngd.row_id = TRGT.row_id and pngd.source_id = TRGT.source_id)
where pngd.row_id <> TRGT.row_id
 ) temp;
 
 
 