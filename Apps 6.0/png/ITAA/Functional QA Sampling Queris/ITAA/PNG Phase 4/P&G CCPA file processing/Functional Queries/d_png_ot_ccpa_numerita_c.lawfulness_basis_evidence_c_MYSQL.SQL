SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS lawfulness_basis_evidence_c' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.lawfulness_basis_evidence_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Lawfulness_Basis_Evidence IS NOT NULL AND SRC.Lawfulness_Basis_Evidence <>'',SRC.Lawfulness_Basis_Evidence,'UNSPECIFIED') 
<>TRGT.lawfulness_basis_evidence_c
AND SRC.cdctype='X'
)temp

 