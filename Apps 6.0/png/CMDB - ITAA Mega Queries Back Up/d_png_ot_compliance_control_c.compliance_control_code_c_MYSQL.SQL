SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_compliance_control_c.compliance_control_code_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_compliance_controls_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_compliance_control_c TRGT ON sha1(lower(SRC.Compliance_control))=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Compliance_control,'UNSPECIFIED')<>TRGT.compliance_control_code_c
AND SRC.cdctype='X'
) temp;


 