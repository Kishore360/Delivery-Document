SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.owning_grouping_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT
Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE
CASE WHEN SRC.Owning_Organization_Grouping IS NULL OR SRC.Owning_Organization_Grouping =''
THEN 'UNSPECIFIED' ELSE SRC.Owning_Organization_Grouping END<>TRGT.owning_grouping_c
AND SRC.cdctype='X'
) temp



 