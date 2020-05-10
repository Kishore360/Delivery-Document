SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS inventory_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.inventory_criteria_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Inventory_Criteria IS NOT NULL  AND SRC.Inventory_Criteria <>'',SRC.Inventory_Criteria,'UNSPECIFIED')
<>TRGT.inventory_criteria_c
AND SRC.cdctype='X'
)temp

